import 'package:flutter/material.dart';

AppBar customAppBar(String title, IconData icon) {
  return AppBar(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    title: Text(title, style: TextStyle(color: Colors.white)),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(icon, color: Colors.white),
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