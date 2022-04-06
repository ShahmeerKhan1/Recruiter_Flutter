import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruiter_flutter/model/post_tab_model.dart';
import 'package:recruiter_flutter/model/reply_post_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';
import 'package:recruiter_flutter/widgets/custom_highlight_widget.dart';
import 'package:recruiter_flutter/widgets/custom_post_widget.dart';
import 'package:recruiter_flutter/widgets/drawer_widget.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';
import 'package:video_player/video_player.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  int _selectedIndex = 0; //  Tab Bar Index

  List<Widget> list = [
    Tab(text: 'Posts'),
    Tab(
      text: 'Highlights',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this); // Tab Bar

    _controller.addListener(() {
      // Tab Bar
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: drawerWidget(context),
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: Image.asset('assets/logo.png', width: 135),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(Icons.notifications, color: Colors.white),
            )
          ],
          bottom: TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            labelColor: Colors.white,
            unselectedLabelStyle: TextStyle(color: AppColor.greyBorderColor),
            indicatorColor: Colors.white,
            onTap: (index) {
              print('Tab $index is tapped');
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
          )
      ),
      //  appBar: PreferredSize(
      //    preferredSize: Size.fromHeight(kToolbarHeight),
      //    child: Container(
      //      child: Column(
      //        children: [
      //          TabBar(
      //            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      //            labelColor: Colors.white,
      //            unselectedLabelStyle: TextStyle(color: AppColor.greyBorderColor),
      //            indicatorColor: Colors.white,
      //            onTap: (index) {
      //              print('Tab $index is tapped');
      //              // Should not used it as it only called when tab options are clicked,
      //              // not when user swapped
      //            },
      //            controller: _controller,
      //            tabs: list,
      //          ),
      //        ],
      //      ),
      //    ),
      //  ),
      body: TabBarView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          postsTab(), // custom Post Widget
          CustomHighlightWidget(), // custom hightlight widget
          // Container(
          //   color: Colors.green,
          // )
        ],
      ),
      // AppBar(
      //   backgroundColor: Colors.black,
      //   iconTheme: IconThemeData(color: Colors.white),
      //   title: Image.asset('assets/logo.png', width: 135),
      //   centerTitle: true,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 12.0),
      //       child: Icon(Icons.notifications, color: Colors.white),
      //     )
      //   ],
      //   bottom: TabBar(
      //     labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      //     labelColor: Colors.white,
      //     unselectedLabelStyle: TextStyle(color: AppColor.greyBorderColor),
      //     indicatorColor: Colors.white,
      //     onTap: (index) {
      //       print('Tab $index is tapped');
      //       // Should not used it as it only called when tab options are clicked,
      //       // not when user swapped
      //     },
      //     controller: _controller,
      //     tabs: list,
      //   ),
      // backgroundColor: Colors.black,
      // automaticallyImplyLeading: false,
      // flexibleSpace: Column(
      //   children: [
      //     TabBar(
      //       labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      //       labelColor: Colors.white,
      //       unselectedLabelStyle: TextStyle(color: AppColor.greyBorderColor),
      //       indicatorColor: Colors.white,
      //       onTap: (index) {
      //         print('Tab $index is tapped');
      //         // Should not used it as it only called when tab options are clicked,
      //         // not when user swapped
      //       },
      //       controller: _controller,
      //       tabs: list,
      //     ),
      //   ],
      // ),
      // backgroundColor: Colors.black,
      // iconTheme: IconThemeData(color: Colors.white),
      // title: Image.asset('assets/logo.png',width: 135),
      // centerTitle: true,
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 12.0),
      //     child: Icon(Icons.notifications, color: Colors.white),
      //   )
      // ],
      // bottom: TabBar(
      //   labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      //   labelColor: Colors.white,
      //   unselectedLabelStyle: TextStyle(color: AppColor.greyBorderColor),
      //   indicatorColor: Colors.white,
      //   onTap: (index) {
      //     print('Tab $index is tapped');
      //     // Should not used it as it only called when tab options are clicked,
      //     // not when user swapped
      //   },
      //   controller: _controller,
      //   tabs: list,
    );
  }
}

class PostDetail extends StatefulWidget {
  final PostTabModel data;

  PostDetail({Key? key, required this.data});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
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
  initState() {
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

  // Widget gridImgView() {
  //   return GridView.count(
  //     shrinkWrap: true,
  //     crossAxisCount: 3,
  //     childAspectRatio: 1,
  //     children: List.generate(images.length, (index) {
  //       if (images[index] is ImageUploadModel) {
  //         ImageUploadModel uploadModel = images[index] as ImageUploadModel;
  //         return Card(
  //           clipBehavior: Clip.antiAlias,
  //           child: Stack(
  //             children: <Widget>[
  //               Image.file(
  //                 uploadModel.imageFile,
  //                 width: 300,
  //                 height: 300,
  //               ),
  //               Positioned(
  //                 right: 5,
  //                 top: 5,
  //                 child: InkWell(
  //                   child: Icon(
  //                     Icons.remove_circle,
  //                     size: 20,
  //                     color: Colors.red,
  //                   ),
  //                   onTap: () {
  //                     setState(() {
  //                       images.replaceRange(index, index + 1, ['Add Image']);
  //                     });
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       } else {
  //         return Card(
  //           child: IconButton(
  //             icon: Icon(Icons.add),
  //             onPressed: () {
  //               _onAddImageClick();
  //             },
  //           ),
  //         );
  //       }
  //     }),
  //   );
  // }

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

//   void getFileImage(int index) async {
// //    var dir = await path_provider.getTemporaryDirectory();
//
//     imageFile .path;
//   }

  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar('Post', Icons.notifications),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.46,
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
                            backgroundImage: AssetImage(widget.data.profileImg),
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
                                      widget.data.userName,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      ' - ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      widget.data.time,
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
                                widget.data.desc,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                    height: 110,
                                    //  color: Colors.blue,
                                    child: Image.asset(
                                      widget.data.img1,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    height: 110,
                                    //  color: Colors.green,
                                    child: Image.asset(
                                      widget.data.img2,
                                      fit: BoxFit.fill,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                    height: 110,
                                    //  color: Colors.blue,
                                    child: Image.asset(
                                      widget.data.img3,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    height: 110,
                                    //  color: Colors.green,
                                    child: Image.asset(
                                      widget.data.img4,
                                      fit: BoxFit.fill,
                                    )),
                              )
                            ],
                          ),
                        ],
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
                                widget.data.like,
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
                              Text(widget.data.comment,
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
                              Text(widget.data.star,
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
              Form(
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
                                        _scaffoldKey.currentState!.showSnackBar(
                                            new SnackBar(
                                                content: new Text('Please enter message...')
                                            )
                                        );
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
                    // ElevatedButton.icon(
                    //     onPressed: () {
                    //       _onAddImageClick();
                    //     },
                    //     icon: Icon(Icons.add),
                    //     label: Text('Button'))
                  ],
                ),
              ),
              Divider(color: Colors.grey),
              Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, bottom: 12.0, left: 6, right: 6),
                child: Row(
                  children: [
                    Text(
                      'Replies',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      'Newest',
                      style: TextStyle(color: AppColor.greyBorderColor),
                    ),
                    SizedBox(width: 16),
                    Text('Top',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              ListView.builder(
                  itemCount: _list.length,
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
