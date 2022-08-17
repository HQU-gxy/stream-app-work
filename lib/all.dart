// ignore_for_file: prefer_const_constructors_in_immutables
import 'constants.dart';
import 'home.dart';
import 'video.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class All extends StatelessWidget {
  const All({Key? key}) : super(key: key);

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
