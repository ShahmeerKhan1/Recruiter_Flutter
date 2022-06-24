import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_44_1.dart';

class CTPAppBar extends StatefulWidget {
  String title;
  IconData icon;
  bool isPressed;
  CTPAppBar({Key? key, required this.title, required this.icon, required this.isPressed}) : super(key: key);

  @override
  _CTPAppBarState createState() => _CTPAppBarState();
}

class _CTPAppBarState extends State<CTPAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () {
            setState(() {
              widget.isPressed = !widget.isPressed;
            });
            Navigator.push(context, MaterialPageRoute(builder: (_) => CTP_44_1()));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(widget.icon, color: Colors.white),
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
}

AppBar ctpAppBar(String title, IconData icon, BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    title: Text(title, style: const TextStyle(color: Colors.white)),
    centerTitle: true,
    actions: [
      InkWell(
        onTap: () {

          Navigator.push(context, MaterialPageRoute(builder: (_) => CTP_44_1()));
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