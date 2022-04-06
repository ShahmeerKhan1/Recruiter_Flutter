import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_6_5.dart';
import 'package:recruiter_flutter/util/colors.dart';

class CTP6_4 extends StatelessWidget {
  const CTP6_4({Key? key}) : super(key: key);

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
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width,
            //   color: Colors.blue,
            ),
            Text(
              'Congratulation On\nCreating Your Account!',
              style: TextStyle(color: Colors.white, fontSize: 26.0),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.16,
              width: MediaQuery.of(context).size.width,
              //  color: Colors.orange,
            ),
            Text("Check Recruitr's\nBest Features", style: TextStyle(color: Colors.white, fontSize: 26.0)),
            SizedBox(height: 26),
            Container(
              width: 125,
              height: 45,
              child: ElevatedButton(
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CTP6_5()));
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColor.goldenColor,
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: 100,
              height: 45,
              child: ElevatedButton(
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                  //  Navigator.push(context, MaterialPageRoute(builder: (_) => CTP6_1()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF2A2A2A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
