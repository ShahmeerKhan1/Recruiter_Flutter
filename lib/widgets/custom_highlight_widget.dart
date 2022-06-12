import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/comment_widget.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';
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
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: const Color(0xFF111111),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/drawer_img.png'),
                            radius: 28,
                          ),
                          const SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                //  color: Colors.blue,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
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
                              const Text(
                                'Watch my latest video!\nThanks to @sportsvideo for the awesome\nedit!',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Row(
                                      //   crossAxisAlignment: CrossAxisAlignment.center,
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('2019/2020\nHighlights',
                                            style: TextStyle(
                                                color: Color(0xFFE8F667),
                                                fontSize: 18.0)),
                                        const SizedBox(width: 16),
                                        Container(
                                          height: 55,
                                          width: 55,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF707070),
                                            shape: BoxShape.circle,
                                          ),
                                          // color: Colors.black26,
                                          child: const Icon(
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
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.favorite,
                                  color: AppColor.greyBorderColor, size: 20),
                              const SizedBox(width: 2),
                              Text(
                                '1.1k',
                                style:
                                    TextStyle(color: AppColor.greyBorderColor),
                              )
                            ],
                          ),
                          const SizedBox(width: 26),
                          Row(
                            children: [
                              Icon(Icons.comment,
                                  color: AppColor.greyBorderColor, size: 20),
                              const SizedBox(width: 2),
                              Text('1.1k',
                                  style: TextStyle(
                                      color: AppColor.greyBorderColor))
                            ],
                          ),
                          const SizedBox(width: 26),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: AppColor.greyBorderColor, size: 20),
                              const SizedBox(width: 2),
                              Text('1.1k',
                                  style: TextStyle(
                                      color: AppColor.greyBorderColor))
                            ],
                          ),
                          // SizedBox(width: 16),
                          const Spacer(),
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

class HighlightDetail extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  const HighlightDetail({Key? key, required this.videoPlayerController})
      : super(key: key);

  @override
  State<HighlightDetail> createState() => _HighlightDetailState();
}

class _HighlightDetailState extends State<HighlightDetail> {
  bool _isFollow = true;
  bool isSwitched = false;
  bool hideShowWidget = true;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: scpAppBar('Video', Icons.notifications, context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _height * 0.27,
              width: _width,
              child: widget.videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio:
                          widget.videoPlayerController.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          VideoPlayer(widget.videoPlayerController),
                          ControlsOverlay(
                              controller: widget.videoPlayerController),
                          VideoProgressIndicator(widget.videoPlayerController,
                              allowScrubbing: true)
                        ],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
            const Divider(color: Colors.grey, height: 0),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: _width,
              //   color: Colors.blue,
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '2019/2020 Season Highlights',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text('8.4K views',
                          style: TextStyle(color: AppColor.greyBorderColor)),
                      const SizedBox(width: 8),
                      Text('7 days ago',
                          style: TextStyle(color: AppColor.greyBorderColor)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.favorite,
                              color: AppColor.greyBorderColor, size: 20),
                          const SizedBox(width: 2),
                          Text(
                            '1.3k',
                            style: TextStyle(color: AppColor.greyBorderColor),
                          )
                        ],
                      ),
                      const SizedBox(width: 26),
                      Row(
                        children: [
                          Icon(Icons.comment,
                              color: AppColor.greyBorderColor, size: 20),
                          const SizedBox(width: 2),
                          Text('1.1k',
                              style: TextStyle(color: AppColor.greyBorderColor))
                        ],
                      ),
                      const SizedBox(width: 26),
                      Row(
                        children: [
                          Icon(Icons.star,
                              color: AppColor.greyBorderColor, size: 20),
                          const SizedBox(width: 2),
                          Text('1.1k',
                              style: TextStyle(color: AppColor.greyBorderColor))
                        ],
                      ),
                      // SizedBox(width: 16),
                      const Spacer(),
                      Icon(Icons.share,
                          color: AppColor.greyBorderColor, size: 20),
                    ],
                  )
                ],
              ),
            ),
            const Divider(color: Colors.grey, height: 0),
            Container(
              height: _height * 0.1,
              width: _width,
              // color: Colors.blue,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/drawer_img.png'),
                    radius: 24,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Martin Mangram',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      Text('@martin',
                          style: TextStyle(color: AppColor.greyBorderColor))
                    ],
                  ),
                  const Spacer(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      // splashColor: Colors.white,
                      onTap: () {
                        setState(() {
                          _isFollow = !_isFollow;
                        });
                      },
                      child: Container(
                        height: 34,
                        width: 74,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _isFollow
                              ? AppColor.lightBlackColor
                              : AppColor.goldenColor,
                          border: Border.all(
                              color: _isFollow
                                  ? AppColor.greyBorderColor
                                  : Colors.white,
                              width: 1.0),
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        ),
                        child: Text('Follow',
                            style: TextStyle(
                                color: _isFollow
                                    ? AppColor.greyBorderColor
                                    : Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey, height: 0),
            Container(
              height: _height * 0.03,
              width: _width,
              // color: Colors.blue,
              //  alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 6, left: 20.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Comments', style: TextStyle(color: Colors.white)),
                  const SizedBox(width: 6),
                  Text('(12)',
                      style: TextStyle(color: AppColor.greyBorderColor)),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        setState(() {
                          hideShowWidget = !hideShowWidget;
                          print('hide Show');
                        });
                      },
                      child: hideShowWidget
                          ? const Icon(Icons.arrow_drop_down, color: Colors.white)
                          : const Icon(Icons.arrow_drop_up, color: Colors.white))
                ],
              ),
            ),
            hideShowWidget
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 8, top: 4),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(left: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xFF111111),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/drawer_img.png'),
                                radius: 18,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Awesome video!\nBest of luck in the playoffs.',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(color: AppColor.greyBorderColor, height: 0),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                        child: Row(
                          children: [
                            const Text('Up Next',
                                style: TextStyle(color: Colors.white)),
                            const Spacer(),
                            const Text('Autoplay',
                                style: TextStyle(color: Colors.white)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 16.0, left: 32.0),
                              child: SizedBox(
                                height: 12,
                                width: 18,
                                // color: Colors.blue,
                                child: Switch(
                                  activeTrackColor: AppColor.lightBlackColor,
                                  activeColor: AppColor.goldenColor,
                                  inactiveThumbColor: Colors.white,
                                  inactiveTrackColor: AppColor.greyBorderColor,
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                      print(isSwitched);
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                          itemCount: 3,
                          primary: false,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                              // onTap: () {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (_) => HighlightDetail(
                              //               videoPlayerController: _videoPlayerController)));
                              // },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8, left: 16.0, right: 16.0),
                                child: Column(
                                  children: [
                                    Container(
                                      // height: MediaQuery.of(context).size.height * 0.45,
                                      // width: MediaQuery.of(context).size.width,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: const Color(0xFF111111),
                                      ),
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                              'assets/highlight_img.png'),
                                          Positioned.fill(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Row(
                                                  //   crossAxisAlignment: CrossAxisAlignment.center,
                                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                        '2019/2020\nHighlights',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFE8F667),
                                                            fontSize: 18.0)),
                                                    const SizedBox(width: 16),
                                                    Container(
                                                      height: 55,
                                                      width: 55,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Color(0xFF707070),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      // color: Colors.black26,
                                                      child: const Icon(
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
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  )
                : const CommentWidget(), // custom Comment Widget
          ],
        ),
      ),
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
