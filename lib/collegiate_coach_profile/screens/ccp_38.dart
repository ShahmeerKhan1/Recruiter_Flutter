import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_39.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_app_bar.dart';
import 'package:recruiter_flutter/controller/nli_controller.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP_38 extends StatelessWidget {
  CCP_38({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.put(NLIController());

    TextEditingController _new = TextEditingController();
    TextEditingController _search = TextEditingController();

    return Scaffold(
      appBar: ccpAppBar('NLI Signing', Icons.notifications, context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_39()));
                      },
                      child: Container(
                        height: 46,
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF111111),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(color: AppColor.borderColor, width: 2)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('New', style: TextStyle(color: Color(0xFF686868)),),
                            Icon(Icons.add, color: Color(0xFF686868))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    flex: 2,
                    child: TextField(
                        controller: _search,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12.0),
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: GetBuilder<NLIController>(
                  builder: (_const) {
                    if(_const.nliList.isNotEmpty) {
                      return ListView.builder(
                        //  primary: false,
                          itemCount: _const.nliList.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                              onTap: () {
                             //   Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_Offer_Detail(data: _const.offerList[index])));
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.10,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
                                margin: EdgeInsets.only(top: 16.0, bottom: 6.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFF111111),
                                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 75,
                                      child: Image.asset('assets/events_img2.png', fit: BoxFit.cover)),
                                    SizedBox(width: 12),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _const.nliList[index].date,
                                            style: TextStyle(
                                                color: AppColor.greyBorderColor),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            _const.nliList[index].location,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0),
                                          ),
                                          SizedBox(height: 4),
                                          Container(
                                            width: 160,
                                            // color: Colors.blue,
                                            // height: MediaQuery.of(context).size.height,
                                            child: Text(
                                              'Sent To: ${_const.nliList[index].sentBy}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                  color: Color(0xFFFFEE00)),
                                            ),
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
                              ),
                            );
                          });
                    }
                    else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 26.0),
                        child: Center(child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_39()));
                            },
                            child: Text('Create Your First NLI Signing', style: TextStyle(color: Color(0xFFFFEE00),
                                fontSize: 22.0, decoration: TextDecoration.underline, fontWeight: FontWeight.w500))),),
                      );
                    }
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
