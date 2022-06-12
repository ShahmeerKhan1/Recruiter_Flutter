import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';

class CTP47_1 extends StatelessWidget {
  const CTP47_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ctpAppBar('NLI Signing', Icons.notifications, context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Color(0xFF111111),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('NLI Template', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white)),
            const SizedBox(height: 8),
            const Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
            style: TextStyle(color: Colors.white),),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(color: const Color(0xFFFFEE00))
                    ),
                    child: const Text('Sign', style: TextStyle(color: Color(0xFFFFEE00), fontSize: 16.0),),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(color: const Color(0xFFFFEE00))
                    ),
                    child: const Text('Download', style: TextStyle(color: Color(0xFFFFEE00), fontSize: 16.0),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
