import 'package:flutter/material.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/custom_app_bar.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/textfield_input_border.dart';
import 'package:recruiter_flutter/util/colors.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {

  TextEditingController _filter = TextEditingController();
  TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Bookmarks', Icons.notifications),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                        controller: _search,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12.0),
                          filled: true,
                          fillColor: Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Search",
                          labelStyle: TextStyle(color: Color(0xFF686868)),
                          suffixIcon: Icon(Icons.search, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: TextField(
                        controller: _filter,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
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
            Container(
              height: MediaQuery.of(context).size.height * 0.46,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Color(0xFF111111),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/drawer_img.png'),
                        radius: 28,
                      ),
                      SizedBox(width: 6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //  color: Colors.blue,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Martin Mangram',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  ' - ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  '1m',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Spacer(),
                                Icon(Icons.more_horiz, color: Colors.white),
                                //     IconButton(
                                //         onPressed: () {},
                                //         icon: Icon(Icons.more_horiz))
                              ],
                            ),
                          ),
                          //  SizedBox(height: 4),
                          Text(
                            'After a great conversation with coach Ark \nCarter, I am extremely blessed to receive an \noffer from the University of Arkansas',
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                color: Colors.white, fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                height: 110,
                                //  color: Colors.blue,
                                child: Image.asset(
                                  'assets/posts_img_one.png',
                                  fit: BoxFit.fill,
                                )),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: Container(
                                height: 110,
                                //  color: Colors.green,
                                child: Image.asset(
                                  'assets/posts_img_two.png',
                                  fit: BoxFit.fill,
                                )),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                height: 110,
                                //  color: Colors.blue,
                                child: Image.asset(
                                  'assets/posts_img_three.png',
                                  fit: BoxFit.fill,
                                )),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: Container(
                                height: 110,
                                //  color: Colors.green,
                                child: Image.asset(
                                  'assets/posts_img_four.png',
                                  fit: BoxFit.fill,
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.favorite,
                              color: AppColor.greyBorderColor, size: 20),
                          SizedBox(width: 2),
                          Text(
                            '1.1k',
                            style:
                            TextStyle(color: AppColor.greyBorderColor),
                          )
                        ],
                      ),
                      SizedBox(width: 26),
                      Row(
                        children: [
                          Icon(Icons.comment,
                              color: AppColor.greyBorderColor, size: 20),
                          SizedBox(width: 2),
                          Text('1.1k',
                              style: TextStyle(
                                  color: AppColor.greyBorderColor))
                        ],
                      ),
                      SizedBox(width: 26),
                      Row(
                        children: [
                          Icon(Icons.star,
                              color: AppColor.greyBorderColor, size: 20),
                          SizedBox(width: 2),
                          Text('1.1k',
                              style: TextStyle(
                                  color: AppColor.greyBorderColor))
                        ],
                      ),
                      // SizedBox(width: 16),
                      Spacer(),
                      Icon(Icons.share,
                          color: AppColor.greyBorderColor, size: 20),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.31,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
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
                  Image.asset('assets/events_img1.png'),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Fri, Oct 2nd',
                              style: TextStyle(
                                  color: AppColor.yellowColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Private Football Camp',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Ohio Stadium',
                              style: TextStyle(color: AppColor.greyBorderColor),
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text('\$',
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
                              child: Text('Share', style: TextStyle(color: AppColor.greyBorderColor, fontSize: 12.0),),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
