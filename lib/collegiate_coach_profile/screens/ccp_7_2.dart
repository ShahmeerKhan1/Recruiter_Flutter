import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_7.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_app_bar.dart';
import 'package:recruiter_flutter/controller/new_post_controller.dart';
import 'package:recruiter_flutter/model/post_tab_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';
import 'package:recruiter_flutter/widgets/drawer_widget.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP_7_2 extends StatefulWidget {
  const CCP_7_2({Key? key}) : super(key: key);

  @override
  _CCP_7_2State createState() => _CCP_7_2State();
}

class _CCP_7_2State extends State<CCP_7_2> {

  TextEditingController comment = TextEditingController();

  bool isButtonEnabled = false;

  // PostTabModel model = PostTabModel(
  //     profileImg: 'assets/drawer_img.png',
  //     userName: 'Martin Mangram ',
  //     time: '1m',
  //     desc: " ",
  //     like: '1.1k',
  //     comment: '2.2k',
  //     star: '2.2k',
  //     img1: 'assets/posts_img_one.png',
  //     img2: 'assets/posts_img_two.png',
  //     img3: 'assets/posts_img_three.png',
  //     img4: 'assets/posts_img_four.png'
  // );

  bool isTextFieldEmpty() {
    setState(() {
      if (comment.text != "") {
        isButtonEnabled = true;
      } else {
        isButtonEnabled = false;
      }
    });
    return isButtonEnabled;
  }

  File? imageFile;

  _onAddImageClick() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }

  @override
  initState() {
    super.initState();

    comment = TextEditingController(text: "");

    if (comment.text.trim() != "") {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
  }

  bool _isVisible = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ccpAppBar('New Post', Icons.notifications, context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
                controller: comment,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                // maxLines: 3,
                // minLines: 1,
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
                    fillColor: Color(0xFF111111),
                    contentPadding: EdgeInsets.all(0.0),
                    // contentPadding: EdgeInsets.only(left: 16),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    // prefixIcon: Icon(Icons.lock),
                    labelText: "Type your message...",
                    labelStyle: TextStyle(
                        color: Color(0xFFBABABA), fontSize: 12),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                    prefixIcon: Image.asset('assets/small_avatar.png'),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              if ((comment.text == "") && (imageFile == null)) {
                                print('please enter text');
                                Get.snackbar(
                                    'Note',
                                    'Please enter Fields...',
                                    backgroundColor: AppColor.yellowColor,
                                    snackPosition: SnackPosition.BOTTOM
                                );
                                // _scaffoldKey.currentState!.showSnackBar(
                                //     new SnackBar(
                                //         content: new Text(
                                //             'Please enter message...')
                                //     )
                                // );
                              } else {
                                //  _onSubmit();
                                print('submit');

                                Get.put(PostController()).postLists.add(
                                    PostTabModel(
                                        profileImg: 'assets/drawer_img.png',
                                        userName: 'Martin Mangram ',
                                        time: '1m',
                                        desc: comment.text,
                                        like: '1.1k',
                                        comment: '2.2k',
                                        star: '2.2k',
                                        img1: 'assets/posts_img_one.png',
                                        img2: 'assets/posts_img_two.png',
                                        img3: 'assets/posts_img_three.png',
                                        img4: 'assets/posts_img_four.png',
                                        img: imageFile
                                    ));
                                Get.offAll(CCP_7());
                                // Navigator.push(context, MaterialPageRoute(
                                //     builder: (_) => CTP_7_1()));

                                // Get.to(() => Profile());
                                //  controller.addItemToList();
                              }
                            },
                            child: Container(
                              width: 44,
                              height: 22,
                              alignment: Alignment.center,
                              child: Text('Post',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500)),
                              decoration: BoxDecoration(
                                color: isButtonEnabled
                                    ? AppColor.goldenColor
                                    : Colors.grey,
                                borderRadius:
                                BorderRadius.circular(6.0),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _onAddImageClick();
                            print('pic');
                          },
                          child: Icon(Icons.photo,
                              color: AppColor.greyBorderColor,
                              size: 20.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12.0, left: 4),
                          child: InkWell(
                            onTap: () {
                              _onAddImageClick();
                              print('attach');
                            },
                            child: Icon(Icons.attach_file,
                                color: AppColor.greyBorderColor,
                                size: 20),
                          ),
                        ),
                      ],
                    ))),
            //  gridImgView(),
            imageFile != null
                ? Stack(
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 300,
                  //  height: 200,
                  //         color: Colors.blue,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Image.file(
                    imageFile!,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _isVisible = !_isVisible;
                        imageFile = null;
                      });
                      print('remove');
                    },
                    child: Container(
                      width: 66,
                      height: 30,
                      alignment: Alignment.center,
                      child: Text('Delete', style: TextStyle(color: Colors.white)),
                      decoration: BoxDecoration(
                        color: Color(0xFFF12727),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                    ),
                  ),
                )
              ],
            )
                : Container(
              //   child: Icon(Icons.camera, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
