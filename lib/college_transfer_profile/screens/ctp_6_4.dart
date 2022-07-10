import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_6_5.dart';
import 'package:recruiter_flutter/util/colors.dart';

import 'ctp_7.dart';

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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width,
            //   color: Colors.blue,
            ),
            const Text(
              'Congratulation On\nCreating Your Account!',
              style: TextStyle(color: Colors.white, fontSize: 26.0),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
              width: MediaQuery.of(context).size.width,
              //  color: Colors.orange,
            ),
            const Text("Check Recruitr's\nBest Features", style: TextStyle(color: Colors.white, fontSize: 26.0)),
            const SizedBox(height: 26),
            SizedBox(
              width: 125,
              height: 45,
              child: ElevatedButton(
                child: const Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const CTP6_5()));
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColor.goldenColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 100,
              height: 45,
              child: ElevatedButton(
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => CTP_7()));
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF2A2A2A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
