import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:work2/components/btn.dart';
import 'constants.dart';
import 'logger.dart';
import 'controlObj.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_socket_channel/io.dart';
import 'package:quiver/iterables.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  num doorHeight = 0;
  double windSpeed = 0.00;
  num airValve = 0;
  bool ai1 = false, ai2 = false, light = false, spray = false, undo = false;
  final channel =
      IOWebSocketChannel.connect("ws://123.56.194.114:8081/UserWebSocket/user");

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
    () {
      if (windSpeed < 20) {
        windSpeed++;
      }
      _postDateWithIndex(windSpeed, 1);
    },
    () {
      if (windSpeed > 0) {
        windSpeed--;
      }
      _postDateWithIndex(windSpeed, 1);
    },
    () {
      windSpeed = 20;
      _postDateWithIndex(windSpeed, 1);
    },
    () {
      ai1 = !ai1;
      _postDateWithIndex(ai1, 3);
    },
    () {
      if (doorHeight < 20) {
        doorHeight++;
      }
      _postDateWithIndex(doorHeight, 0);
    },
    () {
      if (doorHeight > 0) {
        doorHeight--;
      }
      _postDateWithIndex(doorHeight, 0);
    },
    () {
      ai2 = !ai2;
      _postDateWithIndex(ai2, 4);
    },
    () {
      light = !light;
      _postDateWithIndex(light, 5);
    }
  ];

  late List<ControlObject> controlObjects =
      controlMap.map((item) => ControlObject(item["picture"]!, item["name"]!)).toList();

  //初始化，连接websocket
  @override
  void initState() {
    actions.asMap().forEach((idx, value) {
      controlObjects[idx].onPressed = (() => setState(() => value()));
    });
    _socket();

    // ensure only landscape orientation
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    super.initState();
  }

  void _socket() async {
    // ignore: close_sinks
    WebSocketChannel channel = IOWebSocketChannel.connect(
        "ws://123.56.194.114:8081/UserWebSocket/user");
    //监听函数
    channel.stream.listen((event) {
      // ignore: avoid_print
      print(event);
    }, //监听服务器消息
        onError: (error) {
      // ignore: avoid_print
      print("服务器连接错误");
    }, //连接错误时调用
        onDone: () {
      // ignore: avoid_print
      print("服务器已关闭");
    }, //关闭时调用
        cancelOnError: true //设置错误时取消订阅
        );
  }

  _postDateWithIndex(value, int n) async {
    final response = await Dio().get(
        'http://123.56.194.114:8081/api/device-data/send-command-data?shujv=${controlLst[n]}:$value');
    logger.d(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        backgroundColor: AppColors.main,
        leading: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  AppColors.main)),
          child: const Icon(Icons.settings),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/setting',
            );
          },
        ),
        centerTitle: true,
        actions: [
          Row(
            children: <Widget>[
              const Text(
                '喷雾',
              ),
              IconButton(
                icon: const Icon(Icons.rss_feed_rounded),
                onPressed: () {
                  spray = !spray;
                  if (spray) {
                    _postDateWithIndex("mac1/mac2smoke1", 6);
                  } else {
                    _postDateWithIndex("mac1/mac2smoke0", 6);
                  }
                },
              ),
              const SizedBox(
                width: 20,
              )
            ],
          )
        ],
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // TODO: refactor this shit until I hove time
          // DON'T USE MAGIC NUMBERS
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 53, 91, 162),
                                  //边框
                                  border: Border.all(
                                      width: 2.0, color: Colors.white24),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              height: 100,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: SizedBox(
                                      height: 50,
                                      width: 80,
                                      child: Image.asset(
                                        'images/wind_speed.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '$windSpeed',
                                      style: const TextStyle(
                                          fontSize: 85, color: Colors.white),
                                    ),
                                  ),
                                  const Positioned(
                                    right: 42,
                                    top: 116,
                                    child: Text('m/s',
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white)),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 53, 91, 162),
                            //边框
                            border: Border.all(width: 2.0, color: Colors.white24),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                        height: 100,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 10,
                              bottom: 10,
                              child: SizedBox(
                                height: 37,
                                width: 60,
                                child: Image.asset(
                                  'images/door_height.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                                right: 30,
                                bottom: 25,
                                child: Text(
                                  '$doorHeight',
                                  style: const TextStyle(
                                      fontSize: 45, color: Colors.white),
                                )),
                            const Positioned(
                              right: 5,
                              top: 0,
                              child: Text('cm',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 53, 91, 162),
                          //边框
                          border:
                          Border.all(width: 2.0, color: Colors.white24),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                      height: 100,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 10,
                            bottom: 10,
                            child: SizedBox(
                              height: 37,
                              width: 60,
                              child: Image.asset(
                                'images/air_valve.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                              right: 30,
                              bottom: 25,
                              child: Text(
                                '$airValve',
                                style: const TextStyle(
                                    fontSize: 45, color: Colors.white),
                              )),
                          const Positioned(
                            right: 5,
                            top: 0,
                            child: Text('°',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white)),
                          )
                        ],
                      ),
                    ),
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
