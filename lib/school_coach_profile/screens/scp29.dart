import 'package:flutter/material.dart';
import 'package:recruiter_flutter/model/stats_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';

import 'scp30_1.dart';

class SCP29 extends StatefulWidget {
  const SCP29({Key? key}) : super(key: key);

  @override
  _SCP29State createState() => _SCP29State();
}

class _SCP29State extends State<SCP29> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    const Tab(text: 'Posts'),
    const Tab(text: 'Stats'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this); // Tab Bar

    _controller.addListener(() {
      // Tab Bar
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: scpAppBar('Athelete Profile', Icons.notifications, context),
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
                              radius: 40,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Martin Mangram',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500)),
                                Text('Bufford High School',
                                    style: TextStyle(
                                        color: AppColor.textGreyColor)),
                                const SizedBox(height: 10),
                                Container(
                                  height: 28,
                                  width: 48,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFBABABA),
                                    border: Border.all(
                                        color: Colors.white, width: 2.0),
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: const Text('RB',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      )),
                                )
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Container(
                                  height: 32,
                                  width: 76,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF239B36),
                                    // border: Border.all(
                                    //     color: Color(0xFF474747),
                                    //     width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: const Text('Committed',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const SizedBox(height: 16),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SCP30_1()));
                                  },
                                  child: Container(
                                    height: 32,
                                    width: 76,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(
                                          color: const Color(0xFF474747), width: 2.0),
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(8.0)),
                                    ),
                                    child: const Text('Evaluate',
                                        style: TextStyle(
                                            color: Color(0xFF474747),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text(
                          'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua.',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        child: TabBar(
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                          labelColor: Colors.white,
                          unselectedLabelStyle:
                              TextStyle(color: AppColor.greyBorderColor),
                          indicatorColor: Colors.white,
                          onTap: (index) {
                            print('Tab $index is tapped');
                            // Should not used it as it only called when tab options are clicked,
                            // not when user swapped
                          },
                          controller: _controller,
                          tabs: list,
                        ),
                      ),
                    ])))
          ];
        },
        body: SizedBox(
          height: _height,
          width: _width,
          //  color: Colors.blue,
          child: TabBarView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const AtheletePosts(), // custom Post Widget
              AtheleteStats()
              //  CustomHighlightWidget(), // custom hightlight widget
              // Container(
              //   color: Colors.green,
              // )
            ],
          ),
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
            const SizedBox(height: 56),
            Column(
              children: [
                const Text(
                  'Top Characteristics',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: const Color(0xFF10E9A1))),
                        child: Column(
                          children: [
                            Image.asset('assets/leader.png',
                                fit: BoxFit.fill, width: 75, height: 75),
                            const Text(
                              'Leader',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: const Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/tactical.png',
                              fit: BoxFit.cover,
                              height: 85,
                              width: 85,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Leader',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: const Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover),
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
                    )
                  ],
                ),
                const SizedBox(height: 32),
                Image.asset('assets/shape.png'),
                const SizedBox(height: 50),
                const Text(
                  'Timeline',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Container(
                  // color: Colors.blue,
                  height: _height,
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 6,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          height: _height * 0.09,
                          width: _width,
                          margin: const EdgeInsets.only(bottom: 16.0),
                          padding: const EdgeInsets.only(left: 16.0),
                          decoration: const BoxDecoration(
                              color: Color(0xFF111111),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Row(
                            children: [
                              Image.asset('assets/iowa.png'),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
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
                                    children: const [
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

class AtheleteStats extends StatelessWidget {
  AtheleteStats({Key? key}) : super(key: key);

  final List<StatsModel> _list = [
    StatsModel(
        date: 'Fri, Oct 2nd',
        team: 'School 1 Vs School2',
        location: 'Ohio Stadium',
        status: 'W 41-24',
        ratio: '7.2',
        rating: 'Rating',
        color: const Color(0xFF239B36)),
    StatsModel(
        date: 'Fri, Oct 2nd',
        team: 'School 1 Vs School2',
        location: 'Ohio Stadium',
        status: 'L 24-29',
        ratio: '7.2',
        rating: 'Rating',
        color: const Color(0xFFF61F1F)),
    StatsModel(
        date: 'Fri, Oct 2nd',
        team: 'School 1 Vs School2',
        location: 'Ohio Stadium',
        status: 'W 41-24',
        ratio: '7.2',
        rating: 'Rating',
        color: const Color(0xFF239B36)),
    StatsModel(
        date: 'Fri, Oct 2nd',
        team: 'School 1 Vs School2',
        location: 'Ohio Stadium',
        status: 'L 24-40',
        ratio: '7.2',
        rating: 'Rating',
        color: const Color(0xFFF61F1F)),
    StatsModel(
        date: 'Fri, Oct 2nd',
        team: 'School 1 Vs School2',
        location: 'Ohio Stadium',
        status: 'W 41-24',
        ratio: '7.2',
        rating: 'Rating',
        color: const Color(0xFF239B36)),
    StatsModel(
        date: 'Fri, Oct 2nd',
        team: 'School 1 Vs School2',
        location: 'Ohio Stadium',
        status: 'W 41-24',
        ratio: '7.2',
        rating: 'Rating',
        color: const Color(0xFF239B36)),
  ];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Performance History',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      height: _height * 0.1,
                      width: _width,
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      margin: const EdgeInsets.only(top: 16.0, bottom: 2.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFF111111),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/perform.png'),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _list[index].date,
                                style: const TextStyle(
                                    color: Color(0xFFFFEE00),
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 2),
                              Text(_list[index].team,
                                  style: const TextStyle(color: Colors.white)),
                              const SizedBox(height: 2),
                              Text(
                                _list[index].location,
                                style: const TextStyle(color: Color(0xFF686868)),
                              )
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _list[index].status,
                                style: TextStyle(color: _list[index].color),
                              ),
                              Text(
                                _list[index].ratio,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Text(
                                _list[index].rating,
                                style: const TextStyle(
                                    color: Color(0xFF717781), fontSize: 12.0),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
              const SizedBox(height: 42),
              const Text('Physical Stats',
                  style: TextStyle(color: Colors.white, fontSize: 18.0)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36),
                            ),
                            Container(
                           //   color: Colors.blue,
                              width: 125,
                              alignment: Alignment.center,
                              child: const Text(
                                'Bench Press',
                                style: TextStyle(
                                    color: Color(0xFFFFEE00),
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                       // SizedBox(width: 62),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36),
                            ),
                            Container(
                          //    color: Colors.blue,
                              width: 125,
                              alignment: Alignment.center,
                              child: const Text(
                                'Squat',
                                style: TextStyle(
                                    color: Color(0xFFFFEE00),
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36),
                            ),
                            Container(
                            //  color: Colors.blue,
                              width: 125,
                              alignment: Alignment.center,
                              child: const Text(
                                'Vertical',
                                style: TextStyle(
                                    color: Color(0xFFFFEE00),
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                     //   SizedBox(width: 62),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36),
                            ),
                            Container(
                           //   color: Colors.blue,
                              width: 125,
                              alignment: Alignment.center,
                              child: const Text(
                                'Broad Jump',
                                style: TextStyle(
                                    color: Color(0xFFFFEE00),
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36),
                            ),
                            Container(
                         //     color: Colors.blue,
                              width: 125,
                              alignment: Alignment.center,
                              child: const Text(
                                'Power Clean',
                                style: TextStyle(
                                    color: Color(0xFFFFEE00),
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                       // SizedBox(width: 62),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36),
                            ),
                            Container(
                          //    color: Colors.blue,
                              width: 125,
                              alignment: Alignment.center,
                              child: const Text(
                                'Deadlift',
                                style: TextStyle(
                                    color: Color(0xFFFFEE00),
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
