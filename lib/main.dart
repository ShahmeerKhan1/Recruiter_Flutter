import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/scp_1.dart';
import 'package:recruiter_flutter/util/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.bgColor,
        primarySwatch: Colors.yellow,
      ),
      home: SCP1(),
    );
  }
}