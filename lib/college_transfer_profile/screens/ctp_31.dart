import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_33_1.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/perform_history_list.dart';
import 'package:recruiter_flutter/model/stats_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

bool _editProfile = false;

class CTP31 extends StatefulWidget {
  const CTP31({Key? key}) : super(key: key);

  @override
  _CTP31State createState() => _CTP31State();
}

class _CTP31State extends State<CTP31> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(text: 'Posts'),
    Tab(text: 'Stats'),
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

  String? selectSchool = 'Ohio State Buckeye';
  String? selectPosition = 'RB';

  final List<String> schoolList = [
    'Bufford High School',
    'Ohio State Buckeye',
    'Hardward University'
  ];
  final List<String> positionList = ['RB', 'HC', 'VC'];

  final _selectSchoolFormKey = GlobalKey<FormState>();
  final _selectPositionFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: customAppBar('Athelete Profile', Icons.notifications),
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
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/drawer_img.png'),
                              radius: 40,
                            ),
                            SizedBox(width: 8),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Martin Mangram',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500)),
                                _editProfile
                                    ? Container(
                                        height: 28,
                                        width: 150,
                                        alignment: Alignment.center,
                                        child: Form(
                                          key: _selectSchoolFormKey,
                                          child: DropdownButtonFormField2(
                                            buttonPadding: EdgeInsets.all(0.0),
                                            //  alignment: Alignment.center,
                                            //  buttonWidth: 50,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(left: 10.0),
                                              isDense: true,
                                              filled: true,
                                              fillColor: Color(0xFF111111),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              labelStyle: TextStyle(
                                                  color: Color(0xFFBABABA)),
                                              enabledBorder: myinputborder(),
                                              focusedBorder: myfocusborder(),
                                            ),
                                            hint: const Text(
                                              'Select School',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFFBABABA)),
                                            ),
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey,
                                            ),
                                            iconSize: 30,
                                            buttonHeight: 80,
                                            dropdownDecoration: BoxDecoration(
                                              color: Color(0xFF111111),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            items: schoolList
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ))
                                                .toList(),
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Select School';
                                              }
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                selectSchool = value.toString();
                                                print(
                                                    'home onchange $selectSchool');
                                              });
                                              //Do something when changing the item if you want.
                                            },
                                            onSaved: (value) {
                                              setState(() {
                                                selectSchool = value.toString();
                                                print('home val $selectSchool');
                                              });
                                            },
                                          ),
                                        ),
                                      )
                                    : Text(selectSchool.toString(),
                                        style: TextStyle(
                                            color: Color(0xFF686868),
                                            fontWeight: FontWeight.w500)),
                                !_editProfile
                                    ? SizedBox(height: 10)
                                    : Container(),
                                _editProfile
                                    ? Container(
                                        height: 28,
                                        width: 150,
                                        alignment: Alignment.center,
                                        child: Form(
                                          key: _selectPositionFormKey,
                                          child: DropdownButtonFormField2(
                                            buttonPadding: EdgeInsets.all(0.0),
                                            //  alignment: Alignment.center,
                                            //  buttonWidth: 50,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(left: 10.0),
                                              isDense: true,
                                              filled: true,
                                              fillColor: Color(0xFF111111),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              labelStyle: TextStyle(
                                                  color: Color(0xFFBABABA)),
                                              enabledBorder: myinputborder(),
                                              focusedBorder: myfocusborder(),
                                            ),
                                            hint: const Text(
                                              'Select Position',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFFBABABA)),
                                            ),
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey,
                                            ),
                                            iconSize: 26,
                                            buttonHeight: 30,
                                            dropdownDecoration: BoxDecoration(
                                              color: Color(0xFF111111),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            items: positionList
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ))
                                                .toList(),
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Select Position';
                                              }
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                selectPosition =
                                                    value.toString();
                                                print(
                                                    'position onchange $selectPosition');
                                              });
                                              //Do something when changing the item if you want.
                                            },
                                            onSaved: (value) {
                                              setState(() {
                                                selectPosition =
                                                    value.toString();
                                                print(
                                                    'position onsaved $selectPosition');
                                              });
                                            },
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 26,
                                        width: 46,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFBABABA),
                                          border: Border.all(
                                              color: Colors.white, width: 2.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                        ),
                                        child: Text(selectPosition.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            )),
                                      )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => CTP33_1()));
                                },
                                  child: Container(
                                    height: 32,
                                    width: 80,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF239B36),
                                      // border: Border.all(
                                      //     color: Color(0xFF474747),
                                      //     width: 2.0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8.0)),
                                    ),
                                    child: Text('Committed',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                                SizedBox(height: 16),
                                InkWell(
                                    onTap: () {
                                      print('edit');
                                      setState(() {
                                        _editProfile = !_editProfile;
                                      });
                                    },
                                    child: !_editProfile
                                        ? Container(
                                            height: 32,
                                            width: 80,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              border: Border.all(
                                                  color: Color(0xFF474747),
                                                  width: 2.0),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                            ),
                                            child: Text('Edit Profile',
                                                style: TextStyle(
                                                    color: Color(0xFF474747),
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          )
                                        : Container(
                                            height: 30,
                                            width: 78,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                border: Border.all(
                                                    color: Color(0xFF1F6DE2),
                                                    width: 1.5)),
                                            child: Text('Save',
                                                style: TextStyle(
                                                    color: Color(0xFF1F6DE2),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13.0)),
                                          ))
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
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
                          labelStyle: TextStyle(
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
        body: Container(
          height: _height,
          width: _width,
          //  color: Colors.blue,
          child: TabBarView(
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
            children: [
              AtheletePosts(), // custom Post Widget
              AtheleteStats()
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

class AtheletePosts extends StatefulWidget {
  const AtheletePosts({Key? key}) : super(key: key);

  @override
  _AtheletePostsState createState() => _AtheletePostsState();
}

class _AtheletePostsState extends State<AtheletePosts> {
  bool leader = false;
  bool tactical = false;
  bool sprinter = false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 16.0, top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            Text(
              'Physical Information',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '16',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0),
                    ),
                    Text(
                      'YRS',
                      style: TextStyle(color: AppColor.textGreyColor),
                    )
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '182',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0),
                    ),
                    Text(
                      'LBS',
                      style: TextStyle(color: AppColor.textGreyColor),
                    )
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "5'11''",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0),
                    ),
                    Text(
                      'IN',
                      style: TextStyle(color: AppColor.textGreyColor),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Foot",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 8),
                    Image.asset('assets/foot.png'),
                  ],
                ),
                SizedBox(width: 36),
                Column(
                  children: [
                    Text("Hand",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 8),
                    Image.asset('assets/hand.png'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 42),
            Column(
              children: [
                Text('Academic',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                SizedBox(height: 16),
                Text(
                  "3.2",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0),
                ),
                Text(
                  'GPA',
                  style: TextStyle(color: AppColor.textGreyColor),
                )
              ],
            ),
            SizedBox(height: 56),
            Column(
              children: [
                Text(
                  'Top Characteristics',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          leader = !leader;
                        });
                      },
                      child: Expanded(
                        child: Container(
                          height: _height * 0.14,
                          width: _width * 0.28,
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                              color: leader ? Color(0xFF10E9A1) : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              border: Border.all(color: Color(0xFF10E9A1))),
                          child: Column(
                            children: [
                              leader
                                  ? Image.asset('assets/leader.png',
                                      color: Colors.white,
                                      fit: BoxFit.fill,
                                      width: 75,
                                      height: 75)
                                  : Image.asset('assets/leader.png',
                                      fit: BoxFit.fill, width: 75, height: 75),
                              Text(
                                'Leader',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          tactical = !tactical;
                        });
                      },
                      child: Expanded(
                        child: Container(
                          height: _height * 0.14,
                          width: _width * 0.28,
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                              color: tactical ? Color(0xFF10E9A1) : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              border: Border.all(color: Color(0xFF10E9A1))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              !tactical
                                  ? Image.asset(
                                      'assets/tactical.png',
                                      fit: BoxFit.cover,
                                      height: 85,
                                      width: 85,
                                    )
                                  : Image.asset('assets/tactical.png',
                                      fit: BoxFit.cover,
                                      height: 85,
                                      width: 85,
                                      color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Tactical',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          sprinter = !sprinter;
                        });
                      },
                      child: Expanded(
                        child: Container(
                          height: _height * 0.14,
                          width: _width * 0.28,
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                              color: sprinter ? Color(0xFF10e9A1) : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              border: Border.all(color: Color(0xFF10E9A1))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              !sprinter
                                  ? Image.asset('assets/sprinter.png',
                                      fit: BoxFit.cover)
                                  : Image.asset('assets/sprinter.png',
                                      fit: BoxFit.cover, color: Colors.white),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Sprinter',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 32),
                Image.asset('assets/shape.png'),
                SizedBox(height: 50),
                Text(
                  'Timeline',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Container(
                  // color: Colors.blue,
                  height: _height,
                  padding: EdgeInsets.only(top: 16.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 6,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          height: _height * 0.09,
                          width: _width,
                          margin: EdgeInsets.only(bottom: 16.0),
                          padding: EdgeInsets.only(left: 16.0),
                          decoration: BoxDecoration(
                              color: Color(0xFF111111),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Row(
                            children: [
                              Image.asset('assets/iowa.png'),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Offer',
                                    style: TextStyle(
                                        color: Color(0xFFFFEE00),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: 'lowa Hawkeyes',
                                      style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' send an offer',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.none)),
                                        // can add more TextSpans here...
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Feb 24th, 2021',
                                        style:
                                            TextStyle(color: Color(0xFF686868)),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AtheleteStats extends StatefulWidget {
  AtheleteStats({Key? key}) : super(key: key);

  @override
  State<AtheleteStats> createState() => _AtheleteStatsState();
}

class _AtheleteStatsState extends State<AtheleteStats> {
  List<StatsModel> _list = [
    StatsModel(
        date: 'Fri, Oct 2nd',
        team: 'School 1 Vs School2',
        location: 'Ohio Stadium',
        status: 'W 41-24',
        ratio: '7.2',
        rating: 'Rating',
        color: Color(0xFF239B36)),
    StatsModel(
        date: 'Fri, Oct 2nd',
        team: 'School 1 Vs School2',
        location: 'Ohio Stadium',
        status: 'L 24-29',
        ratio: '7.2',
        rating: 'Rating',
        color: Color(0xFFF61F1F)),
    StatsModel(
        date: 'Fri, Oct 2nd',
        team: 'School 1 Vs School2',
        location: 'Ohio Stadium',
        status: 'W 41-24',
        ratio: '7.2',
        rating: 'Rating',
        color: Color(0xFF239B36)),
    StatsModel(
        date: 'Fri, Oct 2nd',
        team: 'School 1 Vs School2',
        location: 'Ohio Stadium',
        status: 'L 24-40',
        ratio: '7.2',
        rating: 'Rating',
        color: Color(0xFFF61F1F)),
    StatsModel(
        date: 'Fri, Oct 2nd',
        team: 'School 1 Vs School2',
        location: 'Ohio Stadium',
        status: 'W 41-24',
        ratio: '7.2',
        rating: 'Rating',
        color: Color(0xFF239B36)),
    StatsModel(
        date: 'Fri, Oct 2nd',
        team: 'School 1 Vs School2',
        location: 'Ohio Stadium',
        status: 'W 41-24',
        ratio: '7.2',
        rating: 'Rating',
        color: Color(0xFF239B36)),
  ];

  TextEditingController title = TextEditingController(text: ' ');
  TextEditingController description = TextEditingController(text: ' ');
  TextEditingController date = TextEditingController();
  TextEditingController location = TextEditingController(text: ' ');
  TextEditingController homeScoreCtr = TextEditingController(text: ' ');
  TextEditingController awayScoreCtr = TextEditingController(text: ' ');
  TextEditingController rating = TextEditingController(text: ' ');

  TextEditingController benchCtr = TextEditingController(text: '00');
  TextEditingController squatCtr = TextEditingController(text: '00');
  TextEditingController verticalCtr = TextEditingController(text: '00');
  TextEditingController broadCtr = TextEditingController(text: '00');
  TextEditingController powerCtr = TextEditingController(text: '00');
  TextEditingController deadCtr = TextEditingController(text: '00');

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    date.dispose();
    location.dispose();
    homeScoreCtr.dispose();
    awayScoreCtr.dispose();
    rating.dispose();
    super.dispose();
  }

  static const id = '/page1';

  // final controller = Get.put(Controller());

  bool isButtonEnabled = false;

  final List<String> homeTeam = ['Team 1', 'Team 2', 'Team 3'];

  final List<String> awayTeam = ['Team X', 'Team Y', 'Team Z'];

  final List<String> benchList = [''];
  final List<String> squatList = [''];
  final List<String> verticalList = [''];
  final List<String> broadList = [''];
  final List<String> powerList = [''];
  final List<String> deadList = [''];

  String? selectedHomeTeam;
  String? selectedAwayTeam;

  String? benchPress;
  String? squat;
  String? vertical;
  String? broadJump;
  String? powerClean;
  String? deadLift;

  final _homeTeamFormKey = GlobalKey<FormState>();
  final _awayTeamFormKey = GlobalKey<FormState>();

  final _benchPressFormKey = GlobalKey<FormState>();
  final _squatFormKey = GlobalKey<FormState>();
  final _verticalFormKey = GlobalKey<FormState>();
  final _broadJumpFormKey = GlobalKey<FormState>();
  final _powerCleanFormKey = GlobalKey<FormState>();
  final _deadLiftFormKey = GlobalKey<FormState>();

  File? imageFile;

  _onAddImageClick() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
    // final ImagePicker _picker = ImagePicker();
    // imageFile = await _picker.pickImage(
    //   source: ImageSource.gallery,
    // );
    // final File? file = File(imageFile!.path);
    // return file;
  }

  @override
  void initState() {
    super.initState();

    title = TextEditingController(text: "");

    if (title.text.trim() != "") {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
  }

  bool isTextFieldEmpty() {
    setState(() {
      if (title.text != "") {
        isButtonEnabled = true;
      } else {
        isButtonEnabled = false;
      }
    });
    return isButtonEnabled;
  }

  bool _editPerformance = false;
  bool _addNewGame = false;

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: !_addNewGame
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Performance History',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    ListView.builder(
                        itemCount: _list.length,
                        shrinkWrap: true,
                        primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return PerformHistoryList(
                              index: index, list: _list, callback: refresh);
                        }),
                    SizedBox(height: 12),
                    _editPerformance
                        ? Column(
                            children: [
                              Container(
                                width: _width,
                                height: 44,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                                child: ElevatedButton(
                                  child: Text(
                                    'Add New Game',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _addNewGame = !_addNewGame;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFBABABA),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _editPerformance = !_editPerformance;
                                    });
                                  },
                                  child: Container(
                                    height: 44,
                                    width: _width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: Color(0xFF1F6DE2),
                                            width: 1.5)),
                                    child: Text('Save',
                                        style: TextStyle(
                                            color: Color(0xFF1F6DE2),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0)),
                                  )),
                            ],
                          )
                        : Container(
                            width: _width,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            child: ElevatedButton(
                              child: Text(
                                'Edit Performance History',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                setState(() {
                                  _editPerformance = !_editPerformance;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFBABABA),
                              ),
                            ),
                          ),
                    SizedBox(height: 38),
                    _editPerformance
                        ? Container()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Physical Stats',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0)),
                              !_editProfile
                                  ? Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 26.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    benchCtr.text,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 36),
                                                  ),
                                                  Container(
                                                    //   color: Colors.blue,
                                                    width: 125,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Bench Press',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFFFFEE00),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              // SizedBox(width: 62),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    squatCtr.text,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 36),
                                                  ),
                                                  Container(
                                                    //    color: Colors.blue,
                                                    width: 125,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Squat',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFFFFEE00),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 32),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    verticalCtr.text,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 36),
                                                  ),
                                                  Container(
                                                    //  color: Colors.blue,
                                                    width: 125,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Vertical',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFFFFEE00),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              //   SizedBox(width: 62),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    broadCtr.text,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 36),
                                                  ),
                                                  Container(
                                                    //   color: Colors.blue,
                                                    width: 125,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Broad Jump',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFFFFEE00),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 32),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16.0, bottom: 16.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    powerCtr.text,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 36),
                                                  ),
                                                  Container(
                                                    //     color: Colors.blue,
                                                    width: 125,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Power Clean',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFFFFEE00),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              // SizedBox(width: 62),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    deadCtr.text,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 36),
                                                  ),
                                                  Container(
                                                    //    color: Colors.blue,
                                                    width: 125,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Deadlift',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFFFFEE00),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: 54,
                                                  alignment: Alignment.center,
                                                  child: Form(
                                                    key: _benchPressFormKey,
                                                    child:
                                                        DropdownButtonFormField2(
                                                      buttonPadding:
                                                          EdgeInsets.all(0.0),
                                                      //  alignment: Alignment.center,
                                                      //  buttonWidth: 50,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 0,
                                                                bottom: 0),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFF111111),
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        labelStyle: TextStyle(
                                                            color: Color(
                                                                0xFFBABABA)),
                                                        enabledBorder:
                                                            myinputborder(),
                                                        focusedBorder:
                                                            myfocusborder(),
                                                      ),
                                                      hint: const Text(
                                                        'Bench Press',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xFFBABABA)),
                                                      ),
                                                      icon: const Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.grey,
                                                      ),
                                                      iconSize: 30,
                                                      // buttonHeight: 80,
                                                      //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                      dropdownDecoration:
                                                          BoxDecoration(
                                                        color: Colors.purple,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      items: benchList
                                                          .map((item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: item,
                                                                child: Text(
                                                                  item,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Color(
                                                                          0xFFBABABA)),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      validator: (value) {
                                                        if (value == null) {
                                                          return 'Bench Press';
                                                        }
                                                      },
                                                      onChanged: (value) {
                                                        setState(() {
                                                          print(
                                                              'bench onchange $benchPress');
                                                          benchPress =
                                                              value.toString();
                                                        });
                                                        //Do something when changing the item if you want.
                                                      },
                                                      onSaved: (value) {
                                                        setState(() {
                                                          print(
                                                              'bench val $benchPress');
                                                          benchPress =
                                                              value.toString();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 12),
                                              Expanded(
                                                flex: 1,
                                                child: TextField(
                                                    controller: benchCtr,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFF111111),
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 16.0,
                                                              right: 16,
                                                              top: 0,
                                                              bottom: 0),
                                                      // contentPadding: EdgeInsets.only(left: 16),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      // prefixIcon: Icon(Icons.lock),
                                                      // labelText: "MM/DD/YYYY",
                                                      //  labelText: "Reply To Post...",
                                                      labelStyle: TextStyle(
                                                          color:
                                                              Color(0xFFBABABA),
                                                          fontSize: 12),
                                                      enabledBorder:
                                                          myinputborder(),
                                                      focusedBorder:
                                                          myfocusborder(),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 12),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: 54,
                                                  alignment: Alignment.center,
                                                  child: Form(
                                                    key: _squatFormKey,
                                                    child:
                                                        DropdownButtonFormField2(
                                                      buttonPadding:
                                                          EdgeInsets.all(0.0),
                                                      //  alignment: Alignment.center,
                                                      //  buttonWidth: 50,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 0,
                                                                bottom: 0),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFF111111),
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        labelStyle: TextStyle(
                                                            color: Color(
                                                                0xFFBABABA)),
                                                        enabledBorder:
                                                            myinputborder(),
                                                        focusedBorder:
                                                            myfocusborder(),
                                                      ),
                                                      hint: const Text(
                                                        'Squat',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xFFBABABA)),
                                                      ),
                                                      icon: const Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.grey,
                                                      ),
                                                      iconSize: 30,
                                                      // buttonHeight: 80,
                                                      //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                      dropdownDecoration:
                                                          BoxDecoration(
                                                        color: Colors.purple,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      items: squatList
                                                          .map((item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: item,
                                                                child: Text(
                                                                  item,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Color(
                                                                          0xFFBABABA)),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      validator: (value) {
                                                        if (value == null) {
                                                          return 'Squat List';
                                                        }
                                                      },
                                                      onChanged: (value) {
                                                        setState(() {
                                                          print(
                                                              'bench onchange $squat');
                                                          squat =
                                                              value.toString();
                                                        });
                                                        //Do something when changing the item if you want.
                                                      },
                                                      onSaved: (value) {
                                                        setState(() {
                                                          print(
                                                              'bench val $squat');
                                                          squat =
                                                              value.toString();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 12),
                                              Expanded(
                                                flex: 1,
                                                child: TextField(
                                                    controller: squatCtr,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFF111111),
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 16.0,
                                                              right: 16,
                                                              top: 0,
                                                              bottom: 0),
                                                      // contentPadding: EdgeInsets.only(left: 16),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      // prefixIcon: Icon(Icons.lock),
                                                      // labelText: "MM/DD/YYYY",
                                                      //  labelText: "Reply To Post...",
                                                      labelStyle: TextStyle(
                                                          color:
                                                              Color(0xFFBABABA),
                                                          fontSize: 12),
                                                      enabledBorder:
                                                          myinputborder(),
                                                      focusedBorder:
                                                          myfocusborder(),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 12),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: 54,
                                                  alignment: Alignment.center,
                                                  child: Form(
                                                    key: _verticalFormKey,
                                                    child:
                                                        DropdownButtonFormField2(
                                                      buttonPadding:
                                                          EdgeInsets.all(0.0),
                                                      //  alignment: Alignment.center,
                                                      //  buttonWidth: 50,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 0,
                                                                bottom: 0),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFF111111),
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        labelStyle: TextStyle(
                                                            color: Color(
                                                                0xFFBABABA)),
                                                        enabledBorder:
                                                            myinputborder(),
                                                        focusedBorder:
                                                            myfocusborder(),
                                                      ),
                                                      hint: const Text(
                                                        'Vertical',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xFFBABABA)),
                                                      ),
                                                      icon: const Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.grey,
                                                      ),
                                                      iconSize: 30,
                                                      // buttonHeight: 80,
                                                      //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                      dropdownDecoration:
                                                          BoxDecoration(
                                                        color: Colors.purple,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      items: verticalList
                                                          .map((item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: item,
                                                                child: Text(
                                                                  item,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Color(
                                                                          0xFFBABABA)),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      validator: (value) {
                                                        if (value == null) {
                                                          return 'Vertical';
                                                        }
                                                      },
                                                      onChanged: (value) {
                                                        setState(() {
                                                          print(
                                                              'vertical onchange $vertical');
                                                          vertical =
                                                              value.toString();
                                                        });
                                                        //Do something when changing the item if you want.
                                                      },
                                                      onSaved: (value) {
                                                        setState(() {
                                                          print(
                                                              'vertical val $vertical');
                                                          vertical =
                                                              value.toString();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 12),
                                              Expanded(
                                                flex: 1,
                                                child: TextField(
                                                    controller: verticalCtr,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFF111111),
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 16.0,
                                                              right: 16,
                                                              top: 0,
                                                              bottom: 0),
                                                      // contentPadding: EdgeInsets.only(left: 16),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      // prefixIcon: Icon(Icons.lock),
                                                      // labelText: "MM/DD/YYYY",
                                                      //  labelText: "Reply To Post...",
                                                      labelStyle: TextStyle(
                                                          color:
                                                              Color(0xFFBABABA),
                                                          fontSize: 12),
                                                      enabledBorder:
                                                          myinputborder(),
                                                      focusedBorder:
                                                          myfocusborder(),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 12),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: 54,
                                                  alignment: Alignment.center,
                                                  child: Form(
                                                    key: _broadJumpFormKey,
                                                    child:
                                                        DropdownButtonFormField2(
                                                      buttonPadding:
                                                          EdgeInsets.all(0.0),
                                                      //  alignment: Alignment.center,
                                                      //  buttonWidth: 50,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 0,
                                                                bottom: 0),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFF111111),
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        labelStyle: TextStyle(
                                                            color: Color(
                                                                0xFFBABABA)),
                                                        enabledBorder:
                                                            myinputborder(),
                                                        focusedBorder:
                                                            myfocusborder(),
                                                      ),
                                                      hint: const Text(
                                                        'Broad Jump',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xFFBABABA)),
                                                      ),
                                                      icon: const Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.grey,
                                                      ),
                                                      iconSize: 30,
                                                      // buttonHeight: 80,
                                                      //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                      dropdownDecoration:
                                                          BoxDecoration(
                                                        color: Colors.purple,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      items: broadList
                                                          .map((item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: item,
                                                                child: Text(
                                                                  item,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Color(
                                                                          0xFFBABABA)),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      validator: (value) {
                                                        if (value == null) {
                                                          return 'Broad Jump';
                                                        }
                                                      },
                                                      onChanged: (value) {
                                                        setState(() {
                                                          print(
                                                              'broad onchange $broadJump');
                                                          broadJump =
                                                              value.toString();
                                                        });
                                                        //Do something when changing the item if you want.
                                                      },
                                                      onSaved: (value) {
                                                        setState(() {
                                                          print(
                                                              'broad val $broadJump');
                                                          broadJump =
                                                              value.toString();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 12),
                                              Expanded(
                                                flex: 1,
                                                child: TextField(
                                                    controller: broadCtr,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFF111111),
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 16.0,
                                                              right: 16,
                                                              top: 0,
                                                              bottom: 0),
                                                      // contentPadding: EdgeInsets.only(left: 16),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      // prefixIcon: Icon(Icons.lock),
                                                      // labelText: "MM/DD/YYYY",
                                                      //  labelText: "Reply To Post...",
                                                      labelStyle: TextStyle(
                                                          color:
                                                              Color(0xFFBABABA),
                                                          fontSize: 12),
                                                      enabledBorder:
                                                          myinputborder(),
                                                      focusedBorder:
                                                          myfocusborder(),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 12),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: 54,
                                                  alignment: Alignment.center,
                                                  child: Form(
                                                    key: _powerCleanFormKey,
                                                    child:
                                                        DropdownButtonFormField2(
                                                      buttonPadding:
                                                          EdgeInsets.all(0.0),
                                                      //  alignment: Alignment.center,
                                                      //  buttonWidth: 50,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 0,
                                                                bottom: 0),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFF111111),
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        labelStyle: TextStyle(
                                                            color: Color(
                                                                0xFFBABABA)),
                                                        enabledBorder:
                                                            myinputborder(),
                                                        focusedBorder:
                                                            myfocusborder(),
                                                      ),
                                                      hint: const Text(
                                                        'Power Clean',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xFFBABABA)),
                                                      ),
                                                      icon: const Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.grey,
                                                      ),
                                                      iconSize: 30,
                                                      // buttonHeight: 80,
                                                      //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                      dropdownDecoration:
                                                          BoxDecoration(
                                                        color: Colors.purple,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      items: powerList
                                                          .map((item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: item,
                                                                child: Text(
                                                                  item,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Color(
                                                                          0xFFBABABA)),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      validator: (value) {
                                                        if (value == null) {
                                                          return 'Power List';
                                                        }
                                                      },
                                                      onChanged: (value) {
                                                        setState(() {
                                                          print(
                                                              'power onchange $powerClean');
                                                          powerClean =
                                                              value.toString();
                                                        });
                                                        //Do something when changing the item if you want.
                                                      },
                                                      onSaved: (value) {
                                                        setState(() {
                                                          print(
                                                              'bench val $powerClean');
                                                          powerClean =
                                                              value.toString();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 12),
                                              Expanded(
                                                flex: 1,
                                                child: TextField(
                                                    controller: powerCtr,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFF111111),
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 16.0,
                                                              right: 16,
                                                              top: 0,
                                                              bottom: 0),
                                                      // contentPadding: EdgeInsets.only(left: 16),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      // prefixIcon: Icon(Icons.lock),
                                                      // labelText: "MM/DD/YYYY",
                                                      //  labelText: "Reply To Post...",
                                                      labelStyle: TextStyle(
                                                          color:
                                                              Color(0xFFBABABA),
                                                          fontSize: 12),
                                                      enabledBorder:
                                                          myinputborder(),
                                                      focusedBorder:
                                                          myfocusborder(),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 12),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: 54,
                                                  alignment: Alignment.center,
                                                  child: Form(
                                                    key: _deadLiftFormKey,
                                                    child:
                                                        DropdownButtonFormField2(
                                                      buttonPadding:
                                                          EdgeInsets.all(0.0),
                                                      //  alignment: Alignment.center,
                                                      //  buttonWidth: 50,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 0,
                                                                bottom: 0),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFF111111),
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        labelStyle: TextStyle(
                                                            color: Color(
                                                                0xFFBABABA)),
                                                        enabledBorder:
                                                            myinputborder(),
                                                        focusedBorder:
                                                            myfocusborder(),
                                                      ),
                                                      hint: const Text(
                                                        'Dead Lift',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xFFBABABA)),
                                                      ),
                                                      icon: const Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.grey,
                                                      ),
                                                      iconSize: 30,
                                                      // buttonHeight: 80,
                                                      //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                      dropdownDecoration:
                                                          BoxDecoration(
                                                        color: Colors.purple,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      items: deadList
                                                          .map((item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: item,
                                                                child: Text(
                                                                  item,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Color(
                                                                          0xFFBABABA)),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      validator: (value) {
                                                        if (value == null) {
                                                          return 'Dead Lift';
                                                        }
                                                      },
                                                      onChanged: (value) {
                                                        setState(() {
                                                          print(
                                                              'dead onchange $deadLift');
                                                          deadLift =
                                                              value.toString();
                                                        });
                                                        //Do something when changing the item if you want.
                                                      },
                                                      onSaved: (value) {
                                                        setState(() {
                                                          print(
                                                              'dead val $deadLift');
                                                          deadLift =
                                                              value.toString();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 12),
                                              Expanded(
                                                flex: 1,
                                                child: TextField(
                                                    controller: deadCtr,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFF111111),
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 16.0,
                                                              right: 16,
                                                              top: 0,
                                                              bottom: 0),
                                                      // contentPadding: EdgeInsets.only(left: 16),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      // prefixIcon: Icon(Icons.lock),
                                                      // labelText: "MM/DD/YYYY",
                                                      //  labelText: "Reply To Post...",
                                                      labelStyle: TextStyle(
                                                          color:
                                                              Color(0xFFBABABA),
                                                          fontSize: 12),
                                                      enabledBorder:
                                                          myinputborder(),
                                                      focusedBorder:
                                                          myfocusborder(),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          )
                  ],
                )
              : Column(
                  children: [
                    Text(
                      'Performance History',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    SizedBox(height: 12),
                    imageFile != null
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            //  height: 200,
                            //  height: 200,
                            decoration: BoxDecoration(
                              // color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              border: Border.all(color: Color(0xFF474747)),
                            ),
                            child: Image.file(
                              imageFile!,
                              fit: BoxFit.fill,
                            ),
                          )
                        : Container(
                            height: _height * 0.2,
                            width: _width,
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF111111),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              border: Border.all(color: Color(0xFF474747)),
                            ),
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding:
                                    EdgeInsets.only(left: 12.0, right: 12.0),
                                dashPattern: [16, 16],
                                color: Colors.grey,
                                strokeWidth: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _onAddImageClick();
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xFF919191),
                                        size: 40,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Upload Cover Photo\nFrom Device',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF919191),
                                          fontSize: 12),
                                    )
                                  ],
                                )),
                          ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text('Title',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        SizedBox(height: 6),
                        TextField(
                            controller: title,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onSubmitted: null,
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
                              contentPadding: EdgeInsets.only(
                                  left: 16.0, right: 16, top: 0, bottom: 0),
                              // contentPadding: EdgeInsets.only(left: 16),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              // prefixIcon: Icon(Icons.lock),
                              //  labelText: "Reply To Post...",
                              labelStyle: TextStyle(
                                  color: Color(0xFFBABABA), fontSize: 12),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                            )),
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text('Description (Optional)',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        SizedBox(height: 6),
                        TextField(
                            controller: description,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.multiline,
                            maxLines: 6,
                            textCapitalization: TextCapitalization.sentences,
                            // onSaved: (val) {
                            //   setState(() {
                            //     model.desc = val!;
                            //   });
                            // },
                            onChanged: (val) {
                              //  isTextFieldEmpty();
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF111111),
                              contentPadding: EdgeInsets.only(
                                  left: 16.0, right: 16, top: 0, bottom: 0),
                              // contentPadding: EdgeInsets.only(left: 16),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              // prefixIcon: Icon(Icons.lock),
                              //  labelText: "Reply To Post...",
                              labelStyle: TextStyle(
                                  color: Color(0xFFBABABA), fontSize: 12),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                            )),
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text('Date',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        SizedBox(height: 6),
                        TextField(
                            controller: date,
                            style: TextStyle(color: Colors.white),
                            readOnly: true,
                            // keyboardType: TextInputType.text,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101));
                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = DateFormat('EEEE, d MMM')
                                    .format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  date.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              //  hintText: "MM/DD/YYYY",
                              fillColor: Color(0xFF111111),
                              // hintText: "Search",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              // border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 16.0, right: 16, top: 0, bottom: 0),
                              // contentPadding: EdgeInsets.only(left: 16),
                              // floatingLabelBehavior:
                              //     FloatingLabelBehavior.never,
                              // prefixIcon: Icon(Icons.lock),
                              labelText: "MM/DD/YYYY",
                              //  labelText: "Reply To Post...",
                              labelStyle: TextStyle(
                                  color: AppColor.greyBorderColor,
                                  fontSize: 12),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                            )),
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text('Location',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        SizedBox(height: 6),
                        TextField(
                            controller: location,
                            style: TextStyle(color: Colors.white),
                            textCapitalization: TextCapitalization.sentences,
                            // textAlign: TextAlign.center,
                            // inputFormatters: [
                            //   DateInputFormatter(),
                            // ],
                            // onSaved: (val) {
                            //   setState(() {
                            //     model.desc = val!;
                            //   });
                            // },
                            // onChanged: (val) {
                            //   //  isTextFieldEmpty();
                            // },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF111111),
                              contentPadding: EdgeInsets.only(
                                  left: 16.0, right: 16, top: 0, bottom: 0),
                              // contentPadding: EdgeInsets.only(left: 16),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              // prefixIcon: Icon(Icons.lock),
                              // labelText: "MM/DD/YYYY",
                              //  labelText: "Reply To Post...",
                              labelStyle: TextStyle(
                                  color: Color(0xFFBABABA), fontSize: 12),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                            )),
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 6.0, bottom: 6),
                                    child: Text('Home Team',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ),
                                  Container(
                                    height: 54,
                                    alignment: Alignment.center,
                                    child: Form(
                                      key: _homeTeamFormKey,
                                      child: DropdownButtonFormField2(
                                        buttonPadding: EdgeInsets.all(0.0),
                                        //  alignment: Alignment.center,
                                        //  buttonWidth: 50,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 0,
                                              bottom: 0),
                                          filled: true,
                                          fillColor: Color(0xFF111111),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          labelStyle: TextStyle(
                                              color: Color(0xFFBABABA)),
                                          enabledBorder: myinputborder(),
                                          focusedBorder: myfocusborder(),
                                        ),
                                        hint: const Text(
                                          'Select Team',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFFBABABA)),
                                        ),
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.grey,
                                        ),
                                        iconSize: 30,
                                        // buttonHeight: 80,
                                        //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                        dropdownDecoration: BoxDecoration(
                                          color: Colors.purple,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        items: homeTeam
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFFBABABA)),
                                                  ),
                                                ))
                                            .toList(),
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Select Team';
                                          }
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            selectedHomeTeam = value.toString();
                                            print(
                                                'home onchange $selectedHomeTeam');
                                          });
                                          //Do something when changing the item if you want.
                                        },
                                        onSaved: (value) {
                                          setState(() {
                                            selectedHomeTeam = value.toString();
                                            print('home val $selectedHomeTeam');
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 6.0, bottom: 6),
                                    child: Text('Score',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ),
                                  TextField(
                                      controller: homeScoreCtr,
                                      style: TextStyle(color: Colors.white),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xFF111111),
                                        contentPadding: EdgeInsets.only(
                                            left: 16.0,
                                            right: 16,
                                            top: 0,
                                            bottom: 0),
                                        // contentPadding: EdgeInsets.only(left: 16),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        // prefixIcon: Icon(Icons.lock),
                                        // labelText: "MM/DD/YYYY",
                                        //  labelText: "Reply To Post...",
                                        labelStyle: TextStyle(
                                            color: Color(0xFFBABABA),
                                            fontSize: 12),
                                        enabledBorder: myinputborder(),
                                        focusedBorder: myfocusborder(),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 6.0, bottom: 6),
                                    child: Text('Away Team',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ),
                                  Container(
                                    height: 54,
                                    alignment: Alignment.center,
                                    child: Form(
                                      key: _awayTeamFormKey,
                                      child: DropdownButtonFormField2(
                                        buttonPadding: EdgeInsets.all(0.0),
                                        //  alignment: Alignment.center,
                                        //  buttonWidth: 50,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 0,
                                              bottom: 0),
                                          filled: true,
                                          fillColor: Color(0xFF111111),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          labelStyle: TextStyle(
                                              color: Color(0xFFBABABA)),
                                          enabledBorder: myinputborder(),
                                          focusedBorder: myfocusborder(),
                                        ),
                                        hint: const Text(
                                          'Select Team',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFFBABABA)),
                                        ),
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.grey,
                                        ),
                                        iconSize: 30,
                                        // buttonHeight: 80,
                                        //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                        dropdownDecoration: BoxDecoration(
                                          color: Colors.purple,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        items: awayTeam
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFFBABABA)),
                                                  ),
                                                ))
                                            .toList(),
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Select Team';
                                          }
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            print(
                                                'away ochange $selectedAwayTeam');
                                            selectedAwayTeam = value.toString();
                                          });
                                          //Do something when changing the item if you want.
                                        },
                                        onSaved: (value) {
                                          setState(() {
                                            print('away val $selectedAwayTeam');
                                            selectedAwayTeam = value.toString();
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 6.0, bottom: 6),
                                    child: Text('Score',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ),
                                  TextField(
                                      controller: awayScoreCtr,
                                      style: TextStyle(color: Colors.white),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xFF111111),
                                        contentPadding: EdgeInsets.only(
                                            left: 16.0,
                                            right: 16,
                                            top: 0,
                                            bottom: 0),
                                        // contentPadding: EdgeInsets.only(left: 16),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        // prefixIcon: Icon(Icons.lock),
                                        // labelText: "MM/DD/YYYY",
                                        //  labelText: "Reply To Post...",
                                        labelStyle: TextStyle(
                                            color: Color(0xFFBABABA),
                                            fontSize: 12),
                                        enabledBorder: myinputborder(),
                                        focusedBorder: myfocusborder(),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Your Rating',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              SizedBox(width: 6),
                              Expanded(
                                flex: 3,
                                child: TextField(
                                    controller: rating,
                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.number,
                                    // textAlign: TextAlign.center,
                                    // inputFormatters: [
                                    //   DateInputFormatter(),
                                    // ],
                                    // onSaved: (val) {
                                    //   setState(() {
                                    //     model.desc = val!;
                                    //   });
                                    // },
                                    // onChanged: (val) {
                                    //   //  isTextFieldEmpty();
                                    // },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFF111111),
                                      contentPadding: EdgeInsets.only(
                                          left: 16.0,
                                          right: 16,
                                          top: 0,
                                          bottom: 0),
                                      // contentPadding: EdgeInsets.only(left: 16),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      // prefixIcon: Icon(Icons.lock),
                                      // labelText: "MM/DD/YYYY",
                                      //  labelText: "Reply To Post...",
                                      labelStyle: TextStyle(
                                          color: Color(0xFFBABABA),
                                          fontSize: 12),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Your Game Rating Will Be Available For Coaches To\nVote In With Their Rating For This Game As Well.',
                          style: TextStyle(color: Color(0xFF585656)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 54,
                                      alignment: Alignment.center,
                                      child: Form(
                                     //   key: _benchPressFormKey,
                                        child:
                                        DropdownButtonFormField2(
                                          buttonPadding:
                                          EdgeInsets.all(0.0),
                                          //  alignment: Alignment.center,
                                          //  buttonWidth: 50,
                                          decoration:
                                          InputDecoration(
                                            contentPadding:
                                            EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 0,
                                                bottom: 0),
                                            filled: true,
                                            fillColor:
                                            Color(0xFF111111),
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior
                                                .never,
                                            labelStyle: TextStyle(
                                                color: Color(
                                                    0xFFBABABA)),
                                            enabledBorder:
                                            myinputborder(),
                                            focusedBorder:
                                            myfocusborder(),
                                          ),
                                          hint: const Text(
                                            'Stat',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(
                                                    0xFFBABABA)),
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          ),
                                          iconSize: 30,
                                          // buttonHeight: 80,
                                          //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                          dropdownDecoration:
                                          BoxDecoration(
                                            color: Colors.purple,
                                            borderRadius:
                                            BorderRadius
                                                .circular(15),
                                          ),
                                          items: benchList
                                              .map((item) =>
                                              DropdownMenuItem<
                                                  String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                      fontSize:
                                                      14,
                                                      color: Color(
                                                          0xFFBABABA)),
                                                ),
                                              ))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Stat';
                                            }
                                          },
                                          // onChanged: (value) {
                                          //   setState(() {
                                          //     print(
                                          //         'bench onchange $benchPress');
                                          //     benchPress =
                                          //         value.toString();
                                          //   });
                                          //   //Do something when changing the item if you want.
                                          // },
                                          // onSaved: (value) {
                                          //   setState(() {
                                          //     print(
                                          //         'bench val $benchPress');
                                          //     benchPress =
                                          //         value.toString();
                                          //   });
                                          // },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    flex: 1,
                                    child: TextField(
                                       // controller: benchCtr,
                                        style: TextStyle(
                                            color: Colors.white),
                                        keyboardType:
                                        TextInputType.number,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                          Color(0xFF111111),
                                          contentPadding:
                                          EdgeInsets.only(
                                              left: 16.0,
                                              right: 16,
                                              top: 0,
                                              bottom: 0),
                                          // contentPadding: EdgeInsets.only(left: 16),
                                          floatingLabelBehavior:
                                          FloatingLabelBehavior
                                              .never,
                                          // prefixIcon: Icon(Icons.lock),
                                          // labelText: "MM/DD/YYYY",
                                          //  labelText: "Reply To Post...",
                                          labelStyle: TextStyle(
                                              color:
                                              Color(0xFFBABABA),
                                              fontSize: 12),
                                          enabledBorder:
                                          myinputborder(),
                                          focusedBorder:
                                          myfocusborder(),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 54,
                                      alignment: Alignment.center,
                                      child: Form(
                                    //    key: _squatFormKey,
                                        child:
                                        DropdownButtonFormField2(
                                          buttonPadding:
                                          EdgeInsets.all(0.0),
                                          //  alignment: Alignment.center,
                                          //  buttonWidth: 50,
                                          decoration:
                                          InputDecoration(
                                            contentPadding:
                                            EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 0,
                                                bottom: 0),
                                            filled: true,
                                            fillColor:
                                            Color(0xFF111111),
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior
                                                .never,
                                            labelStyle: TextStyle(
                                                color: Color(
                                                    0xFFBABABA)),
                                            enabledBorder:
                                            myinputborder(),
                                            focusedBorder:
                                            myfocusborder(),
                                          ),
                                          hint: const Text(
                                            'Stat',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(
                                                    0xFFBABABA)),
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          ),
                                          iconSize: 30,
                                          // buttonHeight: 80,
                                          //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                          dropdownDecoration:
                                          BoxDecoration(
                                            color: Colors.purple,
                                            borderRadius:
                                            BorderRadius
                                                .circular(15),
                                          ),
                                          items: squatList
                                              .map((item) =>
                                              DropdownMenuItem<
                                                  String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                      fontSize:
                                                      14,
                                                      color: Color(
                                                          0xFFBABABA)),
                                                ),
                                              ))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Stat';
                                            }
                                          },
                                          // onChanged: (value) {
                                          //   setState(() {
                                          //     print(
                                          //         'bench onchange $squat');
                                          //     squat =
                                          //         value.toString();
                                          //   });
                                          //   //Do something when changing the item if you want.
                                          // },
                                          // onSaved: (value) {
                                          //   setState(() {
                                          //     print(
                                          //         'bench val $squat');
                                          //     squat =
                                          //         value.toString();
                                          //   });
                                       //   },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    flex: 1,
                                    child: TextField(
                                       // controller: squatCtr,
                                        style: TextStyle(
                                            color: Colors.white),
                                        keyboardType:
                                        TextInputType.number,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                          Color(0xFF111111),
                                          contentPadding:
                                          EdgeInsets.only(
                                              left: 16.0,
                                              right: 16,
                                              top: 0,
                                              bottom: 0),
                                          // contentPadding: EdgeInsets.only(left: 16),
                                          floatingLabelBehavior:
                                          FloatingLabelBehavior
                                              .never,
                                          // prefixIcon: Icon(Icons.lock),
                                          // labelText: "MM/DD/YYYY",
                                          //  labelText: "Reply To Post...",
                                          labelStyle: TextStyle(
                                              color:
                                              Color(0xFFBABABA),
                                              fontSize: 12),
                                          enabledBorder:
                                          myinputborder(),
                                          focusedBorder:
                                          myfocusborder(),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 54,
                                      alignment: Alignment.center,
                                      child: Form(
                                      //  key: _verticalFormKey,
                                        child:
                                        DropdownButtonFormField2(
                                          buttonPadding:
                                          EdgeInsets.all(0.0),
                                          //  alignment: Alignment.center,
                                          //  buttonWidth: 50,
                                          decoration:
                                          InputDecoration(
                                            contentPadding:
                                            EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 0,
                                                bottom: 0),
                                            filled: true,
                                            fillColor:
                                            Color(0xFF111111),
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior
                                                .never,
                                            labelStyle: TextStyle(
                                                color: Color(
                                                    0xFFBABABA)),
                                            enabledBorder:
                                            myinputborder(),
                                            focusedBorder:
                                            myfocusborder(),
                                          ),
                                          hint: const Text(
                                            'Stat',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(
                                                    0xFFBABABA)),
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          ),
                                          iconSize: 30,
                                          // buttonHeight: 80,
                                          //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                          dropdownDecoration:
                                          BoxDecoration(
                                            color: Colors.purple,
                                            borderRadius:
                                            BorderRadius
                                                .circular(15),
                                          ),
                                          items: verticalList
                                              .map((item) =>
                                              DropdownMenuItem<
                                                  String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                      fontSize:
                                                      14,
                                                      color: Color(
                                                          0xFFBABABA)),
                                                ),
                                              ))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Stat';
                                            }
                                          },
                                          // onChanged: (value) {
                                          //   setState(() {
                                          //     print(
                                          //         'vertical onchange $vertical');
                                          //     vertical =
                                          //         value.toString();
                                          //   });
                                          //   //Do something when changing the item if you want.
                                          // },
                                          // onSaved: (value) {
                                          //   setState(() {
                                          //     print(
                                          //         'vertical val $vertical');
                                          //     vertical =
                                          //         value.toString();
                                          //   });
                                       //   },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    flex: 1,
                                    child: TextField(
                                    //    controller: verticalCtr,
                                        style: TextStyle(
                                            color: Colors.white),
                                        keyboardType:
                                        TextInputType.number,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                          Color(0xFF111111),
                                          contentPadding:
                                          EdgeInsets.only(
                                              left: 16.0,
                                              right: 16,
                                              top: 0,
                                              bottom: 0),
                                          // contentPadding: EdgeInsets.only(left: 16),
                                          floatingLabelBehavior:
                                          FloatingLabelBehavior
                                              .never,
                                          // prefixIcon: Icon(Icons.lock),
                                          // labelText: "MM/DD/YYYY",
                                          //  labelText: "Reply To Post...",
                                          labelStyle: TextStyle(
                                              color:
                                              Color(0xFFBABABA),
                                              fontSize: 12),
                                          enabledBorder:
                                          myinputborder(),
                                          focusedBorder:
                                          myfocusborder(),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 54,
                                      alignment: Alignment.center,
                                      child: Form(
                                      //  key: _broadJumpFormKey,
                                        child:
                                        DropdownButtonFormField2(
                                          buttonPadding:
                                          EdgeInsets.all(0.0),
                                          //  alignment: Alignment.center,
                                          //  buttonWidth: 50,
                                          decoration:
                                          InputDecoration(
                                            contentPadding:
                                            EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 0,
                                                bottom: 0),
                                            filled: true,
                                            fillColor:
                                            Color(0xFF111111),
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior
                                                .never,
                                            labelStyle: TextStyle(
                                                color: Color(
                                                    0xFFBABABA)),
                                            enabledBorder:
                                            myinputborder(),
                                            focusedBorder:
                                            myfocusborder(),
                                          ),
                                          hint: const Text(
                                            'Stat',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(
                                                    0xFFBABABA)),
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          ),
                                          iconSize: 30,
                                          // buttonHeight: 80,
                                          //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                          dropdownDecoration:
                                          BoxDecoration(
                                            color: Colors.purple,
                                            borderRadius:
                                            BorderRadius
                                                .circular(15),
                                          ),
                                          items: broadList
                                              .map((item) =>
                                              DropdownMenuItem<
                                                  String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                      fontSize:
                                                      14,
                                                      color: Color(
                                                          0xFFBABABA)),
                                                ),
                                              ))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Stat';
                                            }
                                          },
                                          // onChanged: (value) {
                                          //   setState(() {
                                          //     print(
                                          //         'broad onchange $broadJump');
                                          //     broadJump =
                                          //         value.toString();
                                          //   });
                                          //   //Do something when changing the item if you want.
                                          // },
                                          // onSaved: (value) {
                                          //   setState(() {
                                          //     print(
                                          //         'broad val $broadJump');
                                          //     broadJump =
                                          //         value.toString();
                                          //   });
                                          // },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    flex: 1,
                                    child: TextField(
                                      //  controller: broadCtr,
                                        style: TextStyle(
                                            color: Colors.white),
                                        keyboardType:
                                        TextInputType.number,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                          Color(0xFF111111),
                                          contentPadding:
                                          EdgeInsets.only(
                                              left: 16.0,
                                              right: 16,
                                              top: 0,
                                              bottom: 0),
                                          // contentPadding: EdgeInsets.only(left: 16),
                                          floatingLabelBehavior:
                                          FloatingLabelBehavior
                                              .never,
                                          // prefixIcon: Icon(Icons.lock),
                                          // labelText: "MM/DD/YYYY",
                                          //  labelText: "Reply To Post...",
                                          labelStyle: TextStyle(
                                              color:
                                              Color(0xFFBABABA),
                                              fontSize: 12),
                                          enabledBorder:
                                          myinputborder(),
                                          focusedBorder:
                                          myfocusborder(),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 54,
                                      alignment: Alignment.center,
                                      child: Form(
                                      //  key: _powerCleanFormKey,
                                        child:
                                        DropdownButtonFormField2(
                                          buttonPadding:
                                          EdgeInsets.all(0.0),
                                          //  alignment: Alignment.center,
                                          //  buttonWidth: 50,
                                          decoration:
                                          InputDecoration(
                                            contentPadding:
                                            EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 0,
                                                bottom: 0),
                                            filled: true,
                                            fillColor:
                                            Color(0xFF111111),
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior
                                                .never,
                                            labelStyle: TextStyle(
                                                color: Color(
                                                    0xFFBABABA)),
                                            enabledBorder:
                                            myinputborder(),
                                            focusedBorder:
                                            myfocusborder(),
                                          ),
                                          hint: const Text(
                                            'Stat',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(
                                                    0xFFBABABA)),
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          ),
                                          iconSize: 30,
                                          // buttonHeight: 80,
                                          //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                          dropdownDecoration:
                                          BoxDecoration(
                                            color: Colors.purple,
                                            borderRadius:
                                            BorderRadius
                                                .circular(15),
                                          ),
                                          items: powerList
                                              .map((item) =>
                                              DropdownMenuItem<
                                                  String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                      fontSize:
                                                      14,
                                                      color: Color(
                                                          0xFFBABABA)),
                                                ),
                                              ))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Stat';
                                            }
                                          },
                                          // onChanged: (value) {
                                          //   setState(() {
                                          //     print(
                                          //         'power onchange $powerClean');
                                          //     powerClean =
                                          //         value.toString();
                                          //   });
                                          //   //Do something when changing the item if you want.
                                          // },
                                          // onSaved: (value) {
                                          //   setState(() {
                                          //     print(
                                          //         'bench val $powerClean');
                                          //     powerClean =
                                          //         value.toString();
                                          //   });
                                       //   },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    flex: 1,
                                    child: TextField(
                                      //  controller: powerCtr,
                                        style: TextStyle(
                                            color: Colors.white),
                                        keyboardType:
                                        TextInputType.number,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                          Color(0xFF111111),
                                          contentPadding:
                                          EdgeInsets.only(
                                              left: 16.0,
                                              right: 16,
                                              top: 0,
                                              bottom: 0),
                                          // contentPadding: EdgeInsets.only(left: 16),
                                          floatingLabelBehavior:
                                          FloatingLabelBehavior
                                              .never,
                                          // prefixIcon: Icon(Icons.lock),
                                          // labelText: "MM/DD/YYYY",
                                          //  labelText: "Reply To Post...",
                                          labelStyle: TextStyle(
                                              color:
                                              Color(0xFFBABABA),
                                              fontSize: 12),
                                          enabledBorder:
                                          myinputborder(),
                                          focusedBorder:
                                          myfocusborder(),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 54,
                                      alignment: Alignment.center,
                                      child: Form(
                                        key: _deadLiftFormKey,
                                        child:
                                        DropdownButtonFormField2(
                                          buttonPadding:
                                          EdgeInsets.all(0.0),
                                          //  alignment: Alignment.center,
                                          //  buttonWidth: 50,
                                          decoration:
                                          InputDecoration(
                                            contentPadding:
                                            EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 0,
                                                bottom: 0),
                                            filled: true,
                                            fillColor:
                                            Color(0xFF111111),
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior
                                                .never,
                                            labelStyle: TextStyle(
                                                color: Color(
                                                    0xFFBABABA)),
                                            enabledBorder:
                                            myinputborder(),
                                            focusedBorder:
                                            myfocusborder(),
                                          ),
                                          hint: const Text(
                                            'Stat',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(
                                                    0xFFBABABA)),
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          ),
                                          iconSize: 30,
                                          // buttonHeight: 80,
                                          //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                          dropdownDecoration:
                                          BoxDecoration(
                                            color: Colors.purple,
                                            borderRadius:
                                            BorderRadius
                                                .circular(15),
                                          ),
                                          items: deadList
                                              .map((item) =>
                                              DropdownMenuItem<
                                                  String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                      fontSize:
                                                      14,
                                                      color: Color(
                                                          0xFFBABABA)),
                                                ),
                                              ))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Stat';
                                            }
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              print(
                                                  'dead onchange $deadLift');
                                              deadLift =
                                                  value.toString();
                                            });
                                            //Do something when changing the item if you want.
                                          },
                                          onSaved: (value) {
                                            setState(() {
                                              print(
                                                  'dead val $deadLift');
                                              deadLift =
                                                  value.toString();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    flex: 1,
                                    child: TextField(
                                      //  controller: deadCtr,
                                        style: TextStyle(
                                            color: Colors.white),
                                        keyboardType:
                                        TextInputType.number,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                          Color(0xFF111111),
                                          contentPadding:
                                          EdgeInsets.only(
                                              left: 16.0,
                                              right: 16,
                                              top: 0,
                                              bottom: 0),
                                          // contentPadding: EdgeInsets.only(left: 16),
                                          floatingLabelBehavior:
                                          FloatingLabelBehavior
                                              .never,
                                          // prefixIcon: Icon(Icons.lock),
                                          // labelText: "MM/DD/YYYY",
                                          //  labelText: "Reply To Post...",
                                          labelStyle: TextStyle(
                                              color:
                                              Color(0xFFBABABA),
                                              fontSize: 12),
                                          enabledBorder:
                                          myinputborder(),
                                          focusedBorder:
                                          myfocusborder(),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 44,
                      // margin: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: ElevatedButton(
                        child: Text(
                          'Add New Stat',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        onPressed: () {
                          print('New State');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFBABABA),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Badges',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                           //   leader = !leader;
                            });
                          },
                          child: Expanded(
                            child: Container(
                              height: _height * 0.14,
                              width: _width * 0.28,
                              // color: Colors.blue,
                              decoration: BoxDecoration(
                                //  color: leader ? Color(0xFF10E9A1) : null,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(color: Color(0xFF10E9A1))),
                              child: Column(
                                children: [
                                  // leader
                                  //     ? Image.asset('assets/leader.png',
                                  //     color: Colors.white,
                                  //     fit: BoxFit.fill,
                                  //     width: 75,
                                  //     height: 75)
                                  //     :
                                  Image.asset('assets/leader.png',
                                      fit: BoxFit.fill, width: 75, height: 75),
                                  Text(
                                    'Leader',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            setState(() {
                             // tactical = !tactical;
                            });
                          },
                          child: Expanded(
                            child: Container(
                              height: _height * 0.14,
                              width: _width * 0.28,
                              // color: Colors.blue,
                              decoration: BoxDecoration(
                                 // color: tactical ? Color(0xFF10E9A1) : null,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(color: Color(0xFF10E9A1))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // !tactical
                                  //     ? 
                                      Image.asset(
                                    'assets/tactical.png',
                                    fit: BoxFit.cover,
                                    height: 85,
                                    width: 85,
                                  ),
                                  //     :
                                  // Image.asset('assets/tactical.png',
                                  //     fit: BoxFit.cover,
                                  //     height: 85,
                                  //     width: 85,
                                  //     color: Colors.white),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'Tactical',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            setState(() {
                           //   sprinter = !sprinter;
                            });
                          },
                          child: Expanded(
                            child: Container(
                              height: _height * 0.14,
                              width: _width * 0.28,
                              // color: Colors.blue,
                              decoration: BoxDecoration(
                               //   color: sprinter ? Color(0xFF10e9A1) : null,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(color: Color(0xFF10E9A1))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // !sprinter
                                  //     ? 
                                      Image.asset('assets/sprinter.png',
                                      fit: BoxFit.cover),
                                  //     :
                                  // Image.asset('assets/sprinter.png',
                                  //     fit: BoxFit.cover, color: Colors.white),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'Sprinter',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 26),
                    InkWell(
                        onTap: () {
                          setState(() {
                         //   _editPerformance = !_editPerformance;
                          });
                        },
                        child: Container(
                          height: 44,
                          width: _width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              border: Border.all(
                                  color: Color(0xFFF61F1F),
                                  width: 1.5)),
                          child: Text('Cancel',
                              style: TextStyle(
                                  color: Color(0xFFF61F1F),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0)),
                        )),
                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      height: 44,
                      // margin: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: ElevatedButton(
                        child: Text(
                          'Add New Game',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        onPressed: () {
                          if (title.text == "") {
                            print('please enter text');
                          } else {
                            //  _onSubmit();
                            setState(() {
                              _addNewGame = !_addNewGame;
                              _list.insert(
                                  0,
                                  StatsModel(
                                      date: date.text,
                                      team:
                                          '${selectedHomeTeam} Vs ${selectedAwayTeam}',
                                      color: int.parse(homeScoreCtr.text) >
                                              int.parse(awayScoreCtr.text)
                                          ? Color(0xFF239B36)
                                          : Color(0xFFF61F1F),
                                      location: location.text,
                                      ratio: rating.text,
                                      rating: 'Rating',
                                      status: int.parse(homeScoreCtr.text) >
                                              int.parse(awayScoreCtr.text)
                                          ? '${'W'}${homeScoreCtr.text} -${awayScoreCtr.text}'
                                          : '${'L'}${homeScoreCtr.text} -${awayScoreCtr.text}',
                                      dlt: Icons.more_horiz,
                                      image: imageFile));
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFBABABA),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
