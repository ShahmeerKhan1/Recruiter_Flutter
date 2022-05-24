import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';
import 'package:recruiter_flutter/model/offers_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';

class CTP_Offer_Detail extends StatefulWidget {
  OffersModel data;

  CTP_Offer_Detail({Key? key, required this.data}) : super(key: key);

  @override
  _CTP_Offer_DetailState createState() => _CTP_Offer_DetailState();
}

class _CTP_Offer_DetailState extends State<CTP_Offer_Detail> {

  bool commit = false;
  bool reject = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ctpAppBar('Offer Details', Icons.notifications, context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 8.0),
        decoration: BoxDecoration(
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
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 24,
                    width: 125,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
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
              padding: EdgeInsets.only(left: 10.0, right: 16.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                children: [
                  Image.asset('assets/coach.png'),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.data.name,
                        style: TextStyle(
                            color: Color(0xFFFFEE00),
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '@jdoe',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        print('tapped');
                      },
                      child: Image.asset('assets/msg.png')),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Date: ${widget.data.date}',
                  style: TextStyle(
                      color: AppColor.textGreyColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  widget.data.type,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: AppColor.textGreyColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Full \nScholarship',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        print('commit');
                        setState(() {
                          commit = !commit;
                        });
                      },
                      child: Container(
                        height: 26,
                        width: 82,
                        //  margin: EdgeInsets.only(right: 2.0, bottom: 6.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: commit ? Color(0xFF239B36) : Color(0xFF111111),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: !commit ? AppColor.textGreyColor : Color(0xFF111111))),
                        child: !commit ? Text(
                          widget.data.commit,
                          style: TextStyle(
                              color: AppColor.textGreyColor,
                              fontWeight: FontWeight.w500),
                        ) : Text('Committed', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                      ),
                    ),
                    SizedBox(height: 6),
                    InkWell(
                      onTap: () {
                        setState(() {
                          reject = !reject;
                        });
                      },
                      child: Container(
                        height: 26,
                        width: 82,
                        //  margin: EdgeInsets.only(right: 2.0, bottom: 6.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: reject ? Color(0xFF8C0900) : Color(0xFF111111),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: !reject ? AppColor.textGreyColor : Color(0xFF111111))),
                        child: !reject ? Text(
                          'Reject',
                          style: TextStyle(
                              color: AppColor.textGreyColor,
                              fontWeight: FontWeight.w500),
                        ) : Text('Rejected', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 8),
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
                SizedBox(height: 4),
                Text(
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
