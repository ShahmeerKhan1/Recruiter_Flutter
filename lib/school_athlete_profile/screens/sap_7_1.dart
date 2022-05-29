import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_custom_drawer.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_highlights_tab.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_posts_tab.dart';
import 'package:recruiter_flutter/controller/new_highlight_controller.dart';
import 'package:recruiter_flutter/controller/new_post_controller.dart';
import 'package:recruiter_flutter/school_athlete_profile/widgets/sap_drawer.dart';
import 'package:recruiter_flutter/school_athlete_profile/widgets/sap_highlights_tab.dart';
import 'package:recruiter_flutter/school_athlete_profile/widgets/sap_post_tab.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_highlight_widget.dart';
import 'package:recruiter_flutter/widgets/custom_post_widget.dart';

class SAP_7_1 extends StatefulWidget {
  const SAP_7_1({Key? key}) : super(key: key);

  @override
  _SAP_7_1State createState() => _SAP_7_1State();
}

class _SAP_7_1State extends State<SAP_7_1> with SingleTickerProviderStateMixin {

  late TabController _controller;

  int _selectedIndex = 0;   //  Tab Bar Index

  List<Widget> list = [
    Tab(text: 'Posts'),
    Tab(text: 'Highlights')
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this); // Tab Bar

    Get.put(PostController());
    Get.put(HighlightController());

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
      drawer: sapDrawer(context),
      // appBar: AppBar(
      //     actions: [
      //       Padding(
      //         padding: const EdgeInsets.only(right: 10.0),
      //         child: InkWell(
      //             onTap: () {
      //               print('noti');
      //             },child: Icon(Icons.notifications, color: Colors.white)),
      //       )
      //     ],
      //     flexibleSpace:
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
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: Image.asset('assets/logo.png', width: 135),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (_) => CCP_42()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Icon(Icons.notifications, color: Colors.white),
              ),
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
      body: TabBarView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          sapPostTab(),
          SAP_Highlights_Tab(),
        ],
      ),
    );
  }
}
