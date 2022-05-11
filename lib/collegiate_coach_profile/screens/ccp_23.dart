import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';

class CCP_23 extends StatelessWidget {

  String school;

  CCP_23({Key? key, required this.school}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Coaching', Icons.notifications),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/drawer_img.png'),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Martin Mangram', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                      Text(school, style: TextStyle(color: Color(0xFF686868), fontWeight: FontWeight.w500)),
                      SizedBox(height: 6),
                      Container(
                          height: 22,
                          width: 66,
                          alignment: Alignment.center,
                          child: Text('Coach', style: TextStyle(color: Color(0xFFE0B216), fontWeight: FontWeight.w500, fontSize: 12.0)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            border: Border.all(
                              color: Color(0xFFE0B216),
                            ),
                          )
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 28,
                    width: 78,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)),
                        border: Border.all(
                            color: Color(0xFF686868),
                            width: 1.5)),
                    child: Text('Edit Profile',
                        style: TextStyle(
                            color: Color(0xFF686868),
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0)),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  Text('Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua.',
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                  SizedBox(height: 42),
                  Text('Current Recruiting Status', style: TextStyle(color: Colors.white, fontSize: 22.0),),
                  SizedBox(height: 8),
                  Text('ACTIVE' , style: TextStyle(color: Color(0xFF00BE06), fontSize: 30.0, fontWeight: FontWeight.bold),),
                  SizedBox(height: 22),
                  Text('Remaining Scholarship Sports', style: TextStyle(color: Colors.white, fontSize: 22.0),),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('5', style: TextStyle(color: Color(0xFFFFEE00), fontSize: 30, fontWeight: FontWeight.w500),),
                          Text('RB', style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(width: 26),
                      Column(
                        children: [
                          Text('5', style: TextStyle(color: Color(0xFFFFEE00), fontSize: 30, fontWeight: FontWeight.w500),),
                          Text('RB', style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(width: 26),
                      Column(
                        children: [
                          Text('5', style: TextStyle(color: Color(0xFFFFEE00), fontSize: 30, fontWeight: FontWeight.w500),),
                          Text('RB', style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(width: 26),
                      Column(
                        children: [
                          Text('5', style: TextStyle(color: Color(0xFFFFEE00), fontSize: 30, fontWeight: FontWeight.w500),),
                          Text('RB', style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(width: 26),
                      Column(
                        children: [
                          Text('5', style: TextStyle(color: Color(0xFFFFEE00), fontSize: 30, fontWeight: FontWeight.w500),),
                          Text('RB', style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500))
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 32),
                  Text('Recruiting Regions', style: TextStyle(color: Colors.white, fontSize: 22),),
                  SizedBox(height: 16),
                  Text('CA, TX, AZ & OH' , style: TextStyle(color: Color(0xFFFFEE00), fontSize: 30, fontWeight: FontWeight.w500),),
                  SizedBox(height: 16),
                  Image.asset('assets/region.png'),
                  SizedBox(height: 32),
                  Text('Scouting Positions', style: TextStyle(color: Colors.white, fontSize: 22),),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('RB', style: TextStyle(color: Color(0xFFFFEE00), fontSize: 30, fontWeight: FontWeight.w500),),
                          Text('2 left', style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(width: 26),
                      Column(
                        children: [
                          Text('RB', style: TextStyle(color: Color(0xFFFFEE00), fontSize: 30, fontWeight: FontWeight.w500),),
                          Text('2 left', style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(width: 26),
                      Column(
                        children: [
                          Text('RB', style: TextStyle(color: Color(0xFFFFEE00), fontSize: 30, fontWeight: FontWeight.w500),),
                          Text('2 left', style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(width: 26),
                      Column(
                        children: [
                          Text('RB', style: TextStyle(color: Color(0xFFFFEE00), fontSize: 30, fontWeight: FontWeight.w500),),
                          Text('2 left', style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Text('Positions Needed', style: TextStyle(color: Colors.white, fontSize: 22.0),),
                  SizedBox(height: 8),
                  Text('RB - RB - RB', style: TextStyle(color: Color(0xFFFFEE00), fontSize: 30, fontWeight: FontWeight.w500),),
                  SizedBox(height: 32),
                  Text('Minimum GPA' , style: TextStyle(color: Colors.white, fontSize: 22.0)),
                  SizedBox(height: 8),
                  Text('3.4', style: TextStyle(color: Color(0xFFFFEE00), fontSize: 30, fontWeight: FontWeight.w500),),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
