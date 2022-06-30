import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/college_transfer_profile/controller/new_highlight_ctp.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_12_1.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';
import 'package:recruiter_flutter/controller/new_highlight_controller.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/comment_widget.dart';
import 'package:recruiter_flutter/widgets/video_controller.dart';
import 'package:video_player/video_player.dart';

class CTP_Highlights_Tab extends StatefulWidget {
  const CTP_Highlights_Tab({Key? key}) : super(key: key);

  @override
  _CTP_Highlights_TabState createState() => _CTP_Highlights_TabState();
}

class _CTP_Highlights_TabState extends State<CTP_Highlights_Tab> {
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

 // final HighlightController highlightController = Get.find();

  // @override
  // void dispose() {
  //   super.dispose();
  //   highlightController.dispose();
  // }

  // @override
  // void dispose() {
  //   _videoPlayerController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GetBuilder<HighlightControllerCTP>(
        builder: (_cont) {
          return _cont.highlightList.isNotEmpty ? ListView.builder(
              itemCount: _cont.highlightList.length,
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CTP_12_1(
                                videoPlayerController: _cont.highlightList[index].VideoController,
                            data: _cont.highlightList[index])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: const Color(0xFF111111),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                AssetImage(_cont.highlightList[index].profileImg),
                                radius: 24,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      //  color: Colors.blue,
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            _cont.highlightList[index].userName,
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                          const Text(
                                            '- ',
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            _cont.highlightList[index].time,
                                            style: const TextStyle(color: Colors.grey),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.more_horiz, color: Colors.white),
                                          //     IconButton(
                                          //         onPressed: () {},
                                          //         icon: Icon(Icons.more_horiz))
                                        ],
                                      ),
                                    ),
                                    //  SizedBox(height: 4),
                                    Text(
                                      _cont.highlightList[index].title,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              // alignment: Alignment.center,
                              child: Stack(
                                children: [
                                 // Image.asset('assets/highlight_img.png'),
                                  FutureBuilder(
                                    future: _cont.highlightList[index].initializeVideoPlayerFuture,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.done) {
                                        // If the VideoPlayerController has finished initialization, use
                                        // the data it provides to limit the aspect ratio of the video.
                                        return AspectRatio(
                                          aspectRatio: 16 / 11,
                                         // aspectRatio: _cont.highlightList[index].VideoController!.value.aspectRatio,
                                          // Use the VideoPlayer widget to display the video.
                                          child: VideoPlayer(_cont.highlightList[index].VideoController!),
                                        );
                                      } else {
                                        // If the VideoPlayerController is still initializing, show a
                                        // loading spinner.
                                        return const Center(child: CircularProgressIndicator());
                                      }
                                    },
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 100,
                                            //  color: Colors.blue,
                                              child: Text(_cont.highlightList[index].desc,
                                                 // maxLines: 2,
                                                  style: const TextStyle(
                                                      color: Color(0xFFE8F667),
                                                      fontSize: 18.0)),
                                            ),
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, left: 2.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _cont.highlightList[index].heartReact = !_cont.highlightList[index].heartReact;
                                        });
                                        print('heart toggle');
                                      },
                                      child: !_cont.highlightList[index].heartReact ? Icon(Icons.favorite_outline,
                                          color: AppColor.greyBorderColor, size: 20)
                                          : Icon(Icons.favorite,
                                          color: Colors.red, size: 20),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      _cont.highlightList[index].like,
                                      style: TextStyle(
                                          color: AppColor.greyBorderColor),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 30),
                                Row(
                                  children: [
                                    Icon(Icons.mode_comment_outlined,
                                        color: AppColor.greyBorderColor, size: 20),
                                    const SizedBox(width: 4),
                                    Text( _cont.highlightList[index].comment,
                                        style:
                                        TextStyle(color: AppColor.greyBorderColor))
                                  ],
                                ),
                                const SizedBox(width: 30),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _cont.highlightList[index].starReact = ! _cont.highlightList[index].starReact;
                                        });
                                      },
                                      child: ! _cont.highlightList[index].starReact ? Icon(Icons.star_border,
                                          color: AppColor.greyBorderColor, size: 20)
                                          : Icon(Icons.star,
                                          color: AppColor.goldenColor, size: 20),
                                    ),
                                    const SizedBox(width: 4),
                                    Text( _cont.highlightList[index].star,
                                        style:
                                        TextStyle(color: AppColor.greyBorderColor))
                                  ],
                                ),
                                // SizedBox(width: 16),
                                const Spacer(),
                                Icon(Icons.share,
                                    color: AppColor.greyBorderColor, size: 20),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }) : const Center(child: Text('Please Add Highlights' ,style: TextStyle(color: Colors.white),));
        }
      ),
    );
  }
}

class HighlightDetail extends StatefulWidget {
  final VideoPlayerController? videoPlayerController;

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
      appBar: ctpAppBar('Video', Icons.notifications, context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _height * 0.27,
              width: _width,
              child: widget.videoPlayerController!.value.isInitialized
                  ? AspectRatio(
                aspectRatio:
                widget.videoPlayerController!.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    VideoPlayer(widget.videoPlayerController!),
                    ControlsOverlay(
                        controller: widget.videoPlayerController!),
                    VideoProgressIndicator(widget.videoPlayerController!,
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
