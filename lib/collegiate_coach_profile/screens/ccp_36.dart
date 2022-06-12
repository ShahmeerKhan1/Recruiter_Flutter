import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp36_2.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_offer_detail.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_drawer.dart';
import 'package:recruiter_flutter/controller/new_offer.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP36_1 extends StatefulWidget {
  const CCP36_1({Key? key}) : super(key: key);

  @override
  _CCP36State createState() => _CCP36State();
}

class _CCP36State extends State<CCP36_1> with SingleTickerProviderStateMixin {

  late TabController _controller;

  int _selectedIndex = 0; //  Tab Bar Index

  List<Widget> list = [
    const Tab(text: 'Offer Sent'),
    const Tab(text: 'Committed'),
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

    Get.put(OfferController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ccp_drawer(context),
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Recruiting', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.notifications, color: Colors.white),
            )
          ],
          bottom: TabBar(
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            labelColor: Colors.white,
            unselectedLabelStyle: TextStyle(color: AppColor.greyBorderColor),
            indicatorColor: Colors.white,
            onTap: (index) {
              print('Tab $index is tapped');
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
          )
      ),
      body: TabBarView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          OfferSent(),
          Committed()
          //  Team(),
          //  Offered()// custom hightlight widget
          // Container(
          //   color: Colors.green,
          // )
        ],
      ),
    );
  }
}

class OfferSent extends StatelessWidget {
  OfferSent({Key? key}) : super(key: key);

  final TextEditingController _new = TextEditingController();
  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const CCP36_2()));
                      },
                      child: Container(
                        height: 46,
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        decoration: BoxDecoration(
                            color: const Color(0xFF111111),
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(color: AppColor.borderColor, width: 2)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('New', style: TextStyle(color: Color(0xFF686868)),),
                            Icon(Icons.add, color: Color(0xFF686868))
                          ],
                        ),
                      ),
                    ),
                    // child: TextField(
                    //     controller: _new,
                    //     style: TextStyle(color: Colors.white),
                    //     decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.only(left: 12.0),
                    //       filled: true,
                    //       fillColor: Color(0xFF111111),
                    //       floatingLabelBehavior: FloatingLabelBehavior.never,
                    //       labelText: "New",
                    //       labelStyle: TextStyle(color: Color(0xFF686868)),
                    //       suffixIcon: Icon(Icons.add, color: Color(0xFF686868)),
                    //       //  prefixIcon: Icon(Icons.people),
                    //       border: myinputborder(),
                    //       enabledBorder: myinputborder(),
                    //       focusedBorder: myfocusborder(),
                    //     )),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    flex: 2,
                    child: TextField(
                        controller: _search,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 12.0),
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: GetBuilder<OfferController>(
                builder: (_const) {
                  if(_const.offerList.isNotEmpty) {
                    return ListView.builder(
                      //  primary: false,
                        itemCount: _const.offerList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_Offer_Detail(data: _const.offerList[index])));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.18,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
                              margin: const EdgeInsets.only(top: 16.0, bottom: 6.0),
                              decoration: const BoxDecoration(
                                color: Color(0xFF111111),
                                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 180,
                                      width: 140,
                                      child: _const.offerList[index].img != null ?
                                      Image.file(_const.offerList[index].img!,
                                          fit: BoxFit.cover): Container(),),
                                  const SizedBox(width: 6),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _const.offerList[index].uniName,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.0),
                                        ),
                                        const SizedBox(height: 4),
                                        SizedBox(
                                          width: 160,
                                          // color: Colors.blue,
                                          // height: MediaQuery.of(context).size.height,
                                          child: Text(
                                            'to: ${_const.offerList[index].athleteName}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0,
                                                color: Color(0xFFFFEE00)),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          _const.offerList[index].date,
                                          style: TextStyle(
                                              color: AppColor.greyBorderColor),
                                        ),
                                        const Spacer(),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 6.0),
                                          child: Text(
                                            'Full\nScholarship',
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: Icon(Icons.more_horiz,
                                            color: AppColor.textGreyColor)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  else {
                    return Padding(
                      padding: const EdgeInsets.only(top: 26.0),
                      child: Center(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              "You Didn't Send\nAny Offers Yet", style: TextStyle(color: Colors.white, fontSize: 22.0)),
                          const SizedBox(height: 16),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const CCP36_2()));
                            },
                              child: const Text('Create Your First Offer', style: TextStyle(color: Color(0xFFFFEE00),
                                  fontSize: 22.0, decoration: TextDecoration.underline, fontWeight: FontWeight.w500)))
                        ],
                      ),),
                    );
                  }
                }
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _2023(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        color: Color(0xFF111111),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(backgroundImage: AssetImage('assets/drawer_img.png')),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('John Doe',
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
                Padding(
                  padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                  child: Text(
                    'Bufford High School',
                    style: TextStyle(
                        color: Color(0xFF686868), fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  'GPA: 4.0',
                  style: TextStyle(
                      color: Color(0xFF686868), fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                height: 30,
                width: 44,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFFBABABA),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: const Text(
                  'RB',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Committed extends StatelessWidget {
  Committed({Key? key}) : super(key: key);

 // TextEditingController _filter = TextEditingController();
  final TextEditingController _new = TextEditingController();
  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Expanded(
                  //   flex: 1,
                  //   child: TextField(
                  //       controller: _filter,
                  //       style: TextStyle(color: Colors.white),
                  //       decoration: InputDecoration(
                  //         contentPadding: EdgeInsets.only(left: 2.0),
                  //         filled: true,
                  //         fillColor: Color(0xFF111111),
                  //         floatingLabelBehavior: FloatingLabelBehavior.never,
                  //         labelText: "Filter",
                  //         labelStyle: TextStyle(color: Color(0xFF686868)),
                  //         suffixIcon:
                  //         Icon(Icons.art_track, color: Color(0xFF686868)),
                  //         //  prefixIcon: Icon(Icons.people),
                  //         border: myinputborder(),
                  //         enabledBorder: myinputborder(),
                  //         focusedBorder: myfocusborder(),
                  //       )),
                  // ),
                //  SizedBox(width: 4),
                  Expanded(
                    flex: 1,
                    child: TextField(
                        controller: _new,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 8.0),
                          filled: true,
                          fillColor: const Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "New",
                          labelStyle: const TextStyle(color: Color(0xFF686868)),
                          suffixIcon: const Icon(Icons.add, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    flex: 2,
                    child: TextField(
                        controller: _search,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 12.0),
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
            ),
         //   Divider(height: 0, color: Colors.white),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       left: 6.0, right: 16.0, bottom: 12.0),
                      //   child: Text(
                      //     '2023',
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 16.0,
                      //         fontWeight: FontWeight.w500),
                      //   ),
                      // ),
                      ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                                onTap: () {
                                  //    Navigator.push(context, MaterialPageRoute(builder: (_) => SCP24_1()));
                                },
                                child: _2023(context)
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
            // Divider(color: Colors.white),
            // Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(16.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         // mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(
            //                 left: 6.0, right: 16.0, bottom: 12.0),
            //             child: Text(
            //               '2022',
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 16.0,
            //                   fontWeight: FontWeight.w500),
            //             ),
            //           ),
            //           ListView.builder(
            //               itemCount: 2,
            //               shrinkWrap: true,
            //               physics: NeverScrollableScrollPhysics(),
            //               itemBuilder: (BuildContext context, index) {
            //                 return InkWell(
            //                     onTap: () {
            //                       //   Navigator.push(context, MaterialPageRoute(builder: (_) => SCP24_1()));
            //                     },
            //                     child: _2023(context)
            //                 );
            //               }),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 44,
            //   margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16, top: 16),
            //   child: ElevatedButton(
            //     child: Text(
            //       'Share List',
            //       style: TextStyle(color: Colors.black, fontSize: 16.0),
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //           context, MaterialPageRoute(builder: (_) => SCP41_1()));
            //     },
            //     style: ElevatedButton.styleFrom(
            //       primary: Color(0xFFBABABA),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _2023(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        color: Color(0xFF111111),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/drawer_img.png'),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('John Doe',
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
                Padding(
                  padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                  child: Text(
                    '8/8/2020',
                    style: TextStyle(
                        color: Color(0xFF686868), fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  'Full\nScholarship',
                  style: TextStyle(
                      color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.more_horiz, color: Color(0xFFBABABA),),
                  const Spacer(),
                  // Container(
                  //   height: 30,
                  //   width: 44,
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //     color: Color(0xFFBABABA),
                  //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  //   ),
                  //   child: Text(
                  //     'RB',
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
                //  SizedBox(height: 6),
                  Container(
                    height: 30,
                    width: 78,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFF239B36),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: const Text(
                      'Committed',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

