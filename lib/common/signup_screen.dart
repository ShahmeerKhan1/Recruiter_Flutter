import 'package:flutter/material.dart';
import 'package:recruiter_flutter/common/login_screen.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';
import 'success_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
            child: Container(
              color: AppColor.goldenColor,
              height: 4.0,
            ),
            preferredSize: const Size.fromHeight(4.0)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                // color: Colors.blue,
              ),
              const Text(
                'General Information',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0),
              ),
              const SizedBox(height: 16),
              TextField(
                  controller: firstName,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "First Name",
                    labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                    //  prefixIcon: Icon(Icons.people),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              Container(height: 12),
              TextField(
                  controller: lastName,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    // prefixIcon: Icon(Icons.lock),
                    labelText: "Last Name",
                    labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              Container(height: 12),
              TextField(
                  controller: phoneNum,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    // prefixIcon: Icon(Icons.lock),
                    labelText: "Phone Number (Optional)",
                    labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              Container(height: 12),
              TextField(
                  controller: email,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    // prefixIcon: Icon(Icons.lock),
                    labelText: "Email Address",
                    labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              const SizedBox(height: 30),
              const Text(
                'Password',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0),
              ),
              const SizedBox(height: 16),
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
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                    //  prefixIcon: Icon(Icons.people),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              Container(height: 12),
              TextField(
                  controller: confirmPassword,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    // prefixIcon: Icon(Icons.lock),
                    labelText: "Confirm Password",
                    labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              const SizedBox(height: 12),
              Row(
               // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    activeColor: AppColor.goldenColor,
                    side: BorderSide(color: AppColor.goldenColor),
                    value: _checkbox,
                    onChanged: (value) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                  ),
                  Text(
                    'I Accept The ',
                    style: TextStyle(color: AppColor.goldenColor),
                  ),
                  Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      color: AppColor.goldenColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  width: 185,
                  height: 45,
                  child: ElevatedButton(
                    child: const Text(
                      'Sign Up',
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
              ),
              const SizedBox(height: 26),
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have An Account?',
                    style: TextStyle(fontSize: 14.0, color: AppColor.goldenColor),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                    },
                    child: Ink(
                      //  color: Colors.white70,
                      child: Text('Sign In',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: AppColor.goldenColor,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
