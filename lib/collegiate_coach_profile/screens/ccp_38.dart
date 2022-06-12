import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_39.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_app_bar.dart';
import 'package:recruiter_flutter/controller/nli_controller.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP_38 extends StatelessWidget {
  const CCP_38({Key? key}) : super(key: key);

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
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const CCP_39()));
                      },
                      child: Container(
                        height: 46,
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        decoration: BoxDecoration(
                            color: const Color(0xFF111111),
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(color: AppColor.borderColor, width: 2)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('New', style: TextStyle(color: Color(0xFF686868)),),
                            Icon(Icons.add, color: Color(0xFF686868))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    flex: 2,
                    child: TextField(
                        controller: _search,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 12.0),
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
                          physics: const NeverScrollableScrollPhysics(),
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
                                padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
                                margin: const EdgeInsets.only(top: 16.0, bottom: 6.0),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF111111),
                                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      width: 75,
                                      child: Image.asset('assets/events_img2.png', fit: BoxFit.cover)),
                                    const SizedBox(width: 12),
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
                                          const SizedBox(height: 4),
                                          Text(
                                            _const.nliList[index].location,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0),
                                          ),
                                          const SizedBox(height: 4),
                                          SizedBox(
                                            width: 160,
                                            // color: Colors.blue,
                                            // height: MediaQuery.of(context).size.height,
                                            child: Text(
                                              'Sent To: ${_const.nliList[index].sentBy}',
                                              style: const TextStyle(
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
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const CCP_39()));
                            },
                            child: const Text('Create Your First NLI Signing', style: TextStyle(color: Color(0xFFFFEE00),
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
