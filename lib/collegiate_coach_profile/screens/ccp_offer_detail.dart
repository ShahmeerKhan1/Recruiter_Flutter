import 'package:flutter/material.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_app_bar.dart';
import 'package:recruiter_flutter/model/offer_sent_model.dart';
import 'package:recruiter_flutter/util/colors.dart';

class CCP_Offer_Detail extends StatefulWidget {
  OfferSentModel data;

  CCP_Offer_Detail({Key? key, required this.data}) : super(key: key);

  @override
  _CCP_Offer_DetailState createState() => _CCP_Offer_DetailState();
}

class _CCP_Offer_DetailState extends State<CCP_Offer_Detail> {

  bool commit = false;
  bool reject = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ccpAppBar('Offer Details', Icons.notifications, context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 0.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Color(0xFF111111),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Align(
            //     alignment: Alignment.topRight,
            //     child: Icon(
            //       Icons.more_horiz,
            //       color: AppColor.textGreyColor,
            //     )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Image.file(widget.data.img!, fit: BoxFit.fill)),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                widget.data.uniName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              padding: const EdgeInsets.only(left: 10.0, right: 16.0),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                children: [
                  Image.asset('assets/coach.png'),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.data.athleteName,
                        style: const TextStyle(
                            color: Color(0xFFFFEE00),
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        '@jdoe',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        print('tapped');
                      },
                      child: Image.asset('assets/msg.png')),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Date: ${widget.data.date}',
                  style: TextStyle(
                      color: AppColor.textGreyColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  (widget.data.offerType),
                  style: TextStyle(
                      color: AppColor.textGreyColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type:', style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500)),
                    const Text(
                      'Full Scholarship',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 28,
                  width: 72,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                   // color: Color(0xFFF61F1F),
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                    border: Border.all(color: const Color(0xFFF61F1F), width: 1.5)
                  ),
                  child: const Text('Rescind', style: TextStyle(color: Color(0xFFF61F1F), fontWeight: FontWeight.w500),),
                )
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Offer Description',
                  style: TextStyle(
                      color: AppColor.textGreyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\nLorem ipsum dolor sit amet, consetetur sadipscing',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Documents (Click To Open)', style: TextStyle(color: AppColor.textGreyColor, fontWeight: FontWeight.w500),),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Image.asset('assets/pdf.png'),
                      const SizedBox(width: 4),
                      const Text('File Name.Pdf', style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFFE0B216), fontSize: 12.0))
                    ],
                  ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Image.asset('assets/pdf.png'),
                    const SizedBox(width: 4),
                    const Text('File Name.Pdf', style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFFE0B216), fontSize: 12.0))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}