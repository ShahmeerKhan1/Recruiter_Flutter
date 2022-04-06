import 'package:flutter/material.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/scp41_1.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class SCP36_1 extends StatefulWidget {
  const SCP36_1({Key? key}) : super(key: key);

  @override
  _SCP36_1State createState() => _SCP36_1State();
}

class _SCP36_1State extends State<SCP36_1> with SingleTickerProviderStateMixin {

  late TabController _controller;

  int _selectedIndex = 0; //  Tab Bar Index

  List<Widget> list = [
    Tab(text: 'Prospects'),
    Tab(text: 'Team'),
    Tab(text: 'Offered'),
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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Recruiting', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(Icons.notifications, color: Colors.white),
            )
          ],
          bottom: TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
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
        physics: NeverScrollableScrollPhysics(),
        children: [
          Prospects(),
        Team(),
        Offered()
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

class Prospects extends StatelessWidget {
  Prospects({Key? key}) : super(key: key);

  TextEditingController _filter = TextEditingController();
  TextEditingController _new = TextEditingController();
  TextEditingController _search = TextEditingController();

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
                    child: TextField(
                        controller: _filter,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 2.0),
                          filled: true,
                          fillColor: Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Filter",
                          labelStyle: TextStyle(color: Color(0xFF686868)),
                          suffixIcon:
                          Icon(Icons.art_track, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    flex: 1,
                    child: TextField(
                        controller: _new,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 4.0),
                          filled: true,
                          fillColor: Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "New",
                          labelStyle: TextStyle(color: Color(0xFF686868)),
                          suffixIcon: Icon(Icons.add, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                  SizedBox(width: 4),
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
                          suffixIcon:
                          Icon(Icons.search, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                ],
              ),
            ),
            Divider(height: 0, color: Colors.white),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 6.0, right: 16.0, bottom: 12.0),
                        child: Text(
                          '2023',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
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
            Divider(color: Colors.white),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 6.0, right: 16.0, bottom: 12.0),
                        child: Text(
                          '2022',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                                onTap: () {
                               //   Navigator.push(context, MaterialPageRoute(builder: (_) => SCP24_1()));
                                },
                                child: _2023(context)
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 44,
              margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16, top: 16),
              child: ElevatedButton(
                child: Text(
                  'Share List',
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SCP41_1()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFBABABA),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _2023(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Color(0xFF111111),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: AssetImage('assets/drawer_img.png')),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('John Doe',
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                height: 30,
                width: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFBABABA),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Text(
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

class Team extends StatelessWidget {
  Team({Key? key}) : super(key: key);

  TextEditingController _filter = TextEditingController();
  TextEditingController _new = TextEditingController();
  TextEditingController _search = TextEditingController();

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
                    child: TextField(
                        controller: _filter,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 2.0),
                          filled: true,
                          fillColor: Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Filter",
                          labelStyle: TextStyle(color: Color(0xFF686868)),
                          suffixIcon:
                          Icon(Icons.art_track, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    flex: 1,
                    child: TextField(
                        controller: _new,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 4.0),
                          filled: true,
                          fillColor: Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "New",
                          labelStyle: TextStyle(color: Color(0xFF686868)),
                          suffixIcon: Icon(Icons.add, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                  SizedBox(width: 4),
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
                          suffixIcon:
                          Icon(Icons.search, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                ],
              ),
            ),
            Divider(height: 0, color: Colors.white),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 6.0, right: 16.0, bottom: 12.0),
                        child: Text(
                          '2023',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
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
            Divider(color: Colors.white),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 6.0, right: 16.0, bottom: 12.0),
                        child: Text(
                          '2022',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                                onTap: () {
                                  //   Navigator.push(context, MaterialPageRoute(builder: (_) => SCP24_1()));
                                },
                                child: _2023(context)
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
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
            //       // Navigator.push(
            //       //     context, MaterialPageRoute(builder: (_) => SCP23_3()));
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
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Color(0xFF111111),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: AssetImage('assets/drawer_img.png')),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('John Doe',
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                height: 30,
                width: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFBABABA),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Text(
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

class Offered extends StatelessWidget {
  Offered({Key? key}) : super(key: key);

  TextEditingController _filter = TextEditingController();
  TextEditingController _new = TextEditingController();
  TextEditingController _search = TextEditingController();

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
                    child: TextField(
                        controller: _filter,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 2.0),
                          filled: true,
                          fillColor: Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Filter",
                          labelStyle: TextStyle(color: Color(0xFF686868)),
                          suffixIcon:
                          Icon(Icons.art_track, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    flex: 1,
                    child: TextField(
                        controller: _new,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 4.0),
                          filled: true,
                          fillColor: Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "New",
                          labelStyle: TextStyle(color: Color(0xFF686868)),
                          suffixIcon: Icon(Icons.add, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                  SizedBox(width: 4),
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
                          suffixIcon:
                          Icon(Icons.search, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                ],
              ),
            ),
            Divider(height: 0, color: Colors.white),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 6.0, right: 16.0, bottom: 12.0),
                        child: Text(
                          '2023',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
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
            Divider(color: Colors.white),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 6.0, right: 16.0, bottom: 12.0),
                        child: Text(
                          '2022',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                                onTap: () {
                                  //   Navigator.push(context, MaterialPageRoute(builder: (_) => SCP24_1()));
                                },
                                child: _2023(context)
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
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
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Color(0xFF111111),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: AssetImage('assets/drawer_img.png')),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('John Doe',
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                height: 30,
                width: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFBABABA),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Text(
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



