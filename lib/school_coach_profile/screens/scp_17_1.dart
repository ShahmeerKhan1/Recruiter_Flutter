import 'package:flutter/material.dart';
import 'package:recruiter_flutter/model/new_message_model.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/scp_18_1.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class SCP17_1 extends StatefulWidget {
  const SCP17_1({Key? key}) : super(key: key);

  @override
  _SCP17_1State createState() => _SCP17_1State();
}

class _SCP17_1State extends State<SCP17_1> {
  TextEditingController search = TextEditingController();

  List<NewMessagesModel> _list = [
    NewMessagesModel(
        profileImg: 'assets/drawer_img.png',
        name: 'John Doe',
        type: 'Coach',
        at: '@jdoe',
        circle: Container(),
        isSelected: false),
    NewMessagesModel(
        profileImg: 'assets/drawer_img.png',
        name: 'John Doe',
        type: 'Coach',
        at: '@jdoe',
        circle: Container(),
        isSelected: false),
    NewMessagesModel(
        profileImg: 'assets/drawer_img.png',
        name: 'John Doe',
        type: 'Coach',
        at: '@jdoe',
        circle: Container(),
        isSelected: false),
    NewMessagesModel(
        profileImg: 'assets/drawer_img.png',
        name: 'John Doe',
        type: 'Coach',
        at: '@jdoe',
        circle: Container(),
        isSelected: false),
    NewMessagesModel(
        profileImg: 'assets/drawer_img.png',
        name: 'John Doe',
        type: 'Coach',
        at: '@jdoe',
        circle: Container(),
        isSelected: false),
    NewMessagesModel(
        profileImg: 'assets/drawer_img.png',
        name: 'John Doe',
        type: 'Coach',
        at: '@jdoe',
        circle: Container(),
        isSelected: false),
    NewMessagesModel(
        profileImg: 'assets/drawer_img.png',
        name: 'John Doe',
        type: 'Coach',
        at: '@jdoe',
        circle: Container(),
        isSelected: false),
    NewMessagesModel(
        profileImg: 'assets/drawer_img.png',
        name: 'John Doe',
        type: 'Coach',
        at: '@jdoe',
        circle: Container(),
        isSelected: false),
    NewMessagesModel(
        profileImg: 'assets/drawer_img.png',
        name: 'John Doe',
        type: 'Coach',
        at: '@jdoe',
        circle: Container(),
        isSelected: false),
    NewMessagesModel(
        profileImg: 'assets/drawer_img.png',
        name: 'John Doe',
        type: 'Coach',
        at: '@jdoe',
        circle: Container(),
        isSelected: false),
    NewMessagesModel(
        profileImg: 'assets/drawer_img.png',
        name: 'John Doe',
        type: 'Coach',
        at: '@jdoe',
        circle: Container(),
        isSelected: false),
    NewMessagesModel(
        profileImg: 'assets/drawer_img.png',
        name: 'John Doe',
        type: 'Coach',
        at: '@jdoe',
        circle: Container(),
        isSelected: false),
  ];

 // bool isSelected = false;

  int? _selectedIndex;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('New Message', Icons.notifications),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: TextField(
                  controller: search,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16.0),
                    filled: true,
                    fillColor: Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Search for people",
                    labelStyle: TextStyle(color: Color(0xFF686868)),
                    suffixIcon: Icon(Icons.search, color: Color(0xFF686868)),
                    //  prefixIcon: Icon(Icons.people),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 8.0, left: 8.0, right: 8.0, top: 4.0),
              child: ListView.builder(
                  itemCount: _list.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.only(bottom: 8.0),
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        print('click');
                        setState(() {
                           _onSelected(index);
                        //  _list[index].isSelected = !_list[index].isSelected;
                        });
                        Future.delayed(Duration(seconds: 2), () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => SCP18_1()));
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                        margin: EdgeInsets.only(bottom: 12.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF111111),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage(_list[index].profileImg),
                              radius: 24,
                            ),
                            SizedBox(width: 12),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(_list[index].name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(width: 16),
                                    Container(
                                      height: 26,
                                      width: 66,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(
                                            color: AppColor.goldenColor,
                                            width: 2.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                      ),
                                      child: Text(_list[index].type,
                                          style: TextStyle(
                                              color: AppColor.goldenColor,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ),
                             //   SizedBox(height: 6),
                                Text(_list[index].at,
                                    style: TextStyle(
                                        color: Color(0xFF686868), fontSize: 14.0))
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                _selectedIndex != null && _selectedIndex == index
                                    ? Container(
                                        width: 22,
                                        height: 22,
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.check,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                        decoration: ShapeDecoration(
                                            color: AppColor.goldenColor,
                                            shape: CircleBorder(
                                                // side: BorderSide(
                                                //     width: 2,
                                                //     color: Color(0xFF686868)
                                                // )
                                                )))
                                    : Container(
                                        width: 22,
                                        height: 22,
                                        decoration: ShapeDecoration(
                                            //  color: Colors.white,
                                            shape: CircleBorder(
                                                side: BorderSide(
                                                    width: 2,
                                                    color: Color(0xFF686868)))))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}