import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';

class CTP6_6 extends StatelessWidget {
  const CTP6_6({Key? key}) : super(key: key);

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
            Text(
                'Update Your Atheletic\nProfile & Get Evaluation\nFrom Role Coaches',
                style: TextStyle(color: Colors.white, fontSize: 26.0)),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
            //  color: Colors.blue,
            ),
            Center(
                child: Image.asset('assets/shape.png')),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
            //  color: Colors.blue,
            ),
            Container(
              width: 125,
              height: 40,
              child: ElevatedButton(
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CTP6_6()));
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColor.goldenColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 100,
              height: 40,
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
