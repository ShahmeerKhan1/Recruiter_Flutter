import 'package:flutter/material.dart';
import 'package:recruiter_flutter/common/choose_profile.dart';
import 'package:recruiter_flutter/util/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
             // color: Colors.blue,
            ),
            const Text(
              'Welcome To Recruitr\nYou Are 3 Steps\nAway From Using Our\nAwesome App',
              style: TextStyle(color: Colors.white, fontSize: 26.0),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
            //  color: Colors.blue,
            ),
            SizedBox(
              width: 150,
              height: 45,
              child: ElevatedButton(
                child: const Text(
                  "Let's Go",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ChooseProfile()));
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
