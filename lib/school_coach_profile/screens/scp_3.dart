import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/textfield_input_border.dart';
import 'package:recruiter_flutter/util/colors.dart';

import 'scp_2.dart';
import 'scp_5.dart';

class SCP3 extends StatefulWidget {
  const SCP3({Key? key}) : super(key: key);

  @override
  _SCP3State createState() => _SCP3State();
}

class _SCP3State extends State<SCP3> {
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
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
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
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                // color: Colors.blue,
              ),
              Text(
                'General Information',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0),
              ),
              SizedBox(height: 16),
              TextField(
                  controller: firstName,
                  style: TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "First Name",
                    labelStyle: TextStyle(color: Color(0xFFBABABA)),
                    //  prefixIcon: Icon(Icons.people),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              Container(height: 12),
              TextField(
                  controller: lastName,
                  style: TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    // prefixIcon: Icon(Icons.lock),
                    labelText: "Last Name",
                    labelStyle: TextStyle(color: Color(0xFFBABABA)),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              Container(height: 12),
              TextField(
                  controller: phoneNum,
                  style: TextStyle(
                      color: Colors.white
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    // prefixIcon: Icon(Icons.lock),
                    labelText: "Phone Number (Optional)",
                    labelStyle: TextStyle(color: Color(0xFFBABABA)),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              Container(height: 12),
              TextField(
                  controller: email,
                  style: TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    // prefixIcon: Icon(Icons.lock),
                    labelText: "Email Address",
                    labelStyle: TextStyle(color: Color(0xFFBABABA)),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              SizedBox(height: 30),
              Text(
                'Password',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0),
              ),
              SizedBox(height: 16),
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
                    labelText: "Password",
                    labelStyle: TextStyle(color: Color(0xFFBABABA)),
                    //  prefixIcon: Icon(Icons.people),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              Container(height: 12),
              TextField(
                  controller: confirmPassword,
                  style: TextStyle(
                      color: Colors.white
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    // prefixIcon: Icon(Icons.lock),
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(color: Color(0xFFBABABA)),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              SizedBox(height: 12),
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
                child: Container(
                  width: 185,
                  height: 45,
                  child: ElevatedButton(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SCP5()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.goldenColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 26),
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have An Account?',
                    style: TextStyle(fontSize: 14.0, color: AppColor.goldenColor),
                  ),
                  SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SCP2()));
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
