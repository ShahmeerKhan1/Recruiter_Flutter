import 'package:flutter/material.dart';
import 'package:recruiter_flutter/model/messages_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP_16 extends StatelessWidget {
  CCP_16({Key? key}) : super(key: key);

  TextEditingController search = TextEditingController();

  List<MessagesModel> _list = [
    MessagesModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      msg: 'Hi just saw your event.\nLet me know if I can help with anything.',
      time: '1m',
      info: Icons.more_horiz,
      star: Icons.star,
      isSelected: false,
    ),

    MessagesModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      msg: 'Hi just saw your event.\nLet me know if I can help with anything.',
      time: '1m',
      info: Icons.more_horiz,
      star: Icons.star,
      isSelected: false,
    ),

    MessagesModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Athelete',
      msg: 'Hi just saw your event.\nLet me know if I can help with anything.',
      time: '1m',
      info: Icons.more_horiz,
      star: Icons.star,
      isSelected: false,
    ),

    MessagesModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Media',
      msg: 'Hi just saw your event.\nLet me know if I can help with anything.',
      time: '1m',
      info: Icons.more_horiz,
      star: Icons.star,
      isSelected: false,
    ),

    MessagesModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Athlete',
      msg: 'Hi just saw your event.\nLet me know if I can help with anything.',
      time: '1m',
      info: Icons.more_horiz,
      star: Icons.star,
      isSelected: false,
    ),
    MessagesModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      msg: 'Hi just saw your event.\nLet me know if I can help with anything.',
      time: '1m',
      info: Icons.more_horiz,
      star: Icons.star,
      isSelected: false,
    ),

    MessagesModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Media',
      msg: 'Hi just saw your event.\nLet me know if I can help with anything.',
      time: '1m',
      info: Icons.more_horiz,
      star: Icons.star,
      isSelected: false,
    ),

    MessagesModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Media',
      msg: 'Hi just saw your event.\nLet me know if I can help with anything.',
      time: '1m',
      info: Icons.more_horiz,
      star: Icons.star,
      isSelected: false,
    ),

    MessagesModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Media',
      msg: 'Hi just saw your event.\nLet me know if I can help with anything.',
      time: '1m',
      info: Icons.more_horiz,
      star: Icons.star,
      isSelected: false,
    ),

    MessagesModel(
      profileImg: 'assets/drawer_img.png',
      name: 'John Doe',
      type: 'Coach',
      msg: 'Hi just saw your event.\nLet me know if I can help with anything.',
      time: '1m',
      info: Icons.more_horiz,
      star: Icons.star,
      isSelected: false,
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
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
                SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: TextField(
                      controller: search,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16.0),
                        filled: true,
                        fillColor: Color(0xFF111111),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Filter",
                        labelStyle: TextStyle(color: Color(0xFF686868)),
                        suffixIcon:
                        Icon(Icons.art_track, color: Color(0xFF686868)),
                        //  prefixIcon: Icon(Icons.people),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0, top: 4.0),
            child: ListView.builder(
                itemCount: _list.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.only(bottom: 8.0),
                itemBuilder: (BuildContext context, index){
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
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
                          backgroundImage: AssetImage(_list[index].profileImg),
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
                                Text(_list[index].name, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w500)),
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
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: Text(_list[index].type,
                                      style: TextStyle(
                                          color:  AppColor.goldenColor,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text(_list[index].msg, style: TextStyle(color: Colors.white, fontSize: 12.0))
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(_list[index].info, color: Color(0xFF686868)),
                                Icon(_list[index].star, color: AppColor.goldenColor),
                                SizedBox(height: 4),
                                Text(_list[index].time, style: TextStyle(color: Color(0xFF686868))),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}