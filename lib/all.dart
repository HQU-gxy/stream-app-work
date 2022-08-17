// ignore_for_file: prefer_const_constructors_in_immutables
import 'home.dart';
import 'video.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class All extends StatefulWidget {
  All({Key? key}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  final channel =
      IOWebSocketChannel.connect("ws://123.56.194.114:8081/UserWebSocket/user");
  //初始化，连接websocket
  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      height: 1000,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 390,
            height: 1000,
            color: const Color.fromARGB(255, 3, 46, 140),
            child: const Home(),
          ),
          Container(
            height: 1000,
            width: 1401,
            color: const Color.fromARGB(255, 3, 46, 140),
            child: const Video(),
          ),
        ],
      ),
    );
  }
}
