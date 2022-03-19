import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';

import 'scp_6.dart';

class SCP5 extends StatefulWidget {
  const SCP5({Key? key}) : super(key: key);

  @override
  _SCP5State createState() => _SCP5State();
}

class _SCP5State extends State<SCP5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 125.0,
              height: 125.0,
              decoration: new BoxDecoration(
                color: AppColor.goldenColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 60),
            ),
            SizedBox(height: 26),
            Text(
              'Successful',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 6),
            Text('Your Email Was\nSuccessfully Verified',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.goldenColor),),
            SizedBox(height: 26),
            Container(
              width: 150,
              height: 45,
              child: ElevatedButton(
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SCP6()));
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColor.goldenColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
