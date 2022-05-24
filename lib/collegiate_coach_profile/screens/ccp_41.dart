import 'package:flutter/material.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_42.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_drawer.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP_41 extends StatefulWidget {
  const CCP_41({Key? key}) : super(key: key);

  @override
  _CCP_41State createState() => _CCP_41State();
}

class _CCP_41State extends State<CCP_41> with SingleTickerProviderStateMixin {
  late TabController _controller;
  TextEditingController _search = TextEditingController();

  int _selectedIndex = 0; //  Tab Bar Index

  List<Widget> list = [
    Tab(text: 'All'),
    Tab(text: 'Accounts'),
    Tab(text: 'Posts'),
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
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_42()));
                },
                child: Icon(Icons.notifications)),
          ),
        ],
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
        // )
      ),
      drawer: ccp_drawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                  controller: _search,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 12.0),
                    filled: true,
                    fillColor: Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Search",
                    labelStyle: TextStyle(color: Color(0xFF686868)),
                    suffixIcon: Icon(Icons.search, color: Color(0xFF686868)),
                    //  prefixIcon: Icon(Icons.people),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: TabBar(
                //  isScrollable: true,
                labelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
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
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.maxFinite,
              //  color: Colors.blue,
              child: TabBarView(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  All(),
                  Container(),
                  Container(),
                  //  CustomHighlightWidget(), // custom hightlight widget
                  // Container(
                  //   color: Colors.green,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
      // body: TabBarView(
      //   controller: _controller,
      //   physics: NeverScrollableScrollPhysics(),
      //   children: [
      //     Container(),
      //     Container(),
      //     Container(),
      //     //  Team(),
      //     //  Offered()// custom hightlight widget
      //     // Container(
      //     //   color: Colors.green,
      //     // )
      //   ],
      // ),
    );
  }
}

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  List<AllModel> _list = [
    AllModel('assets/coach.png', 'Coach John Doe', '@jdoe', coach: 'coach'),
    AllModel('assets/drawer_img.png', 'Martin Mangram',
        'After a great conversation with coach Ark Carter, I am extremely blessed to receive an offer from the University of Arkansas ',
        time: '1m'),
    AllModel(
        'assets/events_img2.png', 'Ohio State University', 'Columbus, Ohio'),
    AllModel('assets/coach.png', 'Coach John Doe', '@jdoe', coach: 'coach'),
    AllModel(
        'assets/events_img2.png', 'Ohio State University', 'Columbus, Ohio'),
    AllModel('assets/drawer_img.png', 'Martin Mangram',
        'After a great conversation with coach Ark Carter, I am extremely blessed to receive an offer from the University of Arkansas ',
        time: '1m'),
    AllModel('assets/drawer_img.png', 'Martin Mangram',
        'After a great conversation with coach Ark Carter, I am extremely blessed to receive an offer from the University of Arkansas ',
        time: '1m'),
    AllModel('assets/coach.png', 'Coach John Doe', '@jdoe', coach: 'coach'),
    AllModel(
        'assets/events_img2.png', 'Ohio State University', 'Columbus, Ohio'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 40),
              child: ListView.builder(
                  itemCount: _list.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Wrap(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              //    color: Colors.blue,
                              padding: EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Row(
                                children: [
                                  Image.asset(_list[index].img,
                                      width: 40, height: 40, fit: BoxFit.cover),
                                  SizedBox(width: 6),
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(children: [
                                          _list[index].coach != null
                                              ? Text(
                                            _list[index].title,
                                            style: TextStyle(
                                                color: AppColor.yellowColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0),
                                          )
                                              : Text(
                                            _list[index].title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.w500),
                                          ),
                                          SizedBox(width: 4),
                                          _list[index].time != null
                                              ? Text(
                                            '${_list[index].time!}',
                                            style: TextStyle(
                                                color:
                                                AppColor.textGreyColor, fontSize: 12),
                                          )
                                              : Text('')
                                        ]),
                                        SizedBox(height: 4),
                                        Text(_list[index].desc,
                                            overflow: TextOverflow.visible,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(color: AppColor.textGreyColor)
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class AllModel {
  String img, title, desc;
  String? time, coach;

  AllModel(this.img, this.title, this.desc, {this.coach, this.time});
}