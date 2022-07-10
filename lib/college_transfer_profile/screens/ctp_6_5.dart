import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_6_6.dart';
import 'package:recruiter_flutter/util/colors.dart';

import 'ctp_7.dart';

class CTP6_5 extends StatelessWidget {
  const CTP6_5({Key? key}) : super(key: key);

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
            const Text(
                'Check And Like Posts\n& Highlights From Other\nAtheletes You Follow',
                style: TextStyle(color: Colors.white, fontSize: 26.0)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
            //  color: Colors.blue,
            ),
            Stack(
               // overflow: Overflow.visible,
                clipBehavior: Clip.none,
                children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color(0xFF111111),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/drawer_img.png'),
                          radius: 28,
                        ),
                        const SizedBox(width: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              //  color: Colors.blue,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    'John Doe ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '- ',
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
                            const Text(
                              'Watch my latest video!\nThanks to @sportsvideo for the awesome\nedit!',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Container(
                        // alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Image.asset('assets/highlight_img.png'),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    //   crossAxisAlignment: CrossAxisAlignment.center,
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('2019/2020\nHighlights',
                                          style: TextStyle(
                                              color: Color(0xFFE8F667),
                                              fontSize: 18.0)),
                                      const SizedBox(width: 16),
                                      Container(
                                        height: 55,
                                        width: 55,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF707070),
                                          shape: BoxShape.circle,
                                        ),
                                        // color: Colors.black26,
                                        child: const Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 50.0,
                                          semanticLabel: 'Play',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.favorite,
                                color: AppColor.greyBorderColor, size: 20),
                            const SizedBox(width: 2),
                            Text(
                              '1.1k',
                              style: TextStyle(color: AppColor.greyBorderColor),
                            )
                          ],
                        ),
                        const SizedBox(width: 26),
                        Row(
                          children: [
                            Icon(Icons.comment,
                                color: AppColor.greyBorderColor, size: 20),
                            const SizedBox(width: 2),
                            Text('1.1k',
                                style:
                                    TextStyle(color: AppColor.greyBorderColor))
                          ],
                        ),
                        const SizedBox(width: 26),
                        Row(
                          children: [
                            Icon(Icons.star,
                                color: AppColor.greyBorderColor, size: 20),
                            const SizedBox(width: 2),
                            Text('1.1k',
                                style:
                                    TextStyle(color: AppColor.greyBorderColor))
                          ],
                        ),
                        // SizedBox(width: 16),
                        const Spacer(),
                        Icon(Icons.share,
                            color: AppColor.greyBorderColor, size: 20),
                      ],
                    )
                  ],
                ),
              ),
                  Positioned(
                    top: -50,
                    left: -20,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.70,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xFF111111),
                         // color: Colors.blue,
                        boxShadow: const [
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
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/drawer_img.png'),
                            radius: 18,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                //  mainAxisAlignment: MainAxisAlignment.center,
                                 // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'John Doe ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '- ',
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
                                //  SizedBox(height: 4),
                                const Text(
                                  'We made it to the playoffs!!',
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
            ]),
            const SizedBox(height: 26),
            SizedBox(
              width: 125,
              height: 40,
              child: ElevatedButton(
                child: const Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const CTP6_6()));
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColor.goldenColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => CTP_7()));
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF2A2A2A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
