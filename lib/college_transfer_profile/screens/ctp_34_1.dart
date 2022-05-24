import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_35_1.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_38_1.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_event_detail.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_custom_drawer.dart';
import 'package:recruiter_flutter/controller/new_event.dart';
import 'package:recruiter_flutter/model/events_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CTP34_1 extends StatefulWidget {

  CTP34_1({Key? key}) : super(key: key);

  @override
  State<CTP34_1> createState() => _CTP34_1State();
}

class _CTP34_1State extends State<CTP34_1> {

  TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();

    Get.put(EventController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ctpAppBar('Events', Icons.notifications, context),
      drawer: customDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 6.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CTP38_1()));
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
                    ),
                  ),
                  SizedBox(width: 6),
                  InkWell(
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => CTP35_1()));
                    },
                    child: Container(
                      width: 85,
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
                          Text('Create', style: TextStyle(color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                          Spacer(),
                          Icon(Icons.add, color: Color(0xFF686868)),
                        ],
                      ),
                    ),
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
                 //  mainAxisAlignment: MainAxisAlignment.center,
                 // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GetBuilder<EventController>(
                    builder: (_event) {
                      if(_event.eventLists.isNotEmpty) {
                        return ListView.builder(
                            itemCount: _event.eventLists.length,
                            shrinkWrap: true,
                            primary: false,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => CTPEventDetail(data: _event.eventLists[index])));
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
                                      Expanded(
                                        child: _event.eventLists[index].imgFile != null
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
                                            _event.eventLists[index].imgFile!,
                                            fit: BoxFit.fill,
                                          ),
                                        ) :
                                        Image.asset(_event.eventLists[index].img!),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _event.eventLists[index].date,
                                                  style: TextStyle(
                                                      color: AppColor.yellowColor,
                                                      fontWeight: FontWeight.w500),
                                                ),
                                                SizedBox(height: 2),
                                                Text(
                                                  _event.eventLists[index].match,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16.0,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(height: 2),
                                                Text(
                                                  _event.eventLists[index].location,
                                                  style: TextStyle(color: AppColor.greyBorderColor),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              children: [
                                                Text(_event.eventLists[index].rate,
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
                                                  child: Text(_event.eventLists[index].share, style: TextStyle(color: AppColor.greyBorderColor, fontSize: 12.0),),
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
                        );
                      }
                      else {
                      //  print('Please create event');
                        return Center(child: Text('Please create event', style: TextStyle(color: Colors.black)),);
                      }
                    },
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