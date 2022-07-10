
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/controller/controller.dart';
import 'package:recruiter_flutter/controller/game_controller.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/scp_23_3.dart';
import 'package:recruiter_flutter/school_coach_profile/widget/scp_posts_tab.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/school_coach_profile/widget/scp_drawer.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

import 'SCP21_1.dart';
import 'scp23_5.dart';
import 'scp24_1.dart';
import 'scp42_1.dart';

class Profile extends StatefulWidget {
//  final File? f;

  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  static const String routeName = '/profile';

  List<Widget> list = [
    const Tab(text: 'Posts'),
    const Tab(
      text: 'Contacts',
    ),
    const Tab(
      text: 'Schedule',
    ),
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

  bool _notification = false;

  String name = 'Martin Mangram';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
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
                  height: MediaQuery.of(context).size.height * .24,
                  //   color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 26.0),
                    child: Image.asset(
                      'assets/profile_cover.png',
                    ),
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
                      top: MediaQuery.of(context).size.height * 0.15,
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
                          InkWell(
                            onTap: () {
                              print('onPressed');
                              Navigator.push(context, MaterialPageRoute(builder: (_) => SCP21_1(name: name, at: '@mgram')));

                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                              child: Image.asset('assets/drawer_img.png'),
                            ),
                          ),
                          //SizedBox(height: 20),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: 8.0, top: MediaQuery.of(context).size.height * 0.022),
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
                                          const Text('Martin Mangram',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500)),
                                          const SizedBox(width: 10),
                                          editProfile
                                              ? Image.asset('assets/edit.png')
                                              : Container()
                                          //  Icon(Icons.edit, color: Colors.white, size: 18)
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      editProfile
                                          ? Container(
                                        height: 30,
                                        width: 150,
                                        alignment: Alignment.center,
                                        child: Form(
                                          key: _selectSchoolFormKey,
                                          child: DropdownButtonFormField2(
                                            buttonPadding:
                                            const EdgeInsets.all(0.0),
                                            //  alignment: Alignment.center,
                                            //  buttonWidth: 50,
                                            decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.only(left: 10.0),
                                              isDense: true,
                                              filled: true,
                                              fillColor:
                                              const Color(0xFF111111),
                                              floatingLabelBehavior:
                                              FloatingLabelBehavior
                                                  .never,
                                              labelStyle: const TextStyle(
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
                                              color: const Color(0xFF111111),
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
                                              return null;
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
                                          style: const TextStyle(
                                              color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 6),
                                      !editProfile
                                          ? Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (_) => const SCP24_1()));
                                            },
                                            child: Row(
                                              children: const [
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
                                          const SizedBox(width: 16),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (_) => const SCP24_1()));
                                            },
                                            child: Row(
                                              children: const [
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
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      print('edit');
                                      setState(() {
                                        editProfile = !editProfile;

                                      });
                                    },
                                    child: editProfile
                                        ? Padding(
                                          padding: const EdgeInsets.only(right: 6.0),
                                          child: Container(
                                      height: 30,
                                      width: 78,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                color: const Color(0xFF1F6DE2),
                                                width: 1.5)),
                                      child: const Text('Save',
                                            style: TextStyle(
                                                color: Color(0xFF1F6DE2),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0)),
                                    ),
                                        )
                                        : Padding(
                                          padding: const EdgeInsets.only(right: 6.0),
                                          child: Container(
                                      height: 30,
                                      width: 78,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                color: const Color(0xFF686868),
                                                width: 1.5)),
                                      child: const Text('Edit Profile',
                                            style: TextStyle(
                                                color: Color(0xFF686868),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0)),
                                    ),
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
                  padding: const EdgeInsets.only(left: 12, right: 12.0, top: 16.0),
                  margin: const EdgeInsets.only(left: 22.0, right: 22.0),
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
                          const SizedBox(width: 10),
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
                                    const EdgeInsets.all(0.0),
                                    //  alignment: Alignment.center,
                                    //  buttonWidth: 50,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(left: 10.0),
                                      isDense: true,
                                      filled: true,
                                      fillColor:
                                      const Color(0xFF111111),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior
                                          .never,
                                      labelStyle: const TextStyle(
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
                                      color: const Color(0xFF111111),
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
                                      return null;
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
                                  style: const TextStyle(color: Colors.white)),
                              editProfile ? Container() : const SizedBox(height: 10),
                              editProfile ? Container(
                                height: 26,
                                width: 125,
                                alignment: Alignment.center,
                                child: Form(
                                  key: _selectPositionFormKey,
                                  child: DropdownButtonFormField2(
                                    buttonPadding:
                                    const EdgeInsets.all(0.0),
                                    //  alignment: Alignment.center,
                                    //  buttonWidth: 50,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(left: 10.0),
                                      isDense: true,
                                      filled: true,
                                      fillColor:
                                      const Color(0xFF111111),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior
                                          .never,
                                      labelStyle: const TextStyle(
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
                                      color: const Color(0xFF111111),
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
                                      return null;
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
                                  style: const TextStyle(color: Colors.white)),
                              editProfile ? Container() : const SizedBox(height: 10),
                              editProfile ? Container(
                                height: 26,
                                width: 125,
                                alignment: Alignment.center,
                                child: Form(
                                  key: _selectYearFormKey,
                                  child: DropdownButtonFormField2(
                                    buttonPadding:
                                    const EdgeInsets.all(0.0),
                                    //  alignment: Alignment.center,
                                    //  buttonWidth: 50,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(left: 10.0),
                                      isDense: true,
                                      filled: true,
                                      fillColor:
                                      const Color(0xFF111111),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior
                                          .never,
                                      labelStyle: const TextStyle(
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
                                      color: const Color(0xFF111111),
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
                                      return null;
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
                                  style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              print('tapped');
                           //   Navigator.push(context, MaterialPageRoute(builder: (_) => const CTP31()));
                            },
                            child: Container(
                              height: 74,
                              width: 84,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/prospects.png'),
                                  const SizedBox(height: 4),
                                  const Text('Prospects',
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
                   // isScrollable: true,
                    labelStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
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
                  height: 500,
                  width: double.maxFinite,
                  //  color: Colors.blue,
                  child: TabBarView(
                    controller: _controller,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                     // scpPostsTab(), // custom Post Widget
                      SCPPostTab(),
                      const ProfileContacts(),
                      const ProfileSchedule(),
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

class ProfileContacts extends StatelessWidget {
  const ProfileContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      // color: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.only(left: 26.0, right: 26.0, top: 26.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('School:',
                    style: TextStyle(
                        color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                SizedBox(height: 12),
                Text('Position:',
                    style: TextStyle(
                        color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                SizedBox(height: 12),
                Text('Address:',
                    style: TextStyle(
                        color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                SizedBox(height: 28),
                Text('Work Phone 1:',
                    style: TextStyle(
                        color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                SizedBox(height: 12),
                Text('Work Phone 2:',
                    style: TextStyle(
                        color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                SizedBox(height: 12),
                Text('Email Address:',
                    style: TextStyle(
                        color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                SizedBox(height: 12),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('School Name', style: TextStyle(color: Colors.white)),
                SizedBox(height: 12),
                Text('Head Coach (2 Yrs)',
                    style: TextStyle(color: Colors.white)),
                SizedBox(height: 12),
                Text('123 Street,\nCity, State 00000',
                    style: TextStyle(color: Colors.white)),
                SizedBox(height: 12),
                Text('(123) 456 7890', style: TextStyle(color: Colors.white)),
                SizedBox(height: 12),
                Text('(123) 456 7890', style: TextStyle(color: Colors.white)),
                SizedBox(height: 12),
                Text('John.Doe@School.Edu',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSchedule extends StatefulWidget {
 // Profile profile;

  const ProfileSchedule({Key? key}) : super(key: key);

  @override
  State<ProfileSchedule> createState() => _ProfileScheduleState();
}

class _ProfileScheduleState extends State<ProfileSchedule> {
  final GameController gm = Get.put(GameController());
  final Controller controller = Get.put(Controller());

  Controller findController = Get.find();

  final GameController cont = Get.find();

 // List<String> cont = [];
 //
 //  final List<String> listCont = <String>[];
 //
 //    listCont.add(controller.textController.text);
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          findController.textController.text != ""
              ? const Visibility(
                  visible: false,
                  child: Text(
                    "No Schedule Inputted\nAdd Your\nTeam's Schedule",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFFBABABA), fontSize: 24.0),
                  ),
                )
              : const Text(
                  "No Schedule Inputted\nAdd Your\nTeam's Schedule",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFBABABA), fontSize: 24.0),
                ),
          findController.textController.text != "" ? Expanded(
            child: GetBuilder<GameController>(
              builder: (_con) {
                return ListView.builder(
                    itemCount: _con.gameList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 16),
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFF111111),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        child: Row(
                          children: [
                            _con.gameList[index].image != null
                                ? Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                              ),
                              child: Image.file(_con.gameList[index].image!,
                                  width: 70, height: 70, fit: BoxFit.fill),
                            )
                                : Container(color: Colors.blue),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _con.gameList[index].title,
                                    style: const TextStyle(color: Color(0xFFFFEE00)),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                      '${_con.gameList[index].homeTeam} VS ${_con.gameList[index].awayTeam}',
                                      style: const TextStyle(color: Colors.white)
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    _con.gameList[index].location,
                                    style: const TextStyle(color: Color(0xFF686868)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
    }
            ),
          ) : Container(),
          // Expanded(
          //   child:
          //       ListView.builder(
          //           itemBuilder: (BuildContext context, index) {
          //         return Container(
          //             height: 40,
          //             width: MediaQuery.of(context).size.width,
          //             color: Colors.blue,
          //          child: null,
          //          //   child: Obx(() => Image.file(controller.)
          //         );
          //       })
          // ),
          // Text(
          //   'Title ${controller.controllerText.value}',
          //   style: TextStyle(color: Colors.white),
          // )),
          const SizedBox(height: 26),
          Container(
            width: double.infinity,
            height: 44,
            margin: const EdgeInsets.only(left: 26.0, right: 26.0),
            child: ElevatedButton(
              child: const Text(
                'Add New Game',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const SCP23_3()));
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFBABABA),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailProfile extends StatelessWidget {
  const DetailProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(),
    );
  }
}
