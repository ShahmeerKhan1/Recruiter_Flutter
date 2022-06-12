import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_6_7.dart';
import 'package:recruiter_flutter/util/colors.dart';

import 'sap_6_7.dart';

class SAP6_6 extends StatelessWidget {
  const SAP6_6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 26.0, right: 26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Update Your Atheletic\nProfile & Get Evaluation\nFrom Role Coaches',
                style: TextStyle(color: Colors.white, fontSize: 26.0)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
            //  color: Colors.blue,
            ),
            Center(
                child: Image.asset('assets/shape.png')),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
            //  color: Colors.blue,
            ),
            SizedBox(
              width: 125,
              height: 40,
              child: ElevatedButton(
                child: const Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SAP6_7()));
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColor.goldenColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const CTP6_7()));
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
