import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruiter_flutter/school_coach_profile/model/reply_post_model.dart';
import 'package:recruiter_flutter/util/colors.dart';

import 'textfield_focused_border.dart';
import 'textfield_input_border.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({Key? key}) : super(key: key);

  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {

  TextEditingController comment = TextEditingController();
  bool isButtonEnabled = false;
  final _formKey = GlobalKey<FormState>();

  ReplyPostModel model = ReplyPostModel(
      profileImg: 'assets/small_avatar.png',
      userName: 'John Doe ',
      time: '1m',
      desc:
      "Congratulations after all the hard work!\nYou really deserve this.",
      like: '1.1k',
      comment: '1.1k',
      reply: 'Reply');

  final List<ReplyPostModel> _list = [
    ReplyPostModel(
        profileImg: 'assets/small_avatar.png',
        userName: 'John Doe ',
        time: '1m',
        desc:
        "Congratulations after all the hard work!\nYou really deserve this.",
        like: '1.1k',
        comment: '1.1k',
        reply: 'Reply')
  ];

  List<Object> images = <Object>[];
  File? imageFile;

  @override
  initState(){
    super.initState();

    comment = TextEditingController(text: "");

    if (comment.text.trim() != "") {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }

    images.add("Add Image");
    images.add("Add Image");
    images.add("Add Image");
    images.add("Add Image");

  }

  void _onAddImageClick() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(image!.path);
    });
    // final ImagePicker _picker = ImagePicker();
    // imageFile = await _picker.pickImage(
    //   source: ImageSource.gallery,
    // );
    // final File? file = File(imageFile!.path);
    // return file;
  }

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

  _onSubmit() async {
    var form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      print('Descrip ${model.desc}');

      _list.insert(
          0,
          ReplyPostModel(
              reply: 'Reply',
              comment: '1.1k',
              desc: model.desc,
              time: '1m',
              userName: 'John ',
              like: '1.2k',
              profileImg: 'assets/small_avatar.png'));
      form.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: comment,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  onSaved: (val) {
                    setState(() {
                      model.desc = val!;
                    });
                  },
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
                      labelText: "Reply To Post...",
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
                                if (comment.text == "") {
                                  print('please enter text');
                                  // _scaffoldKey.currentState!.showSnackBar(
                                  //     new SnackBar(
                                  //         content: new Text('Please enter message...')
                                  //     )
                                  // );
                                } else {
                                  _onSubmit();
                                }
                              },
                              child: Container(
                                width: 44,
                                height: 22,
                                alignment: Alignment.center,
                                child: Text('Reply',
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
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 2.0),
                          //   child: IconButton(
                          //       icon: Icon(Icons.send,
                          //           color: isButtonEnabled
                          //               ? AppColor.yellowColor
                          //               : AppColor.greyBorderColor),
                          //       onPressed: isButtonEnabled
                          //           ? () {
                          //               print('enabled');
                          //             }
                          //           : null),
                          // ),
                          InkWell(
                            onTap: () {
                              _onAddImageClick();
                            },
                            child: Icon(Icons.photo,
                                color: AppColor.greyBorderColor,
                                size: 20.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 12.0, left: 4),
                            child: Icon(Icons.attach_file,
                                color: AppColor.greyBorderColor,
                                size: 20),
                          ),
                        ],
                      ))),
              //  gridImgView(),
              imageFile != null
                  ? Container(
                width: MediaQuery.of(context).size.width,
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
              )
                  : Container(
                //   child: Icon(Icons.camera, color: Colors.white),
              ),
              ListView.builder(
                  itemCount: _list.length,
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.14,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          //  color: Colors.blue,
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF111111),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                  AssetImage(_list[index].profileImg),
                                  radius: 18,
                                ),
                                SizedBox(width: 6),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      //  color: Colors.blue,
                                      width:
                                      MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            _list[index].userName,
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '- ',
                                            style:
                                            TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            _list[index].time,
                                            style:
                                            TextStyle(color: Colors.grey),
                                          ),
                                          Spacer(),
                                          Icon(Icons.more_horiz,
                                              color: Colors.white),
                                          //     IconButton(
                                          //         onPressed: () {},
                                          //         icon: Icon(Icons.more_horiz))
                                        ],
                                      ),
                                    ),
                                    //  SizedBox(height: 4),
                                    Text(
                                      _list[index].desc,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.favorite,
                                        color: AppColor.greyBorderColor,
                                        size: 20),
                                    SizedBox(width: 2),
                                    Text(
                                      _list[index].like,
                                      style: TextStyle(
                                          color: AppColor.greyBorderColor),
                                    )
                                  ],
                                ),
                                SizedBox(width: 26),
                                Row(
                                  children: [
                                    Icon(Icons.comment,
                                        color: AppColor.greyBorderColor,
                                        size: 20),
                                    SizedBox(width: 2),
                                    Text(_list[index].comment,
                                        style: TextStyle(
                                            color: AppColor.greyBorderColor))
                                  ],
                                ),
                                Spacer(),
                                Text(_list[index].reply,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColor.greyBorderColor))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              // ElevatedButton.icon(
              //     onPressed: () {
              //       _onAddImageClick();
              //     },
              //     icon: Icon(Icons.add),
              //     label: Text('Button'))
            ],
          ),
        ),
    );
  }
}
