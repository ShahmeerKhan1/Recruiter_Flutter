import 'package:flutter/material.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_19.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_42.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_app_bar.dart';
import 'package:recruiter_flutter/model/new_message_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP_17 extends StatefulWidget {
  const CCP_17({Key? key}) : super(key: key);

  @override
  _CCP_17State createState() => _CCP_17State();
}

class _CCP_17State extends State<CCP_17> {
  TextEditingController search = TextEditingController();

  final List<NewMessagesModel> _list = [
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

  bool _notification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Message', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: () {
                  setState(() {
                    _notification = true;
                  });
                  print('noti');
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_42()));
                },
                child: _notification ?  Icon(Icons.notifications, color: Colors.white)
                    : Icon(Icons.notifications_none)
            ),
          ),
        ],
        bottom: PreferredSize(
            child: Container(
              color: const Color(0xFF474747),
              height: 4.0,
            ),
            preferredSize: const Size.fromHeight(4.0)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: TextField(
                  controller: search,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 16.0),
                    filled: true,
                    fillColor: const Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Search for people",
                    labelStyle: const TextStyle(color: Color(0xFF686868)),
                    suffixIcon: const Icon(Icons.search, color: Color(0xFF686868)),
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
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.only(bottom: 8.0),
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        print('click');
                        setState(() {
                          _onSelected(index);
                          //  _list[index].isSelected = !_list[index].isSelected;
                        });
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_19(data: _list[index].name)));
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                        margin: const EdgeInsets.only(bottom: 12.0),
                        decoration: const BoxDecoration(
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
                            const SizedBox(width: 12),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(_list[index].name,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(width: 16),
                                    Container(
                                      height: 26,
                                      width: 66,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(
                                            color: AppColor.goldenColor,
                                            width: 2.0),
                                        borderRadius: const BorderRadius.all(
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
                                    style: const TextStyle(
                                        color: Color(0xFF686868), fontSize: 14.0))
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                _selectedIndex != null && _selectedIndex == index
                                    ? Container(
                                    width: 22,
                                    height: 22,
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.check,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                    decoration: ShapeDecoration(
                                        color: AppColor.goldenColor,
                                        shape: const CircleBorder(
                                          // side: BorderSide(
                                          //     width: 2,
                                          //     color: Color(0xFF686868)
                                          // )
                                        )))
                                    : Container(
                                    width: 22,
                                    height: 22,
                                    decoration: const ShapeDecoration(
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