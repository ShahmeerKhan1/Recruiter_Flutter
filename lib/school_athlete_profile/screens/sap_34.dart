
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_custom_drawer.dart';
import 'package:recruiter_flutter/controller/new_event.dart';
import 'package:recruiter_flutter/school_athlete_profile/controller/sap_event_controller.dart';
import 'package:recruiter_flutter/school_athlete_profile/screens/sap_38.dart';
import 'package:recruiter_flutter/school_athlete_profile/screens/sap_event_detail.dart';
import 'package:recruiter_flutter/school_athlete_profile/widgets/sap_app_bar.dart';
import 'package:recruiter_flutter/school_athlete_profile/widgets/sap_drawer.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

import 'sap_35.dart';
import 'sap_44.dart';

class SAP_34 extends StatefulWidget {

  const SAP_34({Key? key}) : super(key: key);

  @override
  State<SAP_34> createState() => _SAP_34State();
}

class _SAP_34State extends State<SAP_34> {

  TextEditingController search = TextEditingController();
  bool _notification = false;

  @override
  void initState() {
    super.initState();

    Get.put(SAPEventController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events', style: TextStyle(color: Colors.white)),
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
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SAP_44()));
                },
                child: _notification ?  Icon(Icons.notifications, color: Colors.white)
                    : Icon(Icons.notifications_none)
            ),
          )
        ],
        bottom: PreferredSize(
            child: Container(
              color: const Color(0xFF474747),
              height: 4.0,
            ),
            preferredSize: const Size.fromHeight(4.0)),
      ),
      drawer: sapDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 6.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SAP_38()));
                    },
                    child: Container(
                      width: 125,
                      height: 40,
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      decoration: BoxDecoration(
                          color: const Color(0xFF111111),
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(
                              color: const Color(0xFF686868)
                          )
                      ),
                      child: Row(
                        children: const [
                          Text('Calendar', style: TextStyle(color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                          Spacer(),
                          Icon(Icons.calendar_today_outlined, color: Color(0xFF686868)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  InkWell(
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const SAP_35()));
                    },
                    child: Container(
                      width: 85,
                      height: 40,
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      decoration: BoxDecoration(
                          color: const Color(0xFF111111),
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(
                              color: const Color(0xFF686868)
                          )
                      ),
                      child: Row(
                        children: const [
                          Text('Create', style: TextStyle(color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                          Spacer(),
                          Icon(Icons.add, color: Color(0xFF686868)),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 42,
                    width: 100,
                    child: TextField(
                        controller: search,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(left: 16.0),
                          contentPadding: const EdgeInsets.only(left: 4.0),
                          filled: true,
                          fillColor: const Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Filter",
                          labelStyle: const TextStyle(color: Color(0xFF686868)),
                          suffixIcon:
                          const Icon(Icons.filter, color: Color(0xFF686868)),
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
                  GetBuilder<SAPEventController>(
                    builder: (_event) {
                      if(_event.eventLists.isNotEmpty) {
                        return ListView.builder(
                            itemCount: _event.eventLists.length,
                            shrinkWrap: true,
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) =>
                                      SAPEventDetail(data: _event.eventLists[index])));
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.31,
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(bottom: 12),
                                  decoration: const BoxDecoration(
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
                                            const BorderRadius.all(Radius.circular(16.0)),
                                            border: Border.all(color: const Color(0xFF474747)),
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
                                                const SizedBox(height: 2),
                                                Text(
                                                  _event.eventLists[index].match,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16.0,
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(height: 2),
                                                Text(
                                                  _event.eventLists[index].location,
                                                  style: TextStyle(color: AppColor.greyBorderColor),
                                                )
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              children: [
                                                Text(_event.eventLists[index].rate,
                                                    style: TextStyle(
                                                        color: AppColor.greyBorderColor, fontSize: 16.0, fontWeight: FontWeight.w500)),
                                                const SizedBox(height: 4),
                                                Container(
                                                  width: 46,
                                                  height: 24,
                                                  alignment: Alignment.center,
                                                  // padding: EdgeInsets.all(6.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius: const BorderRadius.all(
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
                        return const Center(child: Text('Please create event', style: TextStyle(color: Colors.black)),);
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