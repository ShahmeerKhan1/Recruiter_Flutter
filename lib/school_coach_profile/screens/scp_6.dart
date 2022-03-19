import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';

import 'scp_6_1.dart';

class SCP6 extends StatelessWidget {
  const SCP6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
             // color: Colors.blue,
            ),
            Text(
              'Welcome To Recruitr\nYou Are 3 Steps\nAway From Using Our\nAwesome App',
              style: TextStyle(color: Colors.white, fontSize: 26.0),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
            //  color: Colors.blue,
            ),
            Container(
              width: 150,
              height: 45,
              child: ElevatedButton(
                child: Text(
                  "Let's Go",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SCP6_1()));
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
