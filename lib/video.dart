// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:work2/constants.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _getData(
        'https://qvs-live-hls.7g.jmxiazai.com:447/2xenzwm84dhv1/20220815202308150001.m3u8');
    super.initState();
  }

  void _getData(String address) {
    _controller = VideoPlayerController.network(address)
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
        body: Container(
      decoration: _controller.value.isInitialized
          ? const BoxDecoration(color: Colors.black)
          : const BoxDecoration(color: AppColors.main),
      child: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : _loadingWidget(),
      ),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _loadingWidget() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '加载中...',
            style: TextStyle(
              color: Colors.white // TODO: use theme
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CircularProgressIndicator(color: Colors.blue.shade200, backgroundColor: Colors.blue.shade900,)
        ],
      ),
    );
  }
}
