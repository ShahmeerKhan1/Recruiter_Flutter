import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';
import 'success_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {

  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        title: const Text(
          'Verify Email Address',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please enter the code you\nreceived to verify\nyour email address',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              const SizedBox(height: 16),
              Text(
                'send to johndoe@email.com',
                style: TextStyle(
                    color: AppColor.yellowColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0),
              ),
              const SizedBox(height: 42),
              TextField(
                  controller: code,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    // prefixIcon: Icon(Icons.lock),
                    labelText: "Enter Code Here",
                    labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )
              ),
              const SizedBox(height: 30),
              Text("Didn't get it?", style: TextStyle(color: AppColor.goldenColor),),
              const SizedBox(height: 4),
              InkWell(
                onTap: () {

                },
                child: Ink(
                  //  color: Colors.white70,
                  child: Text('Click here to send a new code',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: AppColor.goldenColor,
                        decoration: TextDecoration.underline,
                      )),
                ),
              ),
              const SizedBox(height: 42),
              SizedBox(
                width: 225,
                height: 45,
                child: ElevatedButton(
                  child: const Text(
                    'Verify Email Address',
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
      ),
    );
  }
}
