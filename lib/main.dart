import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_6_7.dart';
import 'package:recruiter_flutter/common/start_screen.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.bgColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(

          primary:  Colors.black,
          secondary: Colors.black,

          // or from RGB
          //
          // primary: const Color(0xFF343A40),
          // secondary: const Color(0xFFFFC107),

        ),
       // primarySwatch: Colors.black,
     //   colorScheme: ColorScheme.light(primary: const Color(0xFF111111)),
      //  buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      ),
    // home: SCP1(),
     // home: CTP1(),
      home: StartScreen()
    //  home: CTP6_7(),
    );
  }
}