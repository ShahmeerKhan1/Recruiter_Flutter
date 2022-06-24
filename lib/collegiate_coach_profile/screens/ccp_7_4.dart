import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/controller/new_highlight_ccp.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_7.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_app_bar.dart';
import 'package:recruiter_flutter/controller/new_highlight_controller.dart';
import 'package:recruiter_flutter/model/highlight_tab_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';
import 'package:video_player/video_player.dart';

class CCP_7_4 extends StatefulWidget {
  const CCP_7_4({Key? key}) : super(key: key);

  @override
  _CCP_7_4State createState() => _CCP_7_4State();
}

class _CCP_7_4State extends State<CCP_7_4> {
  TextEditingController title = TextEditingController(text: ' ');
  TextEditingController description = TextEditingController(text: ' ');

  // File? imageFile;

  // _onAddImageClick() async {
  //   XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     setState(() {
  //       imageFile = File(image.path);
  //     });
  //   }
  // }

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    title = TextEditingController(text: "");

    if (title.text.trim() != "") {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
  }

  bool isTextFieldEmpty() {
    setState(() {
      if (title.text != "") {
        isButtonEnabled = true;
      } else {
        isButtonEnabled = false;
      }
    });
    return isButtonEnabled;
  }

  VideoPlayerController? _VideoController;
  Future<void>? _initializeVideoPlayerFuture;

  File? videoFile;

  // @override
  // void dispose() {
  //   // Ensure disposing of the VideoPlayerController to free up resources.
  //   _VideoController!.dispose();
  //
  //   super.dispose();
  // }

  Future getVideo() async {
    XFile? _videoFile =
    await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (_videoFile != null) {
      setState(() {
        _VideoController = VideoPlayerController.file(File(_videoFile.path));
        // Initialize the controller and store the Future for later use.
        _initializeVideoPlayerFuture = _VideoController!.initialize();

        // Use the controller to loop the video.
        _VideoController!.setLooping(true);
        //   imageFile = File(image.path);
      });
    }
    // _videoFile!.then((file) async {
    //   setState(() {
    //     videoFile = file;
    //     _controller = VideoPlayerController.file(videoFile!);
    //
    //     // Initialize the controller and store the Future for later use.
    //     _initializeVideoPlayerFuture = _controller.initialize();
    //
    //     // Use the controller to loop the video.
    //     _controller.setLooping(true);
    //   });
    // });
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: ccpAppBar('New Highlights', Icons.notifications, context),
      //  resizeToAvoidBottomInset: false,
      floatingActionButton: _VideoController == null
          ? null
          : FloatingActionButton(
        backgroundColor: AppColor.yellowColor,
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_VideoController!.value.isPlaying) {
              _VideoController!.pause();
            } else {
              // If the video is paused, play it.
              _VideoController!.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _VideoController!.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: _width,
            minHeight: _height,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _VideoController != null
                      ? FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.done) {
                        // If the VideoPlayerController has finished initialization, use
                        // the data it provides to limit the aspect ratio of the video.
                        return AspectRatio(
                          aspectRatio: 16 / 14,
                          //  aspectRatio: _VideoController!.value.aspectRatio,
                          // Use the VideoPlayer widget to display the video.
                          child: VideoPlayer(_VideoController!),
                        );
                      } else {
                        // If the VideoPlayerController is still initializing, show a
                        // loading spinner.
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  )
                  // imageFile != null
                  //     ? Container(
                  //         width: MediaQuery.of(context).size.width,
                  //         //  height: 200,
                  //         //  height: 200,
                  //         decoration: BoxDecoration(
                  //           // color: Colors.blue,
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(16.0)),
                  //           border: Border.all(color: Color(0xFF474747)),
                  //         ),
                  //         child: Image.file(
                  //           imageFile!,
                  //           fit: BoxFit.fill,
                  //         ),
                  //       )
                      : Container(
                    height: _height * 0.2,
                    width: _width,
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF111111),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(16.0)),
                      border: Border.all(color: const Color(0xFF474747)),
                    ),
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        dashPattern: const [12, 12],
                        color: Colors.grey,
                        strokeWidth: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                getVideo();
                                //  _onAddImageClick();
                              },
                              child: const Icon(
                                Icons.add,
                                color: Color(0xFF919191),
                                size: 40,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Upload Video File\nFrom Device',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF919191), fontSize: 12),
                            )
                          ],
                        )),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 6.0),
                        child: Text('Title',
                            style:
                            TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                          controller: title,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          onSubmitted: null,
                          maxLength: 60,
                          textCapitalization: TextCapitalization.sentences,
                          // onSaved: (val) {
                          //   setState(() {
                          //     model.desc = val!;
                          //   });
                          // },
                          onChanged: (val) {
                            isTextFieldEmpty();
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFF111111),
                            // contentPadding: EdgeInsets.all(0.0),
                            // contentPadding: EdgeInsets.only(left: 16),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            // prefixIcon: Icon(Icons.lock),
                            //  labelText: "Reply To Post...",
                            labelStyle: const TextStyle(
                                color: Color(0xFFBABABA), fontSize: 12),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          )),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 6.0),
                        child: Text('Description',
                            style:
                            TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                          controller: description,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.multiline,
                          maxLines: 6,
                          maxLength: 30,
                          textCapitalization: TextCapitalization.sentences,
                          // onSaved: (val) {
                          //   setState(() {
                          //     model.desc = val!;
                          //   });
                          // },
                          onChanged: (val) {
                            //  isTextFieldEmpty();
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFF111111),
                            // contentPadding: EdgeInsets.all(0.0),
                            // contentPadding: EdgeInsets.only(left: 16),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            // prefixIcon: Icon(Icons.lock),
                            //  labelText: "Reply To Post...",
                            labelStyle: const TextStyle(
                                color: Color(0xFFBABABA), fontSize: 12),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          )),
                    ],
                  ),
                  // Spacer(),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 44,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // color: AppColor.lightBlackColor,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                                border: Border.all(
                                  color: const Color(0xFFF61F1F),
                                )),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Color(0xFFF61F1F),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if ((title.text != "") &&
                                (description.text != "") &&
                                (_VideoController != null)) {
                              Get.put(HighlightControllerCCP()).highlightList.add(
                                  HighLightTabModel(
                                      profileImg: 'assets/drawer_img.png',
                                      userName: 'Martin Mangram ',
                                      time: '1m',
                                      title: title.text,
                                      desc: description.text,
                                      like: '1.1k',
                                      comment: '2.2k',
                                      star: '2.2k',
                                      video: videoFile,
                                      VideoController: _VideoController,
                                      initializeVideoPlayerFuture:
                                      _initializeVideoPlayerFuture));
                              Get.off(const CCP_7());
                            } else {
                              Get.snackbar(
                                  'Note',
                                  'Please Enter Fields...',
                                  backgroundColor: AppColor.yellowColor,
                                  snackPosition: SnackPosition.BOTTOM
                              );
                              // print('fill');
                            }
                            //  Navigator.push(context, MaterialPageRoute(builder: (_) => CTP_7_1()));
                          },
                          child: Container(
                              height: 44,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // color: AppColor.lightBlackColor,
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                                  border: Border.all(
                                    color: const Color(0xFFFFEE00),
                                  )),
                              child: const Text(
                                'Publish',
                                style: TextStyle(
                                    color: Color(0xFFFFEE00),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
