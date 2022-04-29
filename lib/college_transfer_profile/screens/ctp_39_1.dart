import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_offer_detail.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_custom_drawer.dart';
import 'package:recruiter_flutter/model/offers_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CTP39_1 extends StatefulWidget {
  const CTP39_1({Key? key}) : super(key: key);

  @override
  _CTP39_1State createState() => _CTP39_1State();
}

class _CTP39_1State extends State<CTP39_1> with SingleTickerProviderStateMixin {

  late TabController _controller;

  int _selectedIndex = 0; //  Tab Bar Index

  List<Widget> list = [
    Tab(text: 'Offers'),
    Tab(
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
      drawer: customDrawer(context),
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Recruiting', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.notifications),
            ),
          ],
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
          ),
      ),
      body: TabBarView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Offers(),
          TopSchools(),
        ],
      ),
    );
  }
}

class Offers extends StatelessWidget {
  Offers({Key? key}) : super(key: key);

  TextEditingController search = TextEditingController();

  List<OffersModel> _list = [
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
                  child: Container(
                    height: 42,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF239B36),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Text('Available', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                  ),
                ),
                SizedBox(width: 6),
                Container(
                  height: 42,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: AppColor.textGreyColor
                    )
                  ),
                  child: Image.asset('assets/filter.png'),
                ),
                SizedBox(width: 6),
                Expanded(
                  flex: 2,
                  child: TextField(
                      controller: search,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: Color(0xFF111111),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Search for offers",
                        labelStyle: TextStyle(color: Color(0xFF686868)),
                        suffixIcon:
                        Icon(Icons.search, color: Color(0xFF686868)),
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
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CTP_Offer_Detail(data: _list[index])));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
                      margin: EdgeInsets.only(top: 16.0, bottom: 6.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF111111),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Container(
                                  height: 180,
                                  width: 140,
                                  child: Image.asset(_list[index].img,
                                      fit: BoxFit.cover)),
                              SizedBox(width: 6),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _list[index].location,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0),
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      width: 160,
                                      // color: Colors.blue,
                                      // height: MediaQuery.of(context).size.height,
                                      child: Text(
                                        _list[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                            color: Color(0xFFFFEE00)),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      _list[index].date,
                                      style: TextStyle(
                                          color: AppColor.greyBorderColor),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      _list[index].type,
                                      style: TextStyle(
                                          color: AppColor.greyBorderColor),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 6.0),
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
                              margin: EdgeInsets.only(right: 2.0, bottom: 6.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
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

class TopSchools extends StatelessWidget {
  TopSchools({Key? key}) : super(key: key);

  TextEditingController search = TextEditingController();

  List<OffersModel> _list = [
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
                  child: Container(
                    height: 42,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF239B36),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Text('Available', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
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
                SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: TextField(
                      controller: search,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: Color(0xFF111111),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Search for offers",
                        labelStyle: TextStyle(color: Color(0xFF686868)),
                        suffixIcon:
                        Icon(Icons.search, color: Color(0xFF686868)),
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
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CTP_Offer_Detail(data: _list[index])));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
                      margin: EdgeInsets.only(top: 16.0, bottom: 6.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF111111),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Container(
                                  height: 180,
                                  width: 140,
                                  child: Image.asset(_list[index].img,
                                      fit: BoxFit.cover)),
                              SizedBox(width: 6),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _list[index].location,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0),
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      width: 160,
                                      // color: Colors.blue,
                                      // height: MediaQuery.of(context).size.height,
                                      child: Text(
                                        _list[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                            color: Color(0xFFFFEE00)),
                                      ),
                                    ),
                                    SizedBox(height: 4),
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
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 6.0),
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
                              margin: EdgeInsets.only(right: 2.0, bottom: 6.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
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

