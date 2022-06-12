import 'package:flutter/material.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_42.dart';

AppBar scpAppBar(String title, IconData icon, BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    title: Text(title, style: const TextStyle(color: Colors.white)),
    centerTitle: true,
    actions: [
      InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_42()));
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    ],
    bottom: PreferredSize(
        child: Container(
          color: const Color(0xFF474747),
          height: 4.0,
        ),
        preferredSize: const Size.fromHeight(4.0)),
  );
}