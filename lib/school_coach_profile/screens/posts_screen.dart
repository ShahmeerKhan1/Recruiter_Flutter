import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruiter_flutter/school_coach_profile/model/post_tab_model.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/custom_highlight_widget.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/custom_post_widget.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/drawer_widget.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/video_controller.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:video_player/video_player.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> with SingleTickerProviderStateMixin {

  late TabController _controller;

  int _selectedIndex = 0; //  Tab Bar Index

  List<Widget> list = [
    Tab(text: 'Posts'),
    Tab(text: 'Highlights',),
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
      appBar:
      AppBar(
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
        )),
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
          postsTab(),           // custom Post Widget
          CustomHighlightWidget(),      // custom hightlight widget
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

class PostDetail extends StatelessWidget {

  final PostTabModel data;
  const PostDetail({Key? key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Padding(
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
                      backgroundImage: AssetImage(data.profileImg),
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
                                data.userName ,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                ' - ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                data.time,
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
                          data.desc,
                          style:
                          TextStyle(color: Colors.white, fontSize: 12),
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
                              child: Image.asset(data.img1,
                                fit: BoxFit.fill,)
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: Container(
                              height: 110,
                              //  color: Colors.green,
                              child: Image.asset(data.img2, fit: BoxFit.fill,)),
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
                              child: Image.asset(data.img3,
                                fit: BoxFit.fill,)
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: Container(
                              height: 110,
                              //  color: Colors.green,
                              child: Image.asset(data.img4, fit: BoxFit.fill,)),
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
                          data.like,
                          style: TextStyle(color: AppColor.greyBorderColor),
                        )
                      ],
                    ),
                    SizedBox(width: 26),
                    Row(
                      children: [
                        Icon(Icons.comment,
                            color: AppColor.greyBorderColor, size: 20),
                        SizedBox(width: 2),
                        Text(data.comment,
                            style:
                            TextStyle(color: AppColor.greyBorderColor))
                      ],
                    ),
                    SizedBox(width: 26),
                    Row(
                      children: [
                        Icon(Icons.star,
                            color: AppColor.greyBorderColor, size: 20),
                        SizedBox(width: 2),
                        Text(data.star,
                            style:
                            TextStyle(color: AppColor.greyBorderColor))
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
      ),
    );
  }
}

