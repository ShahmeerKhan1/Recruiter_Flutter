import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/textfield_input_border.dart';

import 'scp24_1.dart';

class SCP23_5 extends StatelessWidget {
  SCP23_5({Key? key}) : super(key: key);

  TextEditingController _filter = TextEditingController();
  TextEditingController _new = TextEditingController();
  TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Prospects', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: PreferredSize(
              child: Container(
                color: Color(0xFF474747),
                height: 4.0,
              ),
              preferredSize: Size.fromHeight(4.0))),
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
                          //  contentPadding: EdgeInsets.only(left: 16.0),
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
                          //  contentPadding: EdgeInsets.only(left: 16.0),
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
                          //  contentPadding: EdgeInsets.only(left: 16.0),
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
                                Navigator.push(context, MaterialPageRoute(builder: (_) => SCP24_1()));
                              },
                                child: _2023(context));
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
                                Navigator.push(context, MaterialPageRoute(builder: (_) => SCP24_1()));
                              },
                                child: _2023(context)
                            );
                          }),
                    ],
                  ),
                ),
              ],
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
                  'RE',
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
