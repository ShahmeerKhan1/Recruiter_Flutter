import 'package:flutter/material.dart';
import 'package:recruiter_flutter/school_athlete_profile/screens/sap_44.dart';

AppBar sapAppBar(String title, IconData icon, BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    title: Text(title, style: const TextStyle(color: Colors.white)),
    centerTitle: true,
    actions: [
      InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => SAP_44()));
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