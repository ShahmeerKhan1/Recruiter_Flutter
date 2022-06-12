import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_47_1.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';
import 'package:recruiter_flutter/model/nli_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CTP46_1 extends StatelessWidget {
  CTP46_1({Key? key}) : super(key: key);

  TextEditingController search = TextEditingController();

  final List<NLIModel> _list = [
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
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10.0),
                    filled: true,
                    fillColor: const Color(0xFF111111),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Search",
                    labelStyle: const TextStyle(color: Color(0xFF686868)),
                    suffixIcon:
                    const Icon(Icons.search, color: Color(0xFF686868)),
                    //  prefixIcon: Icon(Icons.people),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
              ListView.builder(
                  itemCount: _list.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const CTP47_1()));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
                        margin: const EdgeInsets.only(top: 16.0, bottom: 2.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFF111111),
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(_list[index].img,
                                        fit: BoxFit.cover)),
                                const SizedBox(width: 6),
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
                                      const SizedBox(height: 4),
                                      SizedBox(
                                        width: 160,
                                        // color: Colors.blue,
                                        // height: MediaQuery.of(context).size.height,
                                        child: Text(
                                          _list[index].location,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        _list[index].sentBy,
                                        style: const TextStyle(
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
