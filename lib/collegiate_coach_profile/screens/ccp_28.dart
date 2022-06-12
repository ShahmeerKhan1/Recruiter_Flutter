import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';

class CCP_28 extends StatefulWidget {
  const CCP_28({Key? key}) : super(key: key);

  @override
  _CCP_28State createState() => _CCP_28State();
}

class _CCP_28State extends State<CCP_28> {
  bool mute = false;
  bool block = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('John Doe', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        bottom: PreferredSize(
            child: Container(
              color: const Color(0xFF474747),
              height: 4.0,
            ),
            preferredSize: const Size.fromHeight(4.0)),
      ),
      // customAppBar('John Doe', Icons.info_outline),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            //  color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/drawer_img.png'),
                  radius: 40.0,
                ),
                SizedBox(height: 16),
                Text(
                  'John Doe',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 2),
                Text('@jdoe', style: TextStyle(color: Color(0xFF686868), fontSize: 14.0),)
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            //  color: Colors.orange,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Mute Conversation', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                    const Spacer(),
                    Switch(
                      activeTrackColor: AppColor.lightBlackColor,
                      activeColor: AppColor.goldenColor,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: AppColor.greyBorderColor,
                      value: mute,
                      onChanged: (value) {
                        setState(() {
                          mute = value;
                          print(mute);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Block User', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                    const Spacer(),
                    Switch(
                      activeTrackColor: AppColor.lightBlackColor,
                      activeColor: AppColor.goldenColor,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: AppColor.greyBorderColor,
                      value: block,
                      onChanged: (value) {
                        setState(() {
                          block = value;
                          print(block);
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.26,
            width: MediaQuery.of(context).size.width,
            // color: Colors.green,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Delete Conversation', style: TextStyle(color: Color(0xFFCF1414), fontSize: 16.0)),
                SizedBox(height: 12),
                Text('Report User', style: TextStyle(color: Color(0xFF686868), fontSize: 16.0)),
              ],
            ),
          )
        ],
      ),
    );
  }
}