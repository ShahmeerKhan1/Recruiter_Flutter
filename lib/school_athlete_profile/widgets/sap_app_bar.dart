import 'package:flutter/material.dart';

AppBar sapAppBar(String title, IconData icon, BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    title: Text(title, style: TextStyle(color: Colors.white)),
    centerTitle: true,
    actions: [
      InkWell(
        onTap: () {
         // Navigator.push(context, MaterialPageRoute(builder: (_) => CTP_44_1()));
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    ],
    bottom: PreferredSize(
        child: Container(
          color: Color(0xFF474747),
          height: 4.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
  );
}