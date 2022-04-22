import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_custom_drawer.dart';
import 'package:recruiter_flutter/model/events_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CTP34_1 extends StatelessWidget {
  CTP34_1({Key? key}) : super(key: key);

  TextEditingController search = TextEditingController();

  List<EventsModel> _list = [
    EventsModel(
        img: 'assets/events_img1.png',
        date: 'Fri, Oct 2nd',
        match: 'Private Football Camp',
        location: 'Ohio Stadium',
        rate: '\$',
        share: 'Share'),
    EventsModel(
        img: 'assets/events_img2.png',
        date: 'Fri, Oct 2nd',
        match: 'Private State University Football Camp',
        location: 'Ohio Stadium',
        rate: 'Free',
        share: 'Share'),
    EventsModel(
        img: 'assets/events_img1.png',
        date: 'Fri, Oct 2nd',
        match: 'Private Football Camp',
        location: 'Ohio Stadium',
        rate: '\$',
        share: 'Share'),
    EventsModel(
        img: 'assets/events_img1.png',
        date: 'Fri, Oct 2nd',
        match: 'Private Football Camp',
        location: 'Ohio Stadium',
        rate: '\$',
        share: 'Share'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Events', Icons.notifications),
      drawer: customDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (_) => SCP35_1()));
                    },
                    child: Container(
                      width: 125,
                      height: 40,
                      padding: EdgeInsets.only(left: 4, right: 4),
                      decoration: BoxDecoration(
                          color: Color(0xFF111111),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(
                              color: Color(0xFF686868)
                          )
                      ),
                      child: Row(
                        children: [
                          Text('Calendar', style: TextStyle(color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                          Spacer(),
                          Icon(Icons.calendar_today_outlined, color: Color(0xFF686868)),
                        ],
                      ),
                      // child: TextField(
                      //     controller: search,
                      //     // textAlign: TextAlign.left,
                      //     style: TextStyle(color: Colors.white),
                      //     decoration: InputDecoration(
                      //       contentPadding: EdgeInsets.only(left: 4.0),
                      //       filled: true,
                      //       fillColor: Color(0xFF111111),
                      //       floatingLabelBehavior: FloatingLabelBehavior.never,
                      //       labelText: "Calendar",
                      //       labelStyle: TextStyle(color: Color(0xFF686868)),
                      //       suffixIcon: Icon(Icons.calendar_today_outlined,
                      //           color: Color(0xFF686868)),
                      //       //  prefixIcon: Icon(Icons.people),
                      //       border: myinputborder(),
                      //       enabledBorder: myinputborder(),
                      //       focusedBorder: myfocusborder(),
                      //     )),
                    ),
                  ),
                  SizedBox(width: 2),
                  Container(
                    width: 100,
                    height: 42,
                    child: TextField(
                        controller: search,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(left: 16.0),
                          contentPadding: EdgeInsets.only(left: 4.0),
                          filled: true,
                          fillColor: Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Create",
                          labelStyle: TextStyle(color: Color(0xFF686868)),
                          suffixIcon: Icon(Icons.add, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                  Spacer(),
                  Container(
                    height: 42,
                    width: 100,
                    child: TextField(
                        controller: search,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(left: 16.0),
                          contentPadding: EdgeInsets.only(left: 4.0),
                          filled: true,
                          fillColor: Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Filter",
                          labelStyle: TextStyle(color: Color(0xFF686868)),
                          suffixIcon:
                          Icon(Icons.filter, color: Color(0xFF686868)),
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
                  left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                      itemCount: _list.length,
                      shrinkWrap: true,
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () {
                         //   Navigator.push(context, MaterialPageRoute(builder: (_) => SCP32_1(data: _list[index])));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.31,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Color(0xFF111111),
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.more_horiz,
                                          color: AppColor.greyBorderColor)),
                                ),
                                Image.asset(_list[index].img),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            _list[index].date,
                                            style: TextStyle(
                                                color: AppColor.yellowColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            _list[index].match,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0,
                                                color: Colors.white),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            _list[index].location,
                                            style: TextStyle(color: AppColor.greyBorderColor),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: [
                                          Text(_list[index].rate,
                                              style: TextStyle(
                                                  color: AppColor.greyBorderColor, fontSize: 16.0, fontWeight: FontWeight.w500)),
                                          SizedBox(height: 4),
                                          Container(
                                            width: 46,
                                            height: 24,
                                            alignment: Alignment.center,
                                            // padding: EdgeInsets.all(6.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6.0)),
                                                color: Colors.black,
                                                border: Border.all(
                                                    color: AppColor.greyBorderColor)),
                                            child: Text(_list[index].share, style: TextStyle(color: AppColor.greyBorderColor, fontSize: 12.0),),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}