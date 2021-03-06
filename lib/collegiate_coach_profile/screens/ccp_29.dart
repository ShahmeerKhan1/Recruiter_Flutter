import 'package:flutter/material.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_30.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_app_bar.dart';
import 'package:recruiter_flutter/util/colors.dart';

class CCP_29 extends StatefulWidget {

  String schoolName;

  CCP_29({Key? key, required this.schoolName}) : super(key: key);

  @override
  _CCP_29State createState() => _CCP_29State();
}

class _CCP_29State extends State<CCP_29> {

  String? selectSchool = 'Ohio State Buckeye';
  String? selectPosition = 'RB';

  final List<String> schoolList = [
    'Bufford High School',
    'Ohio State Buckeye',
    'Hardward University'
  ];
  
  final List<String> positionList = ['RB', 'HC', 'VC'];
  
  bool _evaluate = false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery
        .of(context)
        .size
        .height;
    double _width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      appBar: ccpAppBar('Athelete Profile', Icons.notifications, context),
      backgroundColor: Colors.black,
      body: NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/drawer_img.png'),
                                radius: 36,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Martin Mangram', style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),),
                                  Text(widget.schoolName,
                                      style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 8),
                                  Container(
                                    height: 28,
                                    width: 40,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFBABABA),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    child: const Text('RB', style: TextStyle(fontWeight: FontWeight.w500),),
                                  )
                                ],
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _evaluate = !_evaluate;
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => const CCP_30()));
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 70,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                    border: Border.all(color: AppColor.textGreyColor, width: 1.5)
                                  ),
                                  child: Text('Evaluate', style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500),),
                                ),
                              )
                            ],
                          ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                        child: Text(
                          'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua.',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0,
                              color: Colors.white),
                        ),
                      ),
                    ])))
          ];
        },
        body: SizedBox(
            height: _height,
            width: _width,
            //  color: Colors.blue,
            child: const AtheletePosts()
        ),
      ),
    );
  }
}

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
    double _height = MediaQuery
        .of(context)
        .size
        .height;
    double _width = MediaQuery
        .of(context)
        .size
        .width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 16.0, top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            const Text(
              'Physical Information',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
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
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
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
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
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
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text("Foot",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    Image.asset('assets/foot.png'),
                  ],
                ),
                const SizedBox(width: 36),
                Column(
                  children: [
                    const Text("Hand",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    Image.asset('assets/hand.png'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 42),
            Column(
              children: [
                const Text('Academic',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
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
                    const SizedBox(width: 36),
                    Column(
                      children: [
                        const Text(
                          "1200",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0),
                        ),
                        Text(
                          'SAT',
                          style: TextStyle(color: AppColor.textGreyColor),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 56),
            Column(
              children: [
                const Text(
                  'Top Characteristics',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                const SizedBox(height: 16),
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
                              color: leader ? const Color(0xFF10E9A1) : null,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                              border: Border.all(color: const Color(0xFF10E9A1))),
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
                              const Text(
                                'Leader',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
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
                              color: tactical ? const Color(0xFF10E9A1) : null,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                              border: Border.all(color: const Color(0xFF10E9A1))),
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
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
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
                    const SizedBox(width: 10),
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
                              color: sprinter ? const Color(0xFF10e9A1) : null,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                              border: Border.all(color: const Color(0xFF10E9A1))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              !sprinter
                                  ? Image.asset('assets/sprinter.png',
                                  fit: BoxFit.cover)
                                  : Image.asset('assets/sprinter.png',
                                  fit: BoxFit.cover, color: Colors.white),
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
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
                const SizedBox(height: 32),
                Image.asset('assets/shape.png'),
                const SizedBox(height: 50),
                const Text(
                  'Upcoming Games',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width,
                                // margin: EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: const Color(0xFF111111),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.20,
                                        // width: MediaQuery.of(context).size.width,
                                        //  height: 100,
                                        width: 125,
                                        child: Image.asset('assets/events_img1.png',
                                            fit: BoxFit.cover)),
                                    const SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Fri, Oct 2nd',
                                          style: TextStyle(
                                              color: Color(0xFFFFEE00),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0),
                                        ),
                                        const SizedBox(height: 4),
                                        const Text('Semi Final Game',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500)),
                                        const SizedBox(height: 4),
                                        Text('Ohio Stadium',
                                            style:
                                            TextStyle(color: AppColor.textGreyColor)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Icon(Icons.more_horiz, color: AppColor.textGreyColor)
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Container(
                                  height: 30,
                                  width: 75,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      color: Color(0xFF239B36)),
                                  child: const Text('Going',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 26),
                const Text(
                  'News',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.width,
                            // margin: EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: const Color(0xFF111111),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.10,
                                    // width: MediaQuery.of(context).size.width,
                                    //  height: 100,
                                    width: 125,
                                    child: Image.asset('assets/events_img1.png',
                                        fit: BoxFit.cover)),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Fri, Oct 2nd',
                                      style: TextStyle(
                                          color: Color(0xFFFFEE00),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text('Article Name',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(height: 4),
                                    Text('Website Name',
                                        style:
                                        TextStyle(color: AppColor.textGreyColor)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}