import 'package:flutter/material.dart';
import 'package:recruiter_flutter/model/highlight_tab_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/comment_widget.dart';
import 'package:recruiter_flutter/widgets/video_controller.dart';
import 'package:video_player/video_player.dart';

import 'sap_44.dart';

class SAP_12 extends StatefulWidget {
  final VideoPlayerController? videoPlayerController;
  final HighLightTabModel data;

  const SAP_12({Key? key, required this.videoPlayerController, required this.data})
      : super(key: key);

  @override
  State<SAP_12> createState() => _SAP_12State();
}

class _SAP_12State extends State<SAP_12> {
  bool _isFollow = true;
  bool isSwitched = false;
  bool hideShowWidget = true;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _notification = false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Video', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: () {
                  setState(() {
                    _notification = true;
                  });
                  print('noti');
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SAP_44()));
                },
                child: _notification ?  Icon(Icons.notifications, color: Colors.white)
                    : Icon(Icons.notifications_none)
            ),
          )
        ],
        bottom: PreferredSize(
            child: Container(
              color: const Color(0xFF474747),
              height: 4.0,
            ),
            preferredSize: const Size.fromHeight(4.0)),
      ),
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.data.heartReact = !widget.data.heartReact;
                          });
                        },
                        child: Row(
                          children: [
                            !widget.data.heartReact ? Icon(Icons.favorite_outline,
                                color: AppColor.greyBorderColor, size: 20)
                                : Icon(Icons.favorite,
                                color: Colors.red, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              widget.data.like,
                              style:
                              TextStyle(color: AppColor.greyBorderColor),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      Row(
                        children: [
                          Icon(Icons.comment,
                              color: AppColor.greyBorderColor, size: 20),
                          const SizedBox(width: 4),
                          Text(widget.data.comment,
                              style: TextStyle(
                                  color: AppColor.greyBorderColor))
                        ],
                      ),
                      const SizedBox(width: 30),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                widget.data.starReact = !widget.data.starReact;
                                print('togle');
                              });
                            },
                            child: !widget.data.starReact ? Icon(Icons.star_border,
                                color: AppColor.greyBorderColor, size: 20)
                                : Icon(Icons.star,
                                color: AppColor.goldenColor, size: 20),
                          ),
                          const SizedBox(width: 4),
                          Text(widget.data.star,
                              style: TextStyle(
                                  color: AppColor.greyBorderColor))
                        ],
                      ),
                      // SizedBox(width: 16),
                      const Spacer(),
                      Icon(Icons.share,
                          color: AppColor.greyBorderColor, size: 20),
                    ],
                  ),
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
                        //           builder: (_) => SAP_12(
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