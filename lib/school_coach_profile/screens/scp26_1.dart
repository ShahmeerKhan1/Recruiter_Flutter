import 'package:flutter/material.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/scp29.dart';
import 'package:recruiter_flutter/school_coach_profile/widget/scp_drawer.dart';
import 'package:recruiter_flutter/school_coach_profile/widget/scp_posts_tab.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_highlight_widget.dart';

class SCP26_1 extends StatefulWidget {
  const SCP26_1({Key? key}) : super(key: key);

  @override
  _SCP26_1State createState() => _SCP26_1State();
}

class _SCP26_1State extends State<SCP26_1> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  static const String routeName = '/profile';

  List<Widget> list = [
    const Tab(text: 'Posts'),
    const Tab(
      text: 'Highlights',
    ),
    const Tab(
      text: 'Top Schools',
    ),
    const Tab(
      text: 'Offers',
    ),
  ];

  bool isFollow = true;

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
        bottom: PreferredSize(
            child: Container(
              color: const Color(0xFF474747),
              height: 4.0,
            ),
            preferredSize: const Size.fromHeight(4.0)),
      ),
      drawer: scpDrawer(context),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            // The containers in the background
            Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  //   color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 26.0),
                    child: Image.asset('assets/profile_cover.png',),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .75,
                  //   color: Colors.pink,
                )
              ],
            ),
            // The card widget with top padding,
            // incase if you wanted bottom padding to work,
            // set the `alignment` of container to Alignment.bottomCenter
            Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.16,
                      right: 20.0,
                      left: 20.0),
                  child: Container(
                    height: 100.0,
                    alignment: Alignment.topLeft,
                    //    color: Colors.green,
                    width: MediaQuery.of(context).size.width,
                    child: Expanded(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //  mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Image.asset('assets/drawer_img.png'),
                          ),
                          //SizedBox(height: 20),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 8),
                              child: Row(
                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    // mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Martin Mangram',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500)),
                                      const Text('Bufford High School',
                                          style: TextStyle(
                                              color: Color(0xFF686868))),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          Row(
                                            children: const [
                                              Text('800',
                                                  style: TextStyle(
                                                      fontSize: 16.0, color: Colors.white)),
                                              SizedBox(width: 4),
                                              Text(
                                                'Followers',
                                                style: TextStyle(color: Color(0xFF686868), fontSize: 12.0),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 16),
                                          Row(
                                            children: const [
                                              Text('600',
                                                  style: TextStyle(
                                                      fontSize: 16.0, color: Colors.white)),
                                              SizedBox(width: 4),
                                              Text('Following',
                                                  style: TextStyle(color: Color(0xFF686868), fontSize: 12.0)),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      //  crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          //   behavior: HitTestBehavior.translucent,
                                            onTap: () {
                                              print('tapped');
                                              setState(() {
                                                isFollow = !isFollow;
                                              });
                                            },
                                            child: isFollow ? Container(
                                              height: 30,
                                              width: 68,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFBABABA),
                                                border: Border.all(
                                                    color: const Color(0xFF474747),
                                                    width: 2.0),
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(8.0)),
                                              ),
                                              child:const Text('Following',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.0,
                                                      fontWeight: FontWeight.w500)),
                                            ) : Container(
                                              height: 30,
                                              width: 70,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                border: Border.all(
                                                    color: const Color(0xFF474747),
                                                    width: 2.0),
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(8.0)),
                                              ),
                                              child: const Text('Follow',
                                                  style: TextStyle(
                                                      color: Color(0xFF474747),
                                                      fontSize: 12.0,
                                                      fontWeight: FontWeight.w500)),
                                            )
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          height: 30,
                                          width: 36,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                                              border: Border.all(
                                                  color: AppColor.textGreyColor,
                                                  width: 2
                                              )
                                          ),
                                          child: const Icon(Icons.work_outline, color: Color(0xFFE0B216)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.20,
                  padding: const EdgeInsets.only(left: 16, right: 16.0, top: 16.0),
                  margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF111111),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      const Text(
                          'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore.',
                          style:
                          TextStyle(color: Colors.white, fontSize: 12.0)),
                      const SizedBox(height: 16),
                      Row(
                        //  crossAxisAlignment: CrossAxisAlignment.start,
                        //  mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Sport:',
                                style: TextStyle(
                                    color: Color(0xFF686868),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Currently:',
                                style: TextStyle(
                                    color: Color(0xFF686868),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Since:',
                                style: TextStyle(
                                    color: Color(0xFF686868),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(width: 22),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Football',
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(height: 10),
                              Text('Head Coach (2 Yrs)',
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(height: 10),
                              Text('Sept 2018',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              print('sad');
                                   Navigator.push(context, MaterialPageRoute(builder: (_) => const SCP29()));
                            },
                            child: Container(
                              height: 74,
                              width: 84,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/atheletic_profile.png'),
                                  const SizedBox(height: 4),
                                  const Text('Athletic Profile',
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              decoration: const BoxDecoration(
                                  color: Color(0xFF0E1E3D),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(16.0))),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: TabBar(
                    isScrollable: true,
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
                SizedBox(
                  height: 300,
                  width: double.maxFinite,
                  //  color: Colors.blue,
                  child: TabBarView(
                    controller: _controller,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SCPPostTab(),
                     // scpPostsTab(), // custom Post Widget
                      const CustomHighlightWidget(),
                      const TopSchools(),
                      const Offers(),
                      //  CustomHighlightWidget(), // custom hightlight widget
                      // Container(
                      //   color: Colors.green,
                      // )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
    // return Scaffold(
    //   // backgroundColor: Colors.white,
    //     appBar: AppBar(
    //       backgroundColor: Colors.black,
    //       centerTitle: true,
    //       elevation: 0,
    //       iconTheme: IconThemeData(color: Colors.white),
    //       title: Text('Profile', style: TextStyle(color: Colors.white)),
    //       actions: [
    //         Padding(
    //           padding: const EdgeInsets.only(right: 16.0),
    //           child: Icon(Icons.notifications, color: Colors.white),
    //         ),
    //       ],
    //       bottom: PreferredSize(
    //           child: Container(
    //             color: Color(0xFF474747),
    //             height: 4.0,
    //           ),
    //           preferredSize: Size.fromHeight(4.0)),
    //     ),
    //     drawer: drawerWidget(context),
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Container(
    //                 // color: Colors.orange,
    //                 padding: EdgeInsets.only(bottom: 50),
    //                 child: Stack(
    //                  // overflow: Overflow.visible,
    //                //   clipBehavior: Clip.none,
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 16.0),
    //                       child: Center(
    //                           child: Image.asset('assets/profile_cover.png')),
    //                     ),
    //                     Positioned(
    //                       bottom: 0.0,
    //                       //  left: 26.0,
    //                       //  right: 16.0,
    //                       child: Container(
    //                         // color: Colors.pink,
    //                         width: MediaQuery
    //                             .of(context)
    //                             .size
    //                             .width,
    //                         padding: EdgeInsets.only(left: 26.0, right: 20.0),
    //                         // height: 70,
    //                         //   alignment: Alignment.centerLeft,
    //                         child: Row(
    //                           crossAxisAlignment: CrossAxisAlignment.end,
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           children: [
    //                             InkWell(
    //                               onTap: () {
    //                                 print('tap');
    //                                 Navigator.push(context, MaterialPageRoute(builder: (_) => SCP28_1()));
    //                               },
    //                               child: CircleAvatar(
    //                                 backgroundImage:
    //                                 AssetImage('assets/drawer_img.png'),
    //                                 radius: 36,
    //                               ),
    //                             ),
    //                             SizedBox(width: 8.0),
    //                             Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               mainAxisAlignment: MainAxisAlignment.end,
    //                               children: [
    //                                 Text('Martin Mangram',
    //                                     style: TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 16.0,
    //                                         fontWeight: FontWeight.w500)),
    //                                 Text('Bufford High School',
    //                                     style: TextStyle(
    //                                         color: Color(0xFF686868))),
    //                               ],
    //                             ),
    //                             Spacer(),
    //                             GestureDetector(
    //                               behavior: HitTestBehavior.translucent,
    //                               onTap: () {
    //                                 print('val');
    //                                 setState(() {
    //                                   isFollow = !isFollow;
    //                                 });
    //                               },
    //                               child: isFollow ? Container(
    //                                 height: 30,
    //                                 width: 68,
    //                                 alignment: Alignment.center,
    //                                 decoration: BoxDecoration(
    //                                   color: Color(0xFFBABABA),
    //                                   border: Border.all(
    //                                       color: Color(0xFF474747),
    //                                       width: 2.0),
    //                                   borderRadius: BorderRadius.all(
    //                                       Radius.circular(8.0)),
    //                                 ),
    //                                 child:Text('Following',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 12.0,
    //                                         fontWeight: FontWeight.w500)),
    //                               ) : Container(
    //                                   height: 30,
    //                                   width: 70,
    //                                   alignment: Alignment.center,
    //                                   decoration: BoxDecoration(
    //                                     color: Colors.black,
    //                                     border: Border.all(
    //                                         color: Color(0xFF474747),
    //                                         width: 2.0),
    //                                     borderRadius: BorderRadius.all(
    //                                         Radius.circular(8.0)),
    //                                   ),
    //                                   child: Text('Follow',
    //                                       style: TextStyle(
    //                                           color: Color(0xFF474747),
    //                                           fontSize: 12.0,
    //                                           fontWeight: FontWeight.w500)),
    //                                 )
    // )
    //                             // Container(
    //                             //   height: 32,
    //                             //   width: 84,
    //                             //   // color: Colors.blue,
    //                             //   alignment: Alignment.center,
    //                             //   decoration: BoxDecoration(
    //                             //     color: Colors.black,
    //                             //     border: Border.all(
    //                             //         color: Color(0xFF686868), width: 2.0),
    //                             //     borderRadius:
    //                             //     BorderRadius.all(Radius.circular(10)),
    //                             //   ),
    //                             //   child: Text(
    //                             //     'Edit Profile',
    //                             //     style: TextStyle(color: Color(0xFF686868)),
    //                             //   ),
    //                             // )
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 padding: EdgeInsets.only(left: 26.0, right: 26.0),
    //                 // color: Colors.yellow,
    //                 child: Row(
    //                   children: [
    //                     Container(
    //                       height: 26,
    //                       width: 66,
    //                       alignment: Alignment.center,
    //                       decoration: BoxDecoration(
    //                         color: Colors.black,
    //                         border: Border.all(
    //                             color: AppColor.goldenColor, width: 2.0),
    //                         borderRadius:
    //                         BorderRadius.all(Radius.circular(8.0)),
    //                       ),
    //                       child: Text('Coach',
    //                           style: TextStyle(
    //                               color: AppColor.goldenColor,
    //                               fontSize: 12.0,
    //                               fontWeight: FontWeight.w500)),
    //                     ),
    //                     SizedBox(width: 16),
    //                     Row(
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //                         Text('800',
    //                             style: TextStyle(
    //                                 fontSize: 16.0, color: Colors.white)),
    //                         SizedBox(width: 2),
    //                         Text(
    //                           'Followers',
    //                           style: TextStyle(color: Color(0xFF686868)),
    //                         ),
    //                       ],
    //                     ),
    //                     SizedBox(width: 16),
    //                     Row(
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //                         Text('600',
    //                             style: TextStyle(
    //                                 fontSize: 16.0, color: Colors.white)),
    //                         SizedBox(width: 2),
    //                         Text('Following',
    //                             style: TextStyle(color: Color(0xFF686868))),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 height: MediaQuery
    //                     .of(context)
    //                     .size
    //                     .height * 0.20,
    //                 padding: EdgeInsets.only(left: 16, right: 16.0, top: 16.0),
    //                 margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
    //                 decoration: BoxDecoration(
    //                   color: Color(0xFF111111),
    //                   borderRadius: BorderRadius.all(Radius.circular(16)),
    //                 ),
    //                 child: Column(
    //                   children: [
    //                     Text(
    //                         'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore.',
    //                         style:
    //                         TextStyle(color: Colors.white, fontSize: 12.0)),
    //                     SizedBox(height: 16),
    //                     Row(
    //                       //  crossAxisAlignment: CrossAxisAlignment.start,
    //                       //  mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                               'Sport:',
    //                               style: TextStyle(
    //                                   color: Color(0xFF686868),
    //                                   fontWeight: FontWeight.w500),
    //                             ),
    //                             SizedBox(height: 10),
    //                             Text(
    //                               'Currently:',
    //                               style: TextStyle(
    //                                   color: Color(0xFF686868),
    //                                   fontWeight: FontWeight.w500),
    //                             ),
    //                             SizedBox(height: 10),
    //                             Text(
    //                               'Since:',
    //                               style: TextStyle(
    //                                   color: Color(0xFF686868),
    //                                   fontWeight: FontWeight.w500),
    //                             ),
    //                           ],
    //                         ),
    //                         SizedBox(width: 22),
    //                         Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Text('Football',
    //                                 style: TextStyle(color: Colors.white)),
    //                             SizedBox(height: 10),
    //                             Text('Head Coach (2 Yrs)',
    //                                 style: TextStyle(color: Colors.white)),
    //                             SizedBox(height: 10),
    //                             Text('Sept 2018',
    //                                 style: TextStyle(color: Colors.white)),
    //                           ],
    //                         ),
    //                         Spacer(),
    //                         InkWell(
    //                           onTap: () {
    //                             print('sad');
    //                             Navigator.push(context, MaterialPageRoute(builder: (_) => SCP29()));
    //                           },
    //                           child: Container(
    //                             height: 74,
    //                             width: 84,
    //                             alignment: Alignment.center,
    //                             child: Column(
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               children: [
    //                                 Image.asset('assets/atheletic_profile.png'),
    //                                 SizedBox(height: 4),
    //                                 Text('Athletic Profile',
    //                                     style: TextStyle(
    //                                         fontSize: 10.0,
    //                                         color: Colors.white,
    //                                         fontWeight: FontWeight.w500))
    //                               ],
    //                             ),
    //                             decoration: BoxDecoration(
    //                                 color: Color(0xFF0E1E3D),
    //                                 borderRadius:
    //                                 BorderRadius.all(Radius.circular(16.0))),
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 child: TabBar(
    //                   isScrollable: true,
    //                   labelStyle: TextStyle(
    //                       fontWeight: FontWeight.bold, fontSize: 16.0),
    //                   labelColor: Colors.white,
    //                   unselectedLabelStyle:
    //                   TextStyle(color: AppColor.greyBorderColor),
    //                   indicatorColor: Colors.white,
    //                   onTap: (index) {
    //                     print('Tab $index is tapped');
    //                     // Should not used it as it only called when tab options are clicked,
    //                     // not when user swapped
    //                   },
    //                   controller: _controller,
    //                   tabs: list,
    //                 ),
    //               ),
    //               Container(
    //                 height: 250,
    //                 width: double.maxFinite,
    //                 //  color: Colors.blue,
    //                 child: TabBarView(
    //                   controller: _controller,
    //                   physics: NeverScrollableScrollPhysics(),
    //                   children: [
    //                     postsTab(), // custom Post Widget
    //                     CustomHighlightWidget(),
    //                     TopSchools(),
    //                     Offers(),
    //                     //  CustomHighlightWidget(), // custom hightlight widget
    //                     // Container(
    //                     //   color: Colors.green,
    //                     // )
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ));
  }
}

class TopSchools extends StatelessWidget {
  const TopSchools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}


