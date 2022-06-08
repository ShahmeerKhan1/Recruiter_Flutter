
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

import '../../widgets/athlete_post_class.dart';
import '../../widgets/athlete_stats_class.dart';
import 'sap_33.dart';

class SAP_31 extends StatefulWidget {
  const SAP_31({Key? key}) : super(key: key);

  @override
  _SAP_31State createState() => _SAP_31State();
}

class _SAP_31State extends State<SAP_31> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  bool _editProfile = false;

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
      appBar: ctpAppBar('Athelete Profile', Icons.notifications, context),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => SAP_33()));
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