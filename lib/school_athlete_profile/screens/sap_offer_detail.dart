import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';
import 'package:recruiter_flutter/model/offers_model.dart';
import 'package:recruiter_flutter/school_athlete_profile/widgets/sap_app_bar.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/commit_reject_widget.dart';

import 'sap_44.dart';

class SAP_Offer_Detail extends StatefulWidget {
  OffersModel data;

  SAP_Offer_Detail({Key? key, required this.data}) : super(key: key);

  @override
  _SAP_Offer_DetailState createState() => _SAP_Offer_DetailState();
}

class _SAP_Offer_DetailState extends State<SAP_Offer_Detail> {

  bool commit = false;
  bool reject = false;

  bool _notification = false;

  String? _groupValue;

  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offer Details', style: TextStyle(color: Colors.white)),
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 8.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Color(0xFF111111),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.more_horiz,
                  color: AppColor.textGreyColor,
                )),
            Image.asset(widget.data.img),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.data.location,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 24,
                    width: 125,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                        border: Border.all(color: AppColor.textGreyColor)),
                    child: Text(
                      'Add To Top Schools',
                      style: TextStyle(
                          color: AppColor.textGreyColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.075,
              padding: const EdgeInsets.only(left: 10.0, right: 16.0),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                children: [
                  Image.asset('assets/coach.png'),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.data.name,
                        style: const TextStyle(
                            color: Color(0xFFFFEE00),
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        '@jdoe',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        print('tapped');
                      },
                      child: Image.asset('assets/msg.png')),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Date: ${widget.data.date}',
                  style: TextStyle(
                      color: AppColor.textGreyColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  widget.data.type,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: AppColor.textGreyColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Full \nScholarship',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Column(
                  children: [
                    CommitRejectWidget<String>(
                        value: 'A',
                        text1: 'Commit',
                        text2: 'Committed',
                        color: Color(0xFF239B36),
                        groupValue: _groupValue,
                        onChanged: _valueChangedHandler(),
                    ),
                    SizedBox(height: 6),
                    CommitRejectWidget<String>(
                        value: 'B',
                        text1: 'Reject',
                        text2: 'Rejected',
                        color: Color(0xFF8C0900),
                        groupValue: _groupValue,
                        onChanged: _valueChangedHandler()
                    )
                  ],
                ),
                // Column(
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         print('commit');
                //         setState(() {
                //           commit = !commit;
                //         });
                //       },
                //       child: Container(
                //         height: 26,
                //         width: 82,
                //         //  margin: EdgeInsets.only(right: 2.0, bottom: 6.0),
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           color: commit ? const Color(0xFF239B36) : const Color(0xFF111111),
                //             borderRadius: const BorderRadius.all(Radius.circular(6)),
                //             border: Border.all(color: !commit ? AppColor.textGreyColor : const Color(0xFF111111))),
                //         child: !commit ? Text(
                //           widget.data.commit,
                //           style: TextStyle(
                //               color: AppColor.textGreyColor,
                //               fontWeight: FontWeight.w500),
                //         ) : const Text('Committed', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                //       ),
                //     ),
                //     const SizedBox(height: 6),
                //     InkWell(
                //       onTap: () {
                //         setState(() {
                //           reject = !reject;
                //         });
                //       },
                //       child: Container(
                //         height: 26,
                //         width: 82,
                //         //  margin: EdgeInsets.only(right: 2.0, bottom: 6.0),
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           color: reject ? const Color(0xFF8C0900) : const Color(0xFF111111),
                //             borderRadius: const BorderRadius.all(Radius.circular(6)),
                //             border: Border.all(color: !reject ? AppColor.textGreyColor : const Color(0xFF111111))),
                //         child: !reject ? Text(
                //           'Reject',
                //           style: TextStyle(
                //               color: AppColor.textGreyColor,
                //               fontWeight: FontWeight.w500),
                //         ) : const Text('Rejected', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Offer Details',
                  style: TextStyle(
                      color: AppColor.textGreyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\nLorem ipsum dolor sit amet, consetetur sadipscing',
                  style: TextStyle(
                    fontSize: 13,
                      color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
