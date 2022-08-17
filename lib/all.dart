// ignore_for_file: prefer_const_constructors_in_immutables
import 'constants.dart';
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
    // TODO: how to use flex?
    final w = MediaQuery.of(context).size.width;
    return Flex(
      direction: Axis.horizontal,
      children: const [
        Expanded(
          flex: 1,
          child: Home(),
        ),
        Expanded(
          flex: 2,
          child: Video(),
        ),
      ],
    );
  }
}
