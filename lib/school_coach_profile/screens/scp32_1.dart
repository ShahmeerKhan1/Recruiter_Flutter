import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruiter_flutter/model/events_model.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/scp34_1.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/scp35_1.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';

class SCP32_1 extends StatefulWidget {
  final EventsModel data;

  SCP32_1({Key? key, required this.data}) : super(key: key);

  @override
  _SCP32_1State createState() => _SCP32_1State();
}

class _SCP32_1State extends State<SCP32_1> {

  bool _rsvp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Events', Icons.notifications),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                Image.asset(widget.data.img!),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, right: 8.0, left: 8.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.data.date,
                            style: TextStyle(
                                color: AppColor.yellowColor,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 2),
                          Text(
                            widget.data.match,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                color: Colors.white),
                          ),
                          SizedBox(height: 2),
                          Text(
                            widget.data.location,
                            style: TextStyle(color: AppColor.greyBorderColor),
                          )
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(widget.data.rate,
                              style: TextStyle(
                                  color: AppColor.textGreyColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(color: AppColor.greyBorderColor, height: 0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/pin.png'),
                          SizedBox(width: 6),
                          Text(
                            '411 Woody Hayes Dr. Columbus, OH 43210',
                            style: TextStyle(
                                color: AppColor.textGreyColor,
                                decoration: TextDecoration.underline),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset('assets/dollar.png'),
                          SizedBox(width: 6),
                          Text(
                            'Free Event',
                            style: TextStyle(
                                color: AppColor.yellowColor,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset('assets/time.png'),
                          SizedBox(width: 6),
                          Text(
                            '9:00 am to 11:00 am',
                            style: TextStyle(
                                color: AppColor.textGreyColor,
                                decoration: TextDecoration.underline),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0)),
                      SizedBox(height: 8),
                      Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _rsvp = !_rsvp;
                          });
                        },
                        child: Container(
                          width: 78,
                          height: 34,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: _rsvp == false ?  Colors.black : Color(0xFF2C4471),
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                              border: Border.all(
                                  color: _rsvp == false ? AppColor.textGreyColor : Color(0xFF2C4471), width: 2)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'RSVP',
                                style: TextStyle(
                                    color: _rsvp == false ? AppColor.textGreyColor : Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 2),
                              Icon(Icons.calendar_today_outlined,
                                  color: _rsvp == false ? AppColor.textGreyColor : Colors.white, size: 16)
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => SCP34_1()));
                        },
                        child: Container(
                          width: 78,
                          height: 34,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                              border: Border.all(
                                  color: AppColor.textGreyColor, width: 2)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Invite',
                                style: TextStyle(
                                    color: AppColor.textGreyColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 2),
                              Icon(Icons.add,
                                  color: AppColor.textGreyColor, size: 18)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 78,
                        height: 34,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(
                                color: AppColor.textGreyColor, width: 2)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Share',
                              style: TextStyle(
                                  color: AppColor.textGreyColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 2),
                            Icon(Icons.share,
                                color: AppColor.textGreyColor, size: 16)
                          ],
                        ),
                      ),
                      Container(
                        width: 82,
                        height: 34,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(
                                color: AppColor.textGreyColor, width: 2)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Remove',
                              style: TextStyle(
                                  color: AppColor.textGreyColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 2),
                            Icon(Icons.delete,
                                color: AppColor.textGreyColor, size: 18)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                _rsvp == true ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => SCP35_1()));
                        },
                        child: Container(
                          height: 42,
                          width: 106,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF010C21),
                            border: Border.all(
                              color: Color(0xFF239B36),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          ),
                          child: Text(
                            'Going',
                            style: TextStyle(
                                color: Color(0xFF239B36),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Container(
                        height: 42,
                        width: 106,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFF010C21),
                          border: Border.all(
                            color: Color(0xFF989203),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Text(
                          'May Be',
                          style: TextStyle(
                              color: Color(0xFF989203),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: 42,
                        width: 106,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFF010C21),
                          border: Border.all(
                            color: Color(0xFF8C0900),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Text(
                          'Not Going',
                          style: TextStyle(
                              color: Color(0xFF8C0900),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ) : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
