import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoItem extends StatefulWidget {
  final String videoUrl;

  VideoItem({required this.videoUrl});

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      aspectRatio: 16 / 9,
      looping: true,
    );
  }

  void _videoIni() async {
    _videoPlayerController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(controller: _chewieController),
        )
      ],
    );
  }

  // late VideoPlayerController _videoPlayerController;
  // late ChewieController _chewieController;
  // late Future<void> _initializeVideoPlayerFuture;

  // @override
  // void initState() {
  //   super.initState();
  //   // _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
  //   // _initializeVideoPlayerFuture = _videoPlayerController.initialize();
  //   // _videoPlayerController.setLooping(true);
  //   // _videoPlayerController.play();
  //   // _videoPlayerController.play();
  //   // ignore: deprecated_member_use
  //   _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
  //   _chewieController = ChewieController(
  //     videoPlayerController: _videoPlayerController,
  //     // autoInitialize: true,
  //     showControls: false,
  //     autoPlay: false,
  //     looping: true,
  //     // You can customize the video player UI here as needed
  //   );
  // }

  // @override
  // void dispose() {
  //   _videoPlayerController.dispose();
  //   super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return
  //       //  FutureBuilder(
  //       //   future: _initializeVideoPlayerFuture,
  //       //   builder: (context, snapshot) {
  //       //     if (snapshot.connectionState == ConnectionState.done) {
  //       //       return Container(
  //       //         height: 200,
  //       //         width: 200,
  //       //         child: AspectRatio(
  //       //             aspectRatio: 16 / 9,
  //       //             child: Chewie(controller: _chewieController)),
  //       //       );
  //       //     } else {
  //       //       return Center(child: CircularProgressIndicator());
  //       //     }
  //       //   },
  //       // );
  //       // return Container(
  //       //     height: 200,
  //       //     width: 200,
  //       //     child: AspectRatio(
  //       //       aspectRatio: _videoPlayerController.value.aspectRatio,
  //       //       child: VideoPlayer(_videoPlayerController),
  //       //     ));
  //       Container(
  //           height: 200,
  //           width: 200,
  //           child: Chewie(controller: _chewieController));
  // }
}
