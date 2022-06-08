import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_30_1.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_31.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_custom_drawer.dart';
import 'package:recruiter_flutter/school_athlete_profile/screens/sap_30.dart';
import 'package:recruiter_flutter/school_athlete_profile/screens/sap_31.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_highlight_widget.dart';
import 'package:recruiter_flutter/widgets/custom_post_widget.dart';

class SAP_28 extends StatefulWidget {
  const SAP_28({Key? key}) : super(key: key);

  @override
  _SAP_28State createState() => _SAP_28State();
}

class _SAP_28State extends State<SAP_28> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  static const String routeName = '/profile';

  List<Widget> list = [
    Tab(text: 'Posts'),
    Tab(
      text: 'Highlights',
    ),
    Tab(
      text: 'Top Schools',
    ),
    Tab(
      text: 'Offers',
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
  String? selectYear = '2020';

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
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SAP_30()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.info_outline, color: Colors.white),
            ),
          ),
        ],
        bottom: PreferredSize(
            child: Container(
              color: Color(0xFF474747),
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      drawer: customDrawer(context),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            // The containers in the background
            Column(
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height * .25,
                  //   color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 26.0),
                    child: Image.asset(
                      'assets/profile_cover.png',
                    ),
                  ),
                ),
                new Container(
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
                                          Text('John Doe',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Text(selectSchool.toString(),
                                          style: TextStyle(
                                              color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                                      SizedBox(height: 6),
                                      Row(
                                        children: [
                                          Row(
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
                                          SizedBox(width: 16),
                                          Row(
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
                                        ],
                                      )
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
                                      width: 82,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFBABABA),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Text('Following',
                                          style: TextStyle(
                                              color: Colors.black,
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
                                      child: Text('Follow',
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
                                'Grad Year:',
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
                               Text(selectSport.toString(),
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(height: 10),
                              Text(selectPosition.toString(),
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(height: 10),
                              Text(selectYear.toString(),
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              print('tap');
                              Navigator.push(context, MaterialPageRoute(builder: (_) => SAP_31()));
                            },
                            child: Container(
                              height: 74,
                              width: 84,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/atheletic_profile.png'),
                                  SizedBox(height: 4),
                                  Text('Athletic Profile',
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
                    isScrollable: true,
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
                      postsTab(), // custom Post Widget
                      CustomHighlightWidget(),
                      TopSchools(),
                      Offers(),
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

class TopSchools extends StatelessWidget {
  const TopSchools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 12),
                padding: EdgeInsets.only(left: 6, right: 6),
                decoration: BoxDecoration(
                  color: Color(0xFF111111),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/events_img2.png',
                            fit: BoxFit.cover)),
                    SizedBox(width: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Ohio State University',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 2),
                        Text(
                          'Columbus, Ohio',
                          style: TextStyle(color: Color(0xFF686868)),
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz, color: Color(0xFF686868))
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

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
                child: Stack(
                  children: [
                    Container(
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
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        height: 30,
                        width: 75,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                                color: AppColor.textGreyColor, width: 1.5)),
                        child: Text('Commit',
                            style: TextStyle(
                                color: AppColor.textGreyColor,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

