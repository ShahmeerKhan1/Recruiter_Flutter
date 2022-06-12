import 'package:flutter/material.dart';
import 'package:recruiter_flutter/common/success_screen.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';
import 'signup_screen.dart';
import 'verify_email_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.30,
           // color: Colors.blue,
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/logo.png'),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.50,
           padding: const EdgeInsets.symmetric(horizontal: 16),
          //  color: Colors.orange,
          //  alignment: Alignment.center,
            child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    controller: email,
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF111111),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "Username",
                      labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                    //  prefixIcon: Icon(Icons.people),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                Container(height:12),
                TextField(
                    controller: password,
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF111111),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                     // prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Forgot Password?', style: TextStyle(fontSize: 14.0, color: AppColor.goldenColor),),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const VerifyEmailScreen()));
                      },
                      child: Ink(
                        //  color: Colors.white70,
                        child: Text('Click Here',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: AppColor.goldenColor,
                              decoration: TextDecoration.underline,
                            )),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 26),
                SizedBox(
                  width: 185,
                  height: 45,
                  child: ElevatedButton(
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const SuccessScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.goldenColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
          //  color: Colors.green,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New To Recruitr?', style: TextStyle(fontSize: 14.0, color: AppColor.goldenColor),),
                const SizedBox(width: 4),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen()));
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
