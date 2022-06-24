import 'package:flutter/material.dart';
import 'package:recruiter_flutter/model/stats_model.dart';
import 'package:recruiter_flutter/school_coach_profile/widget/scp_app_bar.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/athlete_stats_class.dart';

import '../../widgets/athlete_post_class.dart';
import 'scp30_1.dart';

class SCP29 extends StatefulWidget {
  const SCP29({Key? key}) : super(key: key);

  @override
  _SCP29State createState() => _SCP29State();
}

class _SCP29State extends State<SCP29> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  bool _editProfile = false;

  List<Widget> list = [
    const Tab(text: 'Posts'),
    const Tab(text: 'Stats'),
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
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: scpAppBar('Athelete Profile', Icons.notifications, context),
      backgroundColor: Colors.black,
      body: NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/drawer_img.png'),
                              radius: 40,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Martin Mangram',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500)),
                                Text('Bufford High School',
                                    style: TextStyle(
                                        color: AppColor.textGreyColor)),
                                const SizedBox(height: 10),
                                Container(
                                  height: 28,
                                  width: 48,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFBABABA),
                                    border: Border.all(
                                        color: Colors.white, width: 2.0),
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: const Text('RB',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      )),
                                )
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Container(
                                  height: 32,
                                  width: 76,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF239B36),
                                    // border: Border.all(
                                    //     color: Color(0xFF474747),
                                    //     width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: const Text('Committed',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const SizedBox(height: 16),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SCP30_1()));
                                  },
                                  child: Container(
                                    height: 32,
                                    width: 76,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(
                                          color: const Color(0xFF474747), width: 2.0),
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(8.0)),
                                    ),
                                    child: const Text('Evaluate',
                                        style: TextStyle(
                                            color: Color(0xFF474747),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text(
                          'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua.',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        child: TabBar(
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                          labelColor: Colors.white,
                          unselectedLabelStyle:
                              TextStyle(color: AppColor.greyBorderColor),
                          indicatorColor: Colors.white,
                          onTap: (index) {
                            print('Tab $index is tapped');
                            // Should not used it as it only called when tab options are clicked,
                            // not when user swapped
                          },
                          controller: _controller,
                          tabs: list,
                        ),
                      ),
                    ])))
          ];
        },
        body: SizedBox(
          height: _height,
          width: _width,
          //  color: Colors.blue,
          child: TabBarView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const AtheletePosts(), // custom Post Widget
              AtheleteStats(editProfile: _editProfile)
              //  CustomHighlightWidget(), // custom hightlight widget
              // Container(
              //   color: Colors.green,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
