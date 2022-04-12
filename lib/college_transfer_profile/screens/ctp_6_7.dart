import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/cto_7.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_7_1.dart';
import 'package:recruiter_flutter/util/colors.dart';

class CTP6_7 extends StatelessWidget {
  const CTP6_7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 26.0, right: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Recieve Offers Directly\nFrom Coaches & Your\nFavourite Schools',
                style: TextStyle(color: Colors.white, fontSize: 26.0)),
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              //  color: Colors.blue,
            ),
            Stack(overflow: Overflow.visible, children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xFF111111),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.20,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset('assets/events_img2.png',
                                  fit: BoxFit.fitHeight))),
                      SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ohio State University',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 4),
                                Text('Coach John Doe',
                                    style: TextStyle(
                                        color: AppColor.yellowColor,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: 4),
                                Text('8/8/2020', style: TextStyle(fontSize: 12.0, color: AppColor.textGreyColor)),
                                Spacer(),
                                Text('Full', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                                SizedBox(height: 2),
                                Text('Scholarship', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.more_horiz, color: AppColor.textGreyColor),
                                Spacer(),
                                Container(
                                  height: 34,
                                  width: 78,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    border: Border.all(color: AppColor.textGreyColor, width: 1.5)
                                  ),
                                  child: Text('Commit', style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500),),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              Positioned(
                top: -140,
               // left: -40,
                right: 20,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color(0xFF111111),
                        boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 10.0,
                                spreadRadius: 10.0,
                                offset: Offset(10.0, 10.0),
                              ),
                            ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                                height: MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.width,
                                child: Image.asset('assets/events_img2.png',
                                    fit: BoxFit.fitHeight))),
                        SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ohio State University',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 4),
                                  Text('Coach John Doe',
                                      style: TextStyle(
                                          color: AppColor.yellowColor,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(height: 4),
                                  Text('8/8/2020', style: TextStyle(fontSize: 12.0, color: AppColor.textGreyColor)),
                                  Spacer(),
                                  Text('Full', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                                  SizedBox(height: 2),
                                  Text('Scholarship', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.more_horiz, color: AppColor.textGreyColor),
                                  Spacer(),
                                  Container(
                                    height: 34,
                                    width: 78,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(6)),
                                        border: Border.all(color: AppColor.textGreyColor, width: 1.5)
                                    ),
                                    child: Text('Commit', style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500),),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ]),
            SizedBox(height: 26),
            Text(
                'And Many Other\nAwesome Features',
                style: TextStyle(color: Colors.white, fontSize: 26.0)),
            SizedBox(height: 26),
            Container(
              width: 200,
              height: 40,
              child: ElevatedButton(
                child: Text(
                  "Go To HomePage",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => CTP_7()));
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColor.goldenColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
