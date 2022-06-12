
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/controller/controller.dart';
import 'package:recruiter_flutter/controller/game_controller.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/scp_23_3.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_post_widget.dart';
import 'package:recruiter_flutter/widgets/drawer_widget.dart';

import 'scp23_5.dart';

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
        // backgroundColor: Colors.white,
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
        drawer: drawerWidget(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.orange,
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Stack(
                    //  overflow: Overflow.visible,
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Center(
                              child: Image.asset('assets/profile_cover.png')),
                        ),
                        Positioned(
                          bottom: -40.0,
                          //  left: 26.0,
                          //  right: 16.0,
                          child: Container(
                            // color: Colors.pink,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(left: 26.0, right: 20.0),
                            // height: 70,
                            //   alignment: Alignment.centerLeft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/drawer_img.png'),
                                  radius: 36,
                                ),
                                const SizedBox(width: 8.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text('John Doe',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500)),
                                    Text('Bufford High School',
                                        style: TextStyle(
                                            color: Color(0xFF686868))),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  height: 32,
                                  width: 84,
                                  // color: Colors.blue,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                        color: const Color(0xFF686868), width: 2.0),
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: const Text(
                                    'Edit Profile',
                                    style: TextStyle(color: Color(0xFF686868)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 26.0, right: 26.0),
                    // color: Colors.yellow,
                    child: Row(
                      children: [
                        Container(
                          height: 26,
                          width: 66,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                                color: AppColor.goldenColor, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Text('Coach',
                              style: TextStyle(
                                  color: AppColor.goldenColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(width: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('800',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white)),
                            SizedBox(width: 2),
                            Text(
                              'Followers',
                              style: TextStyle(color: Color(0xFF686868)),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('600',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white)),
                            SizedBox(width: 2),
                            Text('Following',
                                style: TextStyle(color: Color(0xFF686868))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    padding: const EdgeInsets.only(left: 16, right: 16.0, top: 16.0),
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => SCP23_5()));
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/prospects.png'),
                                    const SizedBox(height: 2),
                                    const Text('Prospects',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                                decoration: const BoxDecoration(
                                    color: Color(0xFF0E1E3D),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.0))),
                              ),
                            )
                          ],
                        ),
                      ],
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
                  SizedBox(
                    height: 250,
                    width: double.maxFinite,
                    //  color: Colors.blue,
                    child: TabBarView(
                      controller: _controller,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        postsTab(), // custom Post Widget
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
              ),
            ],
          ),
        ));
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
