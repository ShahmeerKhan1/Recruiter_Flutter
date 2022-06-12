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