import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class SCP43 extends StatelessWidget {
  SCP43({Key? key}) : super(key: key);

  TextEditingController search = TextEditingController();
  TextEditingController filter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ctpAppBar('Bookmarks', Icons.notifications, context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
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
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: TextField(
                      controller: search,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: const Color(0xFF111111),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Filter",
                        labelStyle: const TextStyle(color: Color(0xFF686868)),
                        suffixIcon:
                        Image.asset('assets/filter.png', color: const Color(0xFF686868)),
                        //  prefixIcon: Icon(Icons.people),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
