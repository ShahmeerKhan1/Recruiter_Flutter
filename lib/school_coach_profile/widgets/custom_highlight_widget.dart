import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:video_player/video_player.dart';

import 'video_controller.dart';

class CustomHighlightWidget extends StatefulWidget {

  const CustomHighlightWidget({Key? key}) : super(key: key);

  @override
  _CustomHighlightWidgetState createState() => _CustomHighlightWidgetState();
}

class _CustomHighlightWidgetState extends State<CustomHighlightWidget> {

  late VideoPlayerController _videoPlayerController;
  late Future<void> videoPlayerFuture;

  //
  // List<VideoPlayerController> _vidControllers = [];
  //
  // List<String> urls = [
  //   "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  //   "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  //   "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  // ];

  @override
  void initState() {
    super.initState();

    // urls.forEach((element) {
    //   _vidControllers.add(VideoPlayerController.network(element));

    _videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      // closedCaptionFile: _loadCaptions(),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    //
    _videoPlayerController.addListener(() {
      setState(() {});
    });
    _videoPlayerController.setLooping(true);
    _videoPlayerController.initialize();

    // void _playVideos() {
    //   _vidControllers.forEach((controller) {
    //     controller
    //       ..initialize().then((_) {
    //         setState(() {});
    //       });
    //    // controller.value.isPlaying ? controller.pause() : controller.play();
    //   });
    // }
    //
    // bool isVideosPlaying() {
    //   for (VideoPlayerController controller in _vidControllers) {
    //     if (controller.value.isPlaying) {
    //       return true;
    //     }
    //   }
    //   return false;
    // }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => HighlightDetail(
                            videoPlayerController: _videoPlayerController)));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xFF111111),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/drawer_img.png'),
                            radius: 28,
                          ),
                          SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                //  color: Colors.blue,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Martin Mangram ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '- ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      '1m',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Spacer(),
                                    Icon(Icons.more_horiz, color: Colors.white),
                                    //     IconButton(
                                    //         onPressed: () {},
                                    //         icon: Icon(Icons.more_horiz))
                                  ],
                                ),
                              ),
                              //  SizedBox(height: 4),
                              Text(
                                'Watch my latest video!\nThanks to @sportsvideo for the awesome\nedit!',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: Container(
                         // alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Image.asset('assets/highlight_img.png'),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Row(
                                 //   crossAxisAlignment: CrossAxisAlignment.center,
                                 //   mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('2019/2020\nHighlights',
                                            style: TextStyle(color: Color(0xFFE8F667), fontSize: 18.0)),
                                        SizedBox(width: 16),
                                        Container(
                                          height: 55,
                                          width: 55,
                                          alignment: Alignment.center,
                                          decoration: new BoxDecoration(
                                            color: Color(0xFF707070),
                                            shape: BoxShape.circle,
                                          ),
                                          // color: Colors.black26,
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                            size: 50.0,
                                            semanticLabel: 'Play',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.favorite,
                                  color: AppColor.greyBorderColor, size: 20),
                              SizedBox(width: 2),
                              Text(
                                '1.1k',
                                style:
                                    TextStyle(color: AppColor.greyBorderColor),
                              )
                            ],
                          ),
                          SizedBox(width: 26),
                          Row(
                            children: [
                              Icon(Icons.comment,
                                  color: AppColor.greyBorderColor, size: 20),
                              SizedBox(width: 2),
                              Text('1.1k',
                                  style: TextStyle(
                                      color: AppColor.greyBorderColor))
                            ],
                          ),
                          SizedBox(width: 26),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: AppColor.greyBorderColor, size: 20),
                              SizedBox(width: 2),
                              Text('1.1k',
                                  style: TextStyle(
                                      color: AppColor.greyBorderColor))
                            ],
                          ),
                          // SizedBox(width: 16),
                          Spacer(),
                          Icon(Icons.share,
                              color: AppColor.greyBorderColor, size: 20),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class HighlightDetail extends StatelessWidget {
  final VideoPlayerController videoPlayerController;

  const HighlightDetail({Key? key, required this.videoPlayerController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoPlayer(videoPlayerController),
                  ControlsOverlay(controller: videoPlayerController),
                  VideoProgressIndicator(videoPlayerController,
                      allowScrubbing: true)
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

// video player code

//height: MediaQuery.of(context).size.height * 0.48, -> container height
// Expanded(
// child: Center(
// child: Stack(
// children: [
// Image.asset('assets/highlight_img.png'),
// ],
// )
// // child: _videoPlayerController.value.isInitialized
// //     ? AspectRatio(
// //         aspectRatio:
// //             _videoPlayerController.value.aspectRatio,
// //         child: Stack(
// //           alignment: Alignment.bottomCenter,
// //           children: [
// //             VideoPlayer(_videoPlayerController),
// //             ControlsOverlay(
// //                 controller: _videoPlayerController),
// //             VideoProgressIndicator(
// //                 _videoPlayerController,
// //                 allowScrubbing: true)
// //           ],
// //         ),
// //       )
// //  : Center(child: CircularProgressIndicator()),
// ),
// ),
