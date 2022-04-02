import 'package:flutter/material.dart';
import 'package:recruiter_flutter/school_coach_profile/model/followers_model.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/textfield_input_border.dart';
import 'package:recruiter_flutter/util/colors.dart';

class SCP24_1 extends StatefulWidget {
  const SCP24_1({Key? key}) : super(key: key);

  @override
  _SCP24_1State createState() => _SCP24_1State();
}

class _SCP24_1State extends State<SCP24_1> with SingleTickerProviderStateMixin {
  late TabController _controller;

  int _selectedIndex = 0; //  Tab Bar Index

  List<Widget> list = [
    Tab(text: 'Followers'),
    Tab(
      text: 'Following',
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
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Martin Mangram', style: TextStyle(color: Colors.white)),
          centerTitle: true,
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
          Followers(),
          Following(),
        ],
      ),
    );
  }
}

class Followers extends StatefulWidget {
  Followers({Key? key}) : super(key: key);

  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  TextEditingController search = TextEditingController();

  List<FollowersModel> _list = [
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
  ];

  bool onSelected = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                      controller: search,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16.0),
                        filled: true,
                        fillColor: Color(0xFF111111),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Search for people",
                        labelStyle: TextStyle(color: Color(0xFF686868)),
                        suffixIcon:
                            Icon(Icons.search, color: Color(0xFF686868)),
                        //  prefixIcon: Icon(Icons.people),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: TextField(
                      controller: search,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16.0),
                        filled: true,
                        fillColor: Color(0xFF111111),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Filter",
                        labelStyle: TextStyle(color: Color(0xFF686868)),
                        suffixIcon:
                            Icon(Icons.art_track, color: Color(0xFF686868)),
                        //  prefixIcon: Icon(Icons.people),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 8.0, left: 8.0, right: 8.0, top: 4.0),
            child: ListView.builder(
                itemCount: _list.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.only(bottom: 8.0),
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      print('click');
                      //   if(_list.any((element) => element.isSelected)){
                      setState(() {
                        _list[index].isSelected = !_list[index].isSelected;
                      });
                      //   }
                    },
                    // onLongPress: () {
                    //   setState(() {
                    //     _list[index].isSelected = true;
                    //   });
                    // },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.11,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                      margin: EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF111111),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage(_list[index].profileImg),
                            radius: 24,
                          ),
                          SizedBox(width: 12),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(_list[index].name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(width: 16),
                                  Container(
                                    height: 26,
                                    width: 66,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(
                                          color: AppColor.goldenColor,
                                          width: 2.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                    ),
                                    child: Text(_list[index].type,
                                        style: TextStyle(
                                            color: AppColor.goldenColor,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 6),
                              Text(_list[index].at,
                                  style: TextStyle(
                                      color: Color(0xFF686868),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0))
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              _list[index].isSelected
                                  ? Container(
                                      height: 30,
                                      width: 68,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFBABABA),
                                        border: Border.all(
                                            color: Color(0xFF474747),
                                            width: 2.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                      ),
                                      child: Text('Following',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500)),
                                    )
                                  : Container(
                                      height: 30,
                                      width: 70,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(
                                            color: Color(0xFF474747),
                                            width: 2.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                      ),
                                      child: Text(_list[index].follow,
                                          style: TextStyle(
                                              color: Color(0xFF474747),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500)),
                                    ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class Following extends StatefulWidget {
  const Following({Key? key}) : super(key: key);

  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> {

  TextEditingController search = TextEditingController();

  List<FollowersModel> _list = [
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
    FollowersModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      at: '@jdoe',
      follow: 'Follow',
      isSelected: false,
    ),
  ];

  bool onSelected = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                      controller: search,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16.0),
                        filled: true,
                        fillColor: Color(0xFF111111),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Search for people",
                        labelStyle: TextStyle(color: Color(0xFF686868)),
                        suffixIcon:
                        Icon(Icons.search, color: Color(0xFF686868)),
                        //  prefixIcon: Icon(Icons.people),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: TextField(
                      controller: search,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16.0),
                        filled: true,
                        fillColor: Color(0xFF111111),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Filter",
                        labelStyle: TextStyle(color: Color(0xFF686868)),
                        suffixIcon:
                        Icon(Icons.art_track, color: Color(0xFF686868)),
                        //  prefixIcon: Icon(Icons.people),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 8.0, left: 8.0, right: 8.0, top: 4.0),
            child: ListView.builder(
                itemCount: _list.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.only(bottom: 8.0),
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                    margin: EdgeInsets.only(bottom: 12.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF111111),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                          AssetImage(_list[index].profileImg),
                          radius: 24,
                        ),
                        SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(_list[index].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(width: 16),
                                Container(
                                  height: 26,
                                  width: 66,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                        color: AppColor.goldenColor,
                                        width: 2.0),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.0)),
                                  ),
                                  child: Text(_list[index].type,
                                      style: TextStyle(
                                          color: AppColor.goldenColor,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                            // SizedBox(height: 6),
                            Text(_list[index].at,
                                style: TextStyle(
                                    color: Color(0xFF686868),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0))
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 68,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFFBABABA),
                                border: Border.all(
                                    color: Color(0xFF474747),
                                    width: 2.0),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8.0)),
                              ),
                              child: Text('Following',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
