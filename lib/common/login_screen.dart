import 'package:flutter/cupertino.dart';
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
           padding: EdgeInsets.symmetric(horizontal: 16),
          //  color: Colors.orange,
          //  alignment: Alignment.center,
            child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    controller: email,
                    style: TextStyle(
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF111111),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "Username",
                      labelStyle: TextStyle(color: Color(0xFFBABABA)),
                    //  prefixIcon: Icon(Icons.people),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                Container(height:12),
                TextField(
                    controller: password,
                    style: TextStyle(
                        color: Colors.white
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF111111),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                     // prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Color(0xFFBABABA)),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Forgot Password?', style: TextStyle(fontSize: 14.0, color: AppColor.goldenColor),),
                    SizedBox(width: 4),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => VerifyEmailScreen()));
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
                SizedBox(height: 26),
                Container(
                  width: 185,
                  height: 45,
                  child: ElevatedButton(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SuccessScreen()));
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
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New To Recruitr?', style: TextStyle(fontSize: 14.0, color: AppColor.goldenColor),),
                SizedBox(width: 4),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
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