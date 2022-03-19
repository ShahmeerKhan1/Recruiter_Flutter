import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';

import 'scp_2.dart';
import 'scp_3.dart';

class SCP1 extends StatelessWidget {
  const SCP1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
            alignment: FractionalOffset.center,
            child: Image.asset('assets/logo.png')),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            // color: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 185,
                  height: 45,
                  child: ElevatedButton(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SCP2()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.goldenColor,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'New To Recruitr?',
                  style: TextStyle(fontSize: 12.0, color: AppColor.goldenColor),
                ),
                SizedBox(height: 2),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SCP3()));
                  },
                  child: Ink(
                  //  color: Colors.white70,
                    child: Text('Create New Account',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: AppColor.goldenColor,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    )
        );
  }
}
