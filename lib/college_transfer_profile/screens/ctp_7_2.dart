import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruiter_flutter/college_transfer_profile/controller/new_post_ctp.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_44_1.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_7.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_7_1.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/persistant_bottom_nav.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';
import 'package:recruiter_flutter/controller/new_post_controller.dart';
import 'package:recruiter_flutter/model/post_tab_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CTP7_2 extends StatefulWidget {
  const CTP7_2({Key? key}) : super(key: key);

  @override
  _CTP7_2State createState() => _CTP7_2State();
}

class _CTP7_2State extends State<CTP7_2> {

  TextEditingController commentController = TextEditingController(text: '');

  bool isButtonEnabled = false;

 // late final PostControllerCTP controller;

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

  @override
  void dispose() {
    commentController.dispose();
  //  controller = Get.put(PostControllerCTP());
   // Get.delete<PostControllerCTP>();
    super.dispose();
  }

  bool isTextFieldEmpty() {
    setState(() {
      if (commentController.text != "") {
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



    commentController = TextEditingController(text: "");

    if (commentController.text.trim() != "") {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
  }

  bool _isVisible = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _notification = false;

  @override
  Widget build(BuildContext context) {

    final PostControllerCTP controllerCTP = Get.put(PostControllerCTP());

    return Scaffold(
      appBar: AppBar(
        title: Text('New Post', style: TextStyle(color: Colors.white)),
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
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CTP_44_1()));
                },
                child: _notification ?  Icon(Icons.notifications, color: Colors.white)
                    : Icon(Icons.notifications_none)
            ),
          ),
        ],
        bottom: PreferredSize(
            child: Container(
              color: const Color(0xFF474747),
              height: 4.0,
            ),
            preferredSize: const Size.fromHeight(4.0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
                controller: commentController,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(new RegExp(r"\n"))
                ],
                // maxLines: 3,
                // minLines: 1,
                 maxLength: 100,
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
                    contentPadding: const EdgeInsets.all(0.0),
                    // contentPadding: EdgeInsets.only(left: 16),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    // prefixIcon: Icon(Icons.lock),
                    labelText: "Type your message...",
                    labelStyle: const TextStyle(
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
                              if ((commentController.text == "") && (imageFile == null)) {
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

                              //  setState(() {
                                  controllerCTP.postListsCtp.add(
                                      PostTabModel(
                                          profileImg: 'assets/drawer_img.png',
                                          userName: 'Martin Mangram ',
                                          time: '1m',
                                          desc: commentController.text,
                                          like: '1.1k',
                                          comment: '2.2k',
                                          star: '2.2k',
                                          heartReact: false,
                                          starReact: false,
                                          img: imageFile
                                      ));
                                //  Get.to(()=>CTP_7());
                               // Get.close(2);
                               Get.off(() => CustomOverlay());
                             //  Get.off(() => PersistantBottomNav());
                               // Get.off(() => CTP_7_1());
                                Get.off(() => CTP_7());
                                //  Get.offAll(() => CTP_7());
                              //  });
                              //  PostControllerCTP().update();
                                // Get.put(PostControllerCTP()).postLists.add(
                                // PostTabModel(
                                //     profileImg: 'assets/drawer_img.png',
                                //     userName: 'Martin Mangram ',
                                //     time: '1m',
                                //     desc: comment.text,
                                //     like: '1.1k',
                                //     comment: '2.2k',
                                //     star: '2.2k',
                                //   img: imageFile
                                // ));
                                // Get.to(const CTP_7());
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
                              child: const Text('Post',
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
                  decoration: const BoxDecoration(
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
                      child: const Text('Delete', style: TextStyle(color: Colors.white)),
                      decoration: const BoxDecoration(
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
