import 'dart:async';
import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:work2/components/btn.dart';
import 'package:work2/venData.dart';
import 'constants.dart';
import 'logger.dart';
import 'controlObj.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_socket_channel/io.dart';
import 'package:quiver/iterables.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class VenCtl extends GetxController {
  final venData = VenData.newDefault().obs;
  VenData getVenData() {
    return venData.value;
  }
}

class _HomeState extends State<Home> {
  final channel =
      IOWebSocketChannel.connect("ws://123.56.194.114:8081/UserWebSocket/user");
  final ctl = Get.put(VenCtl());
  // The second map is a hack to tell it's a non null type

  final List<String> controlLst = [
    'doorheight',
    'windspeed',
    'airvalve',
    'ai1',
    'ai2',
    'light',
    'spray'
  ];

  final List<IMap<String, String>> controlMap = [
    {"picture": "images/1.png", "name": "提高风速"},
    {"picture": "images/2.png", "name": "降低风速"},
    {"picture": "images/3.png", "name": "最高风速"},
    {"picture": "images/4.png", "name": "自动"},
    {"picture": "images/5.png", "name": "门升高"},
    {"picture": "images/6.png", "name": "门下降"},
    {"picture": "images/7.png", "name": "门停止"},
    {"picture": "images/8.png", "name": "开灯"}
  ].map((e) => e.lock).toList();

  // late final m = controlMap
  //     .zip<String, IMap<String, String>>(controlLst, (m, s) => m.add("apiName", s));

  late List<VoidCallback> actions = [
    // windup
    () {
      final state = ctl.getVenData();
      print("state is ${state}");
      if (state.speed < 20){
        final newState = state.copyWith(speed: state.speed + 1);
        channel.sink.add(newState.toString());
      }
    },
    () {
      final state = ctl.getVenData();
      if (state.speed > 0 ){
        final newState = state.copyWith(speed: state.speed - 1);
        channel.sink.add(newState.toString());
      }
    },
    () {
      // max
      final state = ctl.getVenData();
      final newState = state.copyWith(speed: 20);
      channel.sink.add(newState.toString());
    },
    () {
      // auto
      // not sure what to do
      final state = ctl.getVenData();
      final newState = state.copyWith(mode: 1);
      channel.sink.add(newState.toString());
    },
    () {
      // door up
      final state = ctl.getVenData();
      if (state.distance < 20){
        final newState = state.copyWith(distance: state.distance + 1);
        channel.sink.add(newState.toString());
      }
    },
    () {
      // door down
      final state = ctl.getVenData();
      if (state.distance > 0){
        final newState = state.copyWith(mode: 1);
        channel.sink.add(newState.toString());
      }
    },
    () {
      //  no idea what this is
      // how do you control the open and close of door?
      // final state = ctl.getVenData();
      // final newState = state.copyWith(mode: 1);
      // channel.sink.add(newState.toString());
    },
    () {
      final state = ctl.getVenData();
      final newState = state.copyWith(isLightOpen: !state.isLightOpen);
      channel.sink.add(newState.toString());
    }
  ];

  late List<ControlObject> controlObjects = controlMap
      .map((item) => ControlObject(item["picture"]!, item["name"]!))
      .toList();

  @override
  void initState() {
    actions.asMap().forEach((idx, value) {
      controlObjects[idx].onPressed = (() => setState(() => value()));
    });
    late final ven = channel.stream.map((event) {
      if (event is String){
        final val = VenData.fromString(event);
        if (val != null){
          print("receive data: $val");
        } else {
          print("unknown message: $event");
        }
        return VenData.fromString(event);
      } else {
        print("unknown message: $event");
        return null;
      }
    }).where((element) => element != null).map((e) => e!);
    ctl.venData.bindStream(ven);

    // ensure only landscape orientation
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    super.initState();
  }

  _postDateWithIndex(value, int n) async {
    final response = await Dio().get(
        'http://123.56.194.114:8081/api/device-data/send-command-data?shujv=${controlLst[n]}:$value');
    logger.d(response.data);
  }
  // 2085134861/2085176893/a23.2/63.8/548/34/1060/0/0/0/0/0/0/0/0s

  @override
  Widget build(BuildContext context) {
    final cardDecoration = BoxDecoration(
        color: const Color.fromARGB(255, 53, 91, 162),
        border: Border.all(width: 2.0, color: Colors.white24),
        borderRadius: const BorderRadius.all(Radius.circular(10)));

    // TODO: refactor this three card
    final windSpeedCard = Container(
      decoration: cardDecoration,
      margin: const EdgeInsets.fromLTRB(3, 0, 3, 3),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            bottom: 10,
            child: Image.asset(
              'images/wind_speed.png',
              fit: BoxFit.fill,
              scale: 2,
            ),
          ),
          // TODO: toFixed
          Obx(()=>
              Center(
                child: Text(
                  '${ctl.venData.value.speed}',
                  style: const TextStyle(fontSize: 85, color: Colors.white),
                ),
              ),
          ),
          const Positioned(
            right: 10,
            bottom: 10,
            child: Text('m/s',
                style: TextStyle(fontSize: 30, color: Colors.white)),
          )
        ],
      ),
    );

    final airValveCard = Container(
      decoration: cardDecoration,
      margin: const EdgeInsets.all(3.0),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            bottom: 10,
            child: Image.asset(
              'images/air_valve.png',
              fit: BoxFit.fill,
              scale: 2,
            ),
          ),
          Obx(()=>
              Positioned(
                  right: 30,
                  bottom: 25,
                  child: Text(
                    '${ctl.venData.value.angle}',
                    style: const TextStyle(fontSize: 45, color: Colors.white),
                  )),
          ),
          const Positioned(
            right: 5,
            top: 0,
            child:
                Text('°', style: TextStyle(fontSize: 30, color: Colors.white)),
          )
        ],
      ),
    );

    final doorHeightCard = Container(
      decoration: cardDecoration,
      margin: const EdgeInsets.all(3.0),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            bottom: 10,
            child: Image.asset(
              'images/door_height.png',
              fit: BoxFit.fill,
              scale: 2,
            ),
          ),
          Obx(()=>
              Positioned(
                  right: 30,
                  bottom: 25,
                  child: Text(
                    '${ctl.venData.value.distance}',
                    style: const TextStyle(fontSize: 45, color: Colors.white),
                  )),
          ),
          const Positioned(
            right: 5,
            top: 0,
            child:
                Text('cm', style: TextStyle(fontSize: 15, color: Colors.white)),
          )
        ],
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        backgroundColor: AppColors.main,
        leading: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.main)),
          child: const Icon(Icons.settings),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/setting',
            );
          },
        ),
        actions: [
          Row(
            children: <Widget>[
              const Text(
                '喷雾',
              ),
              IconButton(
                icon: const Icon(Icons.rss_feed_rounded),
                onPressed: () {
                  final state = ctl.venData.value;
                  final newState = state.copyWith(mode: 1);
                  channel.sink.add(newState.toString());
                },
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // TODO: refactor this shit until I have time
          // DON'T USE MAGIC NUMBERS
          children: [
            Expanded(
              flex: 2,
              child: windSpeedCard,
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: doorHeightCard,
                  ),
                  Expanded(
                    child: airValveCard,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StupidButton(object: controlObjects[0]),
                  StupidButton(object: controlObjects[1]),
                  StupidButton(object: controlObjects[2]),
                  StupidButton(object: controlObjects[3]),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StupidButton(object: controlObjects[4]),
                  StupidButton(object: controlObjects[5]),
                  StupidButton(object: controlObjects[6]),
                  StupidButton(object: controlObjects[7]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
