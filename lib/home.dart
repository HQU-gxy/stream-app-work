import 'package:dio/dio.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:work2/components/btn.dart';
import 'utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_socket_channel/io.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  num doorheight = 0;
  double windspeed = 0.00;
  num airvalve = 0;
  bool ai1 = false, ai2 = false, light = false, spray = false, undo = false;
  final channel =
      IOWebSocketChannel.connect("ws://123.56.194.114:8081/UserWebSocket/user");

  late List<VoidCallback> actions = [
    () {
      if (windspeed < 20) {
        windspeed++;
      }
      _postDate(windspeed, 1);
    },
    () {
      if (windspeed > 0) {
        windspeed--;
      }
      _postDate(windspeed, 1);
    },
    () {
      windspeed = 20;
      _postDate(windspeed, 1);
    },
    () {
      ai1 = !ai1;
      _postDate(ai1, 3);
    },
    () {
      if (doorheight < 20) {
        doorheight++;
      }
      _postDate(doorheight, 0);
    },
    () {
      if (doorheight > 0) {
        doorheight--;
      }
      _postDate(doorheight, 0);
    },
    () {
      ai2 = !ai2;
      _postDate(ai2, 4);
    },
    () {
      light = !light;
      _postDate(light, 5);
    }
  ];

  //初始化，连接websocket
  @override
  void initState() {
    actions.asMap().forEach((idx, value) {
      controlObjects[idx].onPressed = (() => setState(() => value));
    });
    _socket();
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

  _postDate(value, int n) async {
    String date = value.toString();
    try {
      final response = await Dio().get(
          'http://123.56.194.114:8081/api/device-data/send-command-data?shujv=${controlLst[n]}:$date');
      // ignore: avoid_print
      print(response.data);
      // ignore: avoid_print
      print(date);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 46, 140),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 46, 140),
        leading: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 3, 46, 140))),
          child: const Icon(Icons.settings),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/setting',
            );
          },
        ),
        centerTitle: true,
        title: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 3, 46, 140))),
          onPressed: (() {
            setState(() {
              undo = !undo;
              if (undo) {
                // 强制横屏
                WidgetsFlutterBinding.ensureInitialized();
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight
                ]);
              } else {
                WidgetsFlutterBinding.ensureInitialized();
                // 强制竖屏
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown
                ]);
              }
            });
          }),
          child: const Icon(Icons.screen_rotation),
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
                  spray = !spray;
                  if (spray) {
                    _postDate("mac1/mac2smoke1", 6);
                  } else {
                    _postDate("mac1/mac2smoke0", 6);
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
      body: ListView(padding: const EdgeInsets.all(20), children: <Widget>[
        SizedBox(
          height: 700,
          child: Column(
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
                                    '$windspeed',
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
              const SizedBox(
                height: 10,
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
                                '$doorheight',
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
                                  '$airvalve',
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
                flex: 1,
                child: Row(
                  children: <Widget>[
                    StupidButton(object: controlObjects[0]),
                    StupidButton(object: controlObjects[1]),
                    StupidButton(object: controlObjects[2]),
                    StupidButton(object: controlObjects[3]),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
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
        )
      ]),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
