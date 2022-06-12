import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_offer_detail.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_custom_drawer.dart';
import 'package:recruiter_flutter/model/offers_model.dart';
import 'package:recruiter_flutter/school_athlete_profile/widgets/sap_drawer.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

import 'sap_44.dart';
import 'sap_offer_detail.dart';

class SAP_39 extends StatefulWidget {
  const SAP_39({Key? key}) : super(key: key);

  @override
  _SAP_39State createState() => _SAP_39State();
}

class _SAP_39State extends State<SAP_39> with SingleTickerProviderStateMixin {

  late TabController _controller;

  int _selectedIndex = 0; //  Tab Bar Index

  List<Widget> list = [
    const Tab(text: 'Offers'),
    const Tab(
      text: 'Top Schools',
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
      drawer: sapDrawer(context),
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Recruiting', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SAP_44()));
              },
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.notifications),
              ),
            ),
          ],
          bottom: TabBar(
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
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
          ),
      ),
      body: TabBarView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Offers(),
          TopSchools(),
        ],
      ),
    );
  }
}

class Offers extends StatefulWidget {
  Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  TextEditingController search = TextEditingController();

  bool _chkAvailable = true;

  final List<OffersModel> _list = [
    OffersModel(
      img: 'assets/events_img2.png',
      name: 'Coach John Doe',
      type: '(Official)',
      location: 'Ohio State University',
      date: '8/8/2020',
      commit: 'Commit'
    ),
    OffersModel(
        img: 'assets/events_img2.png',
        name: 'Coach John Doe',
        type: '(Verbal)',
        location: 'Ohio State University',
        date: '8/8/2020',
        commit: 'Commit'
    ),

    OffersModel(
        img: 'assets/events_img2.png',
        name: 'Coach John Doe',
        type: '(Verbal)',
        location: 'Ohio State University',
        date: '8/8/2020',
        commit: 'Commit'
    ),

    OffersModel(
        img: 'assets/events_img2.png',
        name: 'Coach John Doe',
        type: '(Official)',
        location: 'Ohio State University',
        date: '8/8/2020',
        commit: 'Commit'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _chkAvailable = !_chkAvailable;
                      });
                    },
                    child: Container(
                      height: 42,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _chkAvailable ? Color(0xFF239B36) : Color(0xFF8C0900),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: _chkAvailable ? Text('Available', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
                          : Text('Not Available', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500))
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  height: 42,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: AppColor.textGreyColor
                    )
                  ),
                  child: Image.asset('assets/filter.png'),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 2,
                  child: TextField(
                      controller: search,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: const Color(0xFF111111),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Search for offers",
                        labelStyle: const TextStyle(color: Color(0xFF686868)),
                        suffixIcon:
                        const Icon(Icons.search, color: Color(0xFF686868)),
                        //  prefixIcon: Icon(Icons.people),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                ),
              ],
            ),
            ListView.builder(
              //  primary: false,
                itemCount: _list.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SAP_Offer_Detail(data: _list[index])));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
                      margin: const EdgeInsets.only(top: 16.0, bottom: 6.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFF111111),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 180,
                                  width: 140,
                                  child: Image.asset(_list[index].img,
                                      fit: BoxFit.cover)),
                              const SizedBox(width: 6),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _list[index].location,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0),
                                    ),
                                    const SizedBox(height: 4),
                                    SizedBox(
                                      width: 160,
                                      // color: Colors.blue,
                                      // height: MediaQuery.of(context).size.height,
                                      child: Text(
                                        _list[index].name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                            color: Color(0xFFFFEE00)),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _list[index].date,
                                      style: TextStyle(
                                          color: AppColor.greyBorderColor),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _list[index].type,
                                      style: TextStyle(
                                          color: AppColor.greyBorderColor),
                                    ),
                                    const Spacer(),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 6.0),
                                      child: Text(
                                        'Full\nScholarship',
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.more_horiz,
                                        color: AppColor.textGreyColor)),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 30,
                              width: 72,
                              margin: const EdgeInsets.only(right: 2.0, bottom: 6.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                                border: Border.all(color: AppColor.textGreyColor)
                              ),
                              child: Text(
                                _list[index].commit,
                                style: TextStyle(
                                    color: AppColor.textGreyColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class TopSchools extends StatefulWidget {
  TopSchools({Key? key}) : super(key: key);

  @override
  State<TopSchools> createState() => _TopSchoolsState();
}

class _TopSchoolsState extends State<TopSchools> {

  TextEditingController search = TextEditingController();

  bool _chkAvailable = true;

  final List<OffersModel> _list = [
    OffersModel(
        img: 'assets/events_img2.png',
        name: 'John Doe',
        type: '(Official)',
        location: 'Ohio State University',
        date: '8/8/2020',
        commit: 'Commit'
    ),
    OffersModel(
        img: 'assets/events_img2.png',
        name: 'John Doe',
        type: '(Verbal)',
        location: 'Ohio State University',
        date: '8/8/2020',
        commit: 'Commit'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _chkAvailable = !_chkAvailable;
                      });
                    },
                    child: Container(
                      height: 42,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _chkAvailable ? Color(0xFF239B36) : Color(0xFF8C0900),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: _chkAvailable ? Text('Available', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
                      : Text('Not Available', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
                // SizedBox(width: 6),
                // Container(
                //   height: 42,
                //   width: 40,
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(8)),
                //       border: Border.all(
                //           color: AppColor.textGreyColor
                //       )
                //   ),
                //   child: Image.asset('assets/filter.png'),
                // ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: TextField(
                      controller: search,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: const Color(0xFF111111),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Search for offers",
                        labelStyle: const TextStyle(color: Color(0xFF686868)),
                        suffixIcon:
                        const Icon(Icons.search, color: Color(0xFF686868)),
                        //  prefixIcon: Icon(Icons.people),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                ),
              ],
            ),
            ListView.builder(
              //  primary: false,
                itemCount: _list.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SAP_Offer_Detail(data: _list[index])));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
                      margin: const EdgeInsets.only(top: 16.0, bottom: 6.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFF111111),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 180,
                                  width: 140,
                                  child: Image.asset(_list[index].img,
                                      fit: BoxFit.cover)),
                              const SizedBox(width: 6),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _list[index].location,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0),
                                    ),
                                    const SizedBox(height: 4),
                                    SizedBox(
                                      width: 160,
                                      // color: Colors.blue,
                                      // height: MediaQuery.of(context).size.height,
                                      child: Text(
                                        _list[index].name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                            color: Color(0xFFFFEE00)),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _list[index].date,
                                      style: TextStyle(
                                          color: AppColor.greyBorderColor),
                                    ),
                                    // SizedBox(height: 4),
                                    // Text(
                                    //   _list[index].type,
                                    //   style: TextStyle(
                                    //       color: AppColor.greyBorderColor),
                                    // ),
                                    const Spacer(),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 6.0),
                                      child: Text(
                                        'Full\nScholarship',
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.more_horiz,
                                        color: AppColor.textGreyColor)),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 30,
                              width: 72,
                              margin: const EdgeInsets.only(right: 2.0, bottom: 6.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(color: AppColor.textGreyColor)
                              ),
                              child: Text(
                                _list[index].commit,
                                style: TextStyle(
                                    color: AppColor.textGreyColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}


