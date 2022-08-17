// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() {
      _controller = VideoPlayerController.network(
          'https://qvs-live-hls.7g.jmxiazai.com:447/2xenzwm84dhv1/20220815202308150001.m3u8')
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
      _controller.play();
      _controller.setVolume(0.0);
  }

  // Future<void> _onRefresh() async {
  //   _getData();
  //   await Future.delayed(const Duration(milliseconds: 2000), () {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: ListView(
          padding:const EdgeInsets.fromLTRB(0, 0, 0, 100),
          children: <Widget>[
      SizedBox(
        height: 1000,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 3, 46, 140),
                  width: 4.0,
                ),
              ),
              child: Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : _getMoreWidget(),
              ),
            ),
          ],
        ),
      )
    ]));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
