import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_custom_drawer.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_23.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_24.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_post_tab.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_drawer.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP_22 extends StatefulWidget {
  const CCP_22({Key? key}) : super(key: key);

  @override
  _CCP_22State createState() => _CCP_22State();
}

class _CCP_22State extends State<CCP_22> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  static const String routeName = '/profile';

  List<Widget> list = [
    Tab(text: 'Posts'),
    
    Tab(
      text: 'Scouting',
    )
  ];

  bool editProfile = false;

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
  String? selectSport = 'Football';
  String? selectPosition = 'Running Back';
  String? selectYear = '2 Years';

  final List<String> schoolList = ['Bufford High School', 'Ohio State Buckeye', 'Hardward University'];
  final List<String> sportList = ['Baseball', 'Football', 'Basketball', 'Volleyball'];
  final List<String> positionList = ['Head Coach', 'Running Back', 'Instructor'];
  final List<String> yearlList = ['4 Years', '1 Years', '2 Years'];

  final _selectSchoolFormKey = GlobalKey<FormState>();
  final _selectSportFormKey = GlobalKey<FormState>();
  final _selectPositionFormKey = GlobalKey<FormState>();
  final _selectYearFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
        bottom: PreferredSize(
            child: Container(
              color: Color(0xFF474747),
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      drawer: ccp_drawer(context),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            // The containers in the background
            Column(
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height * .25,
                   //  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 26.0),
                    child: Image.asset(
                      'assets/profile_cover.png',
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 20.0),
                  child: new Container(
                    height: 30,
                    alignment: Alignment.topLeft,
                    //   width: MediaQuery.of(context).size.width,
                    //   color: Colors.pink,
                    child: Container(
                      height: 22,
                      width: 60,
                      alignment: Alignment.center,
                      child: Text('Coach', style: TextStyle(color: Color(0xFFE0B216), fontWeight: FontWeight.w500)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(
                          color: Color(0xFFE0B216),
                        ),
                      )
                    )
                  ),
                )
              ],
            ),
            // The card widget with top padding,
            // incase if you wanted bottom padding to work,
            // set the `alignment` of container to Alignment.bottomCenter
            Column(
              children: [
                new Container(
                  alignment: Alignment.topCenter,
                  padding: new EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.16,
                      right: 20.0,
                      left: 20.0),
                  child: new Container(
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
                              padding:
                              const EdgeInsets.only(left: 8.0, top: 12),
                              child: Row(
                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    // mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Martin Mangram',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500)),
                                          SizedBox(width: 10),
                                          editProfile
                                              ? Image.asset('assets/edit.png')
                                              : Container()
                                          //  Icon(Icons.edit, color: Colors.white, size: 18)
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      editProfile
                                          ? Container(
                                        height: 30,
                                        width: 150,
                                        alignment: Alignment.center,
                                        child: Form(
                                          key: _selectSchoolFormKey,
                                          child: DropdownButtonFormField2(
                                            buttonPadding:
                                            EdgeInsets.all(0.0),
                                            //  alignment: Alignment.center,
                                            //  buttonWidth: 50,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(left: 10.0),
                                              isDense: true,
                                              filled: true,
                                              fillColor:
                                              Color(0xFF111111),
                                              floatingLabelBehavior:
                                              FloatingLabelBehavior
                                                  .never,
                                              labelStyle: TextStyle(
                                                  color:
                                                  Color(0xFFBABABA)),
                                              enabledBorder:
                                              myinputborder(),
                                              focusedBorder:
                                              myfocusborder(),
                                            ),
                                            hint: const Text(
                                              'Select School',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color:
                                                  Color(0xFFBABABA)),
                                            ),
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey,
                                            ),
                                            iconSize: 30,
                                            buttonHeight: 80,
                                            dropdownDecoration:
                                            BoxDecoration(
                                              color: Color(0xFF111111),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                            ),
                                            items: schoolList
                                                .map((item) =>
                                                DropdownMenuItem<
                                                    String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white),
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
                                                selectSchool =
                                                    value.toString();
                                                print(
                                                    'home onchange $selectSchool');
                                              });
                                              //Do something when changing the item if you want.
                                            },
                                            onSaved: (value) {
                                              setState(() {
                                                selectSchool =
                                                    value.toString();
                                                print(
                                                    'home val $selectSchool');
                                              });
                                            },
                                          ),
                                        ),
                                      )
                                          : Text(selectSchool.toString(),
                                          style: TextStyle(
                                              color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                                      SizedBox(height: 6),
                                      !editProfile
                                          ? Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_24()));
                                            },
                                            child: Row(
                                              children: [
                                                Text('800',
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color:
                                                        Colors.white)),
                                                SizedBox(width: 4),
                                                Text(
                                                  'Followers',
                                                  style: TextStyle(
                                                      color:
                                                      Color(0xFF686868),
                                                      fontSize: 12.0),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 16),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_24()));
                                            },
                                            child: Row(
                                              children: [
                                                Text('600',
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color:
                                                        Colors.white)),
                                                SizedBox(width: 4),
                                                Text('Following',
                                                    style: TextStyle(
                                                        color: Color(
                                                            0xFF686868),
                                                        fontSize: 12.0)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                          : Container()
                                    ],
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      print('edit');
                                      setState(() {
                                        editProfile = !editProfile;

                                      });
                                    },
                                    child: editProfile
                                        ? Container(
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
                                    )
                                        : Container(
                                      height: 30,
                                      width: 78,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                              color: Color(0xFF686868),
                                              width: 1.5)),
                                      child: Text('Edit Profile',
                                          style: TextStyle(
                                              color: Color(0xFF686868),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.0)),
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
                  height: MediaQuery.of(context).size.height * 0.20,
                  padding: EdgeInsets.only(left: 12, right: 12.0, top: 16.0),
                  margin: EdgeInsets.only(left: 18.0, right: 16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF111111),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      Text(
                          'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore.',
                          style:
                          TextStyle(color: Colors.white, fontSize: 12.0)),
                      SizedBox(height: 16),
                      Row(
                        //  crossAxisAlignment: CrossAxisAlignment.start,
                        //  mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sport:',
                                style: TextStyle(
                                    color: Color(0xFF686868),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Position:',
                                style: TextStyle(
                                    color: Color(0xFF686868),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Elegibility:',
                                style: TextStyle(
                                    color: Color(0xFF686868),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              editProfile ? Container(
                                height: 26,
                                width: 125,
                                alignment: Alignment.center,
                                child: Form(
                                  key: _selectSportFormKey,
                                  child: DropdownButtonFormField2(
                                    buttonPadding:
                                    EdgeInsets.all(0.0),
                                    //  alignment: Alignment.center,
                                    //  buttonWidth: 50,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10.0),
                                      isDense: true,
                                      filled: true,
                                      fillColor:
                                      Color(0xFF111111),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior
                                          .never,
                                      labelStyle: TextStyle(
                                          color:
                                          Color(0xFFBABABA)),
                                      enabledBorder:
                                      myinputborder(),
                                      focusedBorder:
                                      myfocusborder(),
                                    ),
                                    hint: const Text(
                                      'Select Sport',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                          Color(0xFFBABABA)),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                    iconSize: 26,
                                    buttonHeight: 30,
                                    dropdownDecoration:
                                    BoxDecoration(
                                      color: Color(0xFF111111),
                                      borderRadius:
                                      BorderRadius.circular(
                                          10),
                                    ),
                                    items: sportList
                                        .map((item) =>
                                        DropdownMenuItem<
                                            String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Select Sport';
                                      }
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        selectSport =
                                            value.toString();
                                        print(
                                            'sport onchange $selectSport');
                                      });
                                      //Do something when changing the item if you want.
                                    },
                                    onSaved: (value) {
                                      setState(() {
                                        selectSport =
                                            value.toString();
                                        print(
                                            'sport onsaved $selectSport');
                                      });
                                    },
                                  ),
                                ),
                              ) : Text(selectSport.toString(),
                                  style: TextStyle(color: Colors.white)),
                              editProfile ? Container() : SizedBox(height: 10),
                              editProfile ? Container(
                                height: 26,
                                width: 125,
                                alignment: Alignment.center,
                                child: Form(
                                  key: _selectPositionFormKey,
                                  child: DropdownButtonFormField2(
                                    buttonPadding:
                                    EdgeInsets.all(0.0),
                                    //  alignment: Alignment.center,
                                    //  buttonWidth: 50,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10.0),
                                      isDense: true,
                                      filled: true,
                                      fillColor:
                                      Color(0xFF111111),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior
                                          .never,
                                      labelStyle: TextStyle(
                                          color:
                                          Color(0xFFBABABA)),
                                      enabledBorder:
                                      myinputborder(),
                                      focusedBorder:
                                      myfocusborder(),
                                    ),
                                    hint: const Text(
                                      'Select Position',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                          Color(0xFFBABABA)),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                    iconSize: 26,
                                    buttonHeight: 30,
                                    dropdownDecoration:
                                    BoxDecoration(
                                      color: Color(0xFF111111),
                                      borderRadius:
                                      BorderRadius.circular(
                                          10),
                                    ),
                                    items: positionList
                                        .map((item) =>
                                        DropdownMenuItem<
                                            String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
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
                              ) : Text(selectPosition.toString(),
                                  style: TextStyle(color: Colors.white)),
                              editProfile ? Container() : SizedBox(height: 10),
                              editProfile ? Container(
                                height: 26,
                                width: 125,
                                alignment: Alignment.center,
                                child: Form(
                                  key: _selectYearFormKey,
                                  child: DropdownButtonFormField2(
                                    buttonPadding:
                                    EdgeInsets.all(0.0),
                                    //  alignment: Alignment.center,
                                    //  buttonWidth: 50,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10.0),
                                      isDense: true,
                                      filled: true,
                                      fillColor:
                                      Color(0xFF111111),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior
                                          .never,
                                      labelStyle: TextStyle(
                                          color:
                                          Color(0xFFBABABA)),
                                      enabledBorder:
                                      myinputborder(),
                                      focusedBorder:
                                      myfocusborder(),
                                    ),
                                    hint: const Text(
                                      'Select Year',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                          Color(0xFFBABABA)),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                    iconSize: 26,
                                    buttonHeight: 30,
                                    dropdownDecoration:
                                    BoxDecoration(
                                      color: Color(0xFF111111),
                                      borderRadius:
                                      BorderRadius.circular(
                                          10),
                                    ),
                                    items: yearlList
                                        .map((item) =>
                                        DropdownMenuItem<
                                            String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Select Year';
                                      }
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        selectYear =
                                            value.toString();
                                        print(
                                            'year onchange $selectYear');
                                      });
                                      //Do something when changing the item if you want.
                                    },
                                    onSaved: (value) {
                                      setState(() {
                                        selectYear =
                                            value.toString();
                                        print(
                                            'year onsaved $selectYear');
                                      });
                                    },
                                  ),
                                ),
                              ) : Text(selectYear.toString(),
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              print('coaching');
                              Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_23(school: selectSchool.toString())));
                            },
                            child: Container(
                              height: 74,
                              width: 84,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/bar_chart.png'),
                                  SizedBox(height: 4),
                                  Text('Coaching',
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              decoration: BoxDecoration(
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
                  height: 500,
                  width: double.maxFinite,
                  //  color: Colors.blue,
                  child: TabBarView(
                    controller: _controller,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      CCP_Posts_Tab(), // custom Post Widget
                      Scouting(),
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
  }
}

class Scouting extends StatelessWidget {
  const Scouting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xFF111111),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          // width: MediaQuery.of(context).size.width,
                          //  height: 100,
                          width: 125,
                          child: Image.asset('assets/events_img2.png',
                              fit: BoxFit.cover)),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ohio State University',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0),
                          ),
                          SizedBox(height: 4),
                          Text('Coach John Doe',
                              style: TextStyle(
                                  color: AppColor.yellowColor,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(height: 4),
                          Text('8/8/2020',
                              style:
                              TextStyle(color: AppColor.textGreyColor)),
                          Spacer(),
                          Text(
                            'Full',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Scholarship',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.more_horiz, color: AppColor.textGreyColor)
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}