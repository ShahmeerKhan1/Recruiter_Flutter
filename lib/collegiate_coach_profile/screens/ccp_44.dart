import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_app_bar.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_drawer.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP_44 extends StatefulWidget {
  const CCP_44({Key? key}) : super(key: key);

  @override
  _CCP_44State createState() => _CCP_44State();
}

class _CCP_44State extends State<CCP_44> {
  TextEditingController search = TextEditingController();
  TextEditingController filter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ccpAppBar('Transfer Portal', Icons.notifications, context),
      drawer: ccp_drawer(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                      controller: search,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: const Color(0xFF111111),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Filter",
                        labelStyle: const TextStyle(color: Color(0xFF686868)),
                        suffixIcon: Image.asset('assets/filter.png',
                            color: const Color(0xFF686868)),
                        //  prefixIcon: Icon(Icons.people),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: TextField(
                      controller: search,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: const Color(0xFF111111),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Search",
                        labelStyle: const TextStyle(color: Color(0xFF686868)),
                        suffixIcon:
                        const Icon(Icons.search, color: Color(0xFF686868)),
                        //  prefixIcon: Icon(Icons.people),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Divider(
                height: 0,
                color: Color(0xFF686868),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.14,
                      width: MediaQuery.of(context).size.width,
                      margin:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12.0),
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        color: Color(0xFF111111),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/drawer_img.png'),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('John Doe',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0)),
                              const SizedBox(height: 2),
                              const Text(
                                '6-3 / 200',
                                style: TextStyle(
                                    color: Color(0xFFFFEE00),
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    itemSize: 18,
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    unratedColor: const Color(0xFF686868),
                                    itemPadding: const EdgeInsets.only(right: 2.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Color(0xFFFFEE00),
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '0.801 (T)',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.0),
                                  )
                                ],
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    itemSize: 18,
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    unratedColor: const Color(0xFF686868),
                                    itemPadding: const EdgeInsets.only(right: 2.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Color(0xFFFFEE00),
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '0.801 (T)',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.0),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 28,
                                width: 46,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFBABABA),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: const Text(
                                  'RB',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                height: 52,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/ohio_small.png',
                                        // height: 50,
                                        width: 40,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const Icon(Icons.arrow_forward_ios,
                                        color: Colors.grey, size: 20),
                                    Expanded(
                                      child: Image.asset('assets/iowa_small.png',
                                        width: 40,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
