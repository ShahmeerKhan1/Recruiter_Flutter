import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';

class AtheletePosts extends StatefulWidget {
  const AtheletePosts({Key? key}) : super(key: key);

  @override
  _AtheletePostsState createState() => _AtheletePostsState();
}

class _AtheletePostsState extends State<AtheletePosts> {
  bool leader = false;
  bool tactical = false;
  bool sprinter = false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 16.0, top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            Text(
              'Physical Information',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '16',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0),
                    ),
                    Text(
                      'YRS',
                      style: TextStyle(color: AppColor.textGreyColor),
                    )
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '182',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0),
                    ),
                    Text(
                      'LBS',
                      style: TextStyle(color: AppColor.textGreyColor),
                    )
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "5'11''",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0),
                    ),
                    Text(
                      'IN',
                      style: TextStyle(color: AppColor.textGreyColor),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Foot",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 8),
                    Image.asset('assets/foot.png'),
                  ],
                ),
                SizedBox(width: 36),
                Column(
                  children: [
                    Text("Hand",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 8),
                    Image.asset('assets/hand.png'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 42),
            Column(
              children: [
                Text('Academic',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                SizedBox(height: 16),
                Text(
                  "3.2",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0),
                ),
                Text(
                  'GPA',
                  style: TextStyle(color: AppColor.textGreyColor),
                )
              ],
            ),
            SizedBox(height: 56),
            Column(
              children: [
                Text(
                  'Top Characteristics',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          leader = !leader;
                        });
                      },
                      child: Expanded(
                        child: Container(
                          height: _height * 0.14,
                          width: _width * 0.28,
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                              color: leader ? Color(0xFF10E9A1) : null,
                              borderRadius:
                              BorderRadius.all(Radius.circular(6)),
                              border: Border.all(color: Color(0xFF10E9A1))),
                          child: Column(
                            children: [
                              leader
                                  ? Image.asset('assets/leader.png',
                                  color: Colors.white,
                                  fit: BoxFit.fill,
                                  width: 75,
                                  height: 75)
                                  : Image.asset('assets/leader.png',
                                  fit: BoxFit.fill, width: 75, height: 75),
                              Text(
                                'Leader',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          tactical = !tactical;
                        });
                      },
                      child: Expanded(
                        child: Container(
                          height: _height * 0.14,
                          width: _width * 0.28,
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                              color: tactical ? Color(0xFF10E9A1) : null,
                              borderRadius:
                              BorderRadius.all(Radius.circular(6)),
                              border: Border.all(color: Color(0xFF10E9A1))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              !tactical
                                  ? Image.asset(
                                'assets/tactical.png',
                                fit: BoxFit.cover,
                                height: 85,
                                width: 85,
                              )
                                  : Image.asset('assets/tactical.png',
                                  fit: BoxFit.cover,
                                  height: 85,
                                  width: 85,
                                  color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Tactical',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          sprinter = !sprinter;
                        });
                      },
                      child: Expanded(
                        child: Container(
                          height: _height * 0.14,
                          width: _width * 0.28,
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                              color: sprinter ? Color(0xFF10e9A1) : null,
                              borderRadius:
                              BorderRadius.all(Radius.circular(6)),
                              border: Border.all(color: Color(0xFF10E9A1))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              !sprinter
                                  ? Image.asset('assets/sprinter.png',
                                  fit: BoxFit.cover)
                                  : Image.asset('assets/sprinter.png',
                                  fit: BoxFit.cover, color: Colors.white),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Sprinter',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 32),
                Image.asset('assets/shape.png'),
                SizedBox(height: 50),
                Text(
                  'Timeline',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Container(
                  // color: Colors.blue,
                  height: _height,
                  padding: EdgeInsets.only(top: 16.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 6,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          height: _height * 0.09,
                          width: _width,
                          margin: EdgeInsets.only(bottom: 16.0),
                          padding: EdgeInsets.only(left: 16.0),
                          decoration: BoxDecoration(
                              color: Color(0xFF111111),
                              borderRadius:
                              BorderRadius.all(Radius.circular(16))),
                          child: Row(
                            children: [
                              Image.asset('assets/iowa.png'),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Offer',
                                    style: TextStyle(
                                        color: Color(0xFFFFEE00),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: 'lowa Hawkeyes',
                                      style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' send an offer',
                                            style: TextStyle(
                                                decoration:
                                                TextDecoration.none)),
                                        // can add more TextSpans here...
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Feb 24th, 2021',
                                        style:
                                        TextStyle(color: Color(0xFF686868)),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}