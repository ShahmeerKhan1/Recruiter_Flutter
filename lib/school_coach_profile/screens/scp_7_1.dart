import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_42.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_8.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_post_tab.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_drawer.dart';
import 'package:recruiter_flutter/controller/new_highlight_controller.dart';
import 'package:recruiter_flutter/controller/new_post_controller.dart';
import 'package:recruiter_flutter/school_coach_profile/controller/new_highlight_scp.dart';
import 'package:recruiter_flutter/school_coach_profile/controller/new_post_scp.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/scp42_1.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/scp_8_1.dart';
import 'package:recruiter_flutter/school_coach_profile/widget/scp_drawer.dart';
import 'package:recruiter_flutter/school_coach_profile/widget/scp_posts_tab.dart';
import 'package:recruiter_flutter/util/colors.dart';

class SCP7_1 extends StatefulWidget {
  const SCP7_1({Key? key}) : super(key: key);

  @override
  _SCP7_1State createState() => _SCP7_1State();
}

class _SCP7_1State extends State<SCP7_1> with SingleTickerProviderStateMixin {
  late TabController _controller;

  int _selectedIndex = 0; //  Tab Bar Index

  List<Widget> list = [
    Container(
      // color: Colors.blue,
      //  padding: EdgeInsets.only(left: 50.0),
        alignment: Alignment.center,
        child:  Tab(text: 'Posts')),
    Container(
      // padding: EdgeInsets.only(right: 50),
      //  color: Colors.yellow,
        alignment: Alignment.center,
        child: Tab(text: 'Highlights'))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this); // Tab Bar

    Get.put(PostControllerSCP());
    Get.put(HighlightControllerSCP());

    _controller.addListener(() {
      // Tab Bar
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  bool _notification = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.black,
          drawer: scpDrawer(context),
          appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          _notification = true;
                        });
                        print('noti');
                        Navigator.push(context, MaterialPageRoute(builder: (_) => SCP42_1()));
                      },
                      child: _notification ?  Icon(Icons.notifications, color: Colors.white)
                          : Icon(Icons.notifications_none)
                  ),
                )
              ],
              flexibleSpace:
              Container(
                //  color: Colors.blue,
                padding: EdgeInsets.only(left: 36, right: 36.0),
                alignment: Alignment.center,
                child: TabBar(
                  //  padding: EdgeInsets.zero,
                  // indicatorPadding: EdgeInsets.zero,
                  //   indicatorSize: TabBarIndicatorSize.label,
                  //    labelPadding: EdgeInsets.only(left: 56.0, right: 56.0),
                  indicator: UnderlineTabIndicator(
                    //  borderSide: BorderSide(width: 5.0),
                    //  insets: EdgeInsets.symmetric(horizontal:26.0)
                  ),
                  indicatorPadding: EdgeInsets.only(left: 36, right: 30.0, bottom: 12),
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
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
                ),
              ),),
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
          //     )
          // ),
          // //  ),
          // //   PreferredSize(
          // //     preferredSize: Size.fromHeight(kToolbarHeight),
          // //     child: Container(
          // //      // color: Colors.green,
          // //       child: SafeArea(
          // //         child: Column(
          // //           children: <Widget>[
          // //             Expanded(child: Container()),
          // //       TabBar(
          // //               labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          // //               labelColor: Colors.white,
          // //               unselectedLabelStyle: TextStyle(color: AppColor.greyBorderColor),
          // //               indicatorColor: Colors.white,
          // //               onTap: (index) {
          // //                 print('Tab $index is tapped');
          // //                 // Should not used it as it only called when tab options are clicked,
          // //                 // not when user swapped
          // //               },
          // //               controller: _controller,
          // //               tabs: list,
          // //             )
          // //           ],
          // //         ),
          // //       ),
          // //     ),
          // //   ),
          // appBar: AppBar(
          //     backgroundColor: Colors.black,
          //     iconTheme: const IconThemeData(color: Colors.white),
          //     title: Image.asset('assets/logo.png', width: 135),
          //     centerTitle: true,
          //     actions: [
          //       InkWell(
          //         onTap: () {
          //           Navigator.push(
          //               context, MaterialPageRoute(builder: (_) => CCP_42()));
          //         },
          //         child: const Padding(
          //           padding: EdgeInsets.only(right: 12.0),
          //           child: Icon(Icons.notifications, color: Colors.white),
          //         ),
          //       )
          //     ],
          //     bottom: TabBar(
          //       labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
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
          //     )),
          body: TabBarView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
            //  scpPostsTab(),
              SCPPostTab(),
              const SCP8_1(),
            ],
          ),
        ),
      ),
    );
  }
}
