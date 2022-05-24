import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_47_1.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';
import 'package:recruiter_flutter/model/nli_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CTP46_1 extends StatelessWidget {
  CTP46_1({Key? key}) : super(key: key);

  TextEditingController search = TextEditingController();

  List<NLIModel> _list = [
    NLIModel(
        img: 'assets/events_img2.png',
        date: 'Fri, Oct 2nd',
        location: 'Ohio State University',
        sentBy: 'Sent By: Coach John'
    ),
    NLIModel(
        img: 'assets/events_img2.png',
        date: 'Fri, Oct 2nd',
        location: 'Ohio State University',
        sentBy: 'Sent By: Coach John'
    ),
    NLIModel(
        img: 'assets/events_img2.png',
        date: 'Fri, Oct 2nd',
        location: 'Ohio State University',
        sentBy: 'Sent By: Coach John'
    ),
    NLIModel(
        img: 'assets/events_img2.png',
        date: 'Fri, Oct 2nd',
        location: 'Ohio State University',
        sentBy: 'Sent By: Coach John'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ctpAppBar('NLI Signing', Icons.notifications, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: search,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10.0),
                    filled: true,
                    fillColor: Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Search",
                    labelStyle: TextStyle(color: Color(0xFF686868)),
                    suffixIcon:
                    Icon(Icons.search, color: Color(0xFF686868)),
                    //  prefixIcon: Icon(Icons.people),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              ListView.builder(
                  itemCount: _list.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => CTP47_1()));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
                        margin: EdgeInsets.only(top: 16.0, bottom: 2.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF111111),
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(_list[index].img,
                                        fit: BoxFit.cover)),
                                SizedBox(width: 6),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _list[index].date,
                                        style: TextStyle(
                                            color: AppColor.greyBorderColor,
                                            fontSize: 14.0),
                                      ),
                                      SizedBox(height: 4),
                                      Container(
                                        width: 160,
                                        // color: Colors.blue,
                                        // height: MediaQuery.of(context).size.height,
                                        child: Text(
                                          _list[index].location,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        _list[index].sentBy,
                                        style: TextStyle(
                                            color: Color(0xFFFFEE00),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.more_horiz,
                                          color: AppColor.textGreyColor)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
