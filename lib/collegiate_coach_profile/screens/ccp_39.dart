import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_38.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_app_bar.dart';
import 'package:recruiter_flutter/controller/nli_controller.dart';
import 'package:recruiter_flutter/model/nli_model.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP_39 extends StatefulWidget {

  const CCP_39({Key? key}) : super(key: key);

  @override
  State<CCP_39> createState() => _CCP_39State();
}

class _CCP_39State extends State<CCP_39> {

  final TextEditingController _link = TextEditingController();

  bool isButtonEnabled = false;

  final List<String> athlete = ['John Doe', 'Martin Mangram', 'ABC Athlete'];

  final List<String> highSchool = ['Bufford High School', 'Ohio State University', 'Harward University'];

  String? selectedAthlete;

  String? selectedSchool;

  final _atheleteFormKey = GlobalKey<FormState>();

  final _schoolFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ccpAppBar('New NLI Request', Icons.notifications, context),
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
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                  EdgeInsets.only(left: 6.0, bottom: 6),
                  child: Text('Select The Athelete',
                      style: TextStyle(
                          color: Colors.white, fontSize: 16)),
                ),
                SizedBox(
                  height: 60,
                  child: Form(
                    key: _atheleteFormKey,
                    child: DropdownButtonFormField2(
                      buttonPadding: const EdgeInsets.all(0.0),
                      //  alignment: Alignment.center,
                      //  buttonWidth: 50,
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        fillColor: const Color(0xFF111111),
                        floatingLabelBehavior:
                        FloatingLabelBehavior.never,
                        labelStyle:
                        const TextStyle(color: Color(0xFFBABABA)),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),
                      hint: const Text(
                        'Select Athlete',
                        style: TextStyle(
                            fontSize: 16, color: Color(0xFFBABABA)),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                      iconSize: 30,
                      // buttonHeight: 80,
                      //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      items: athlete
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFFBABABA)),
                        ),
                      ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Select Team';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedAthlete = value.toString();
                          print('home onchange $selectedAthlete');
                        });
                        //Do something when changing the item if you want.
                      },
                      onSaved: (value) {
                        setState(() {
                          selectedAthlete = value.toString();
                          print('home val $selectedAthlete');
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                  EdgeInsets.only(left: 6.0, bottom: 6),
                  child: Text('Choose High School',
                      style: TextStyle(
                          color: Colors.white, fontSize: 16)),
                ),
                SizedBox(
                  height: 60,
                  child: Form(
                    key: _schoolFormKey,
                    child: DropdownButtonFormField2(
                      buttonPadding: const EdgeInsets.all(0.0),
                      //  alignment: Alignment.center,
                      //  buttonWidth: 50,
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        fillColor: const Color(0xFF111111),
                        floatingLabelBehavior:
                        FloatingLabelBehavior.never,
                        labelStyle:
                        const TextStyle(color: Color(0xFFBABABA)),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),
                      hint: const Text(
                        'Select School',
                        style: TextStyle(
                            fontSize: 16, color: Color(0xFFBABABA)),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                      iconSize: 30,
                      // buttonHeight: 80,
                      //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      items: highSchool
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFFBABABA)),
                        ),
                      ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Select School';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedSchool = value.toString();
                          print('home onchange $selectedSchool');
                        });
                        //Do something when changing the item if you want.
                      },
                      onSaved: (value) {
                        setState(() {
                          selectedSchool = value.toString();
                          print('home val $selectedSchool');
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                  EdgeInsets.only(left: 6.0, bottom: 6),
                  child: Text('Paste Docusign Link',
                      style: TextStyle(
                          color: Colors.white, fontSize: 16)),
                ),
                TextField(
                    controller: _link,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 12.0),
                      filled: true,
                      fillColor: const Color(0xFF111111),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "Link",
                      labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                      suffixIcon:
                      const Icon(Icons.paste, color: Color(0xFF686868), size: 20.0,),
                      //  prefixIcon: Icon(Icons.people),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        print('navigate new offer');

                        Get.put(NLIController()).nliList.add(
                            NLIModel(
                                img: 'assets/events_img2.png',
                                date: 'Fri, Oct 2nd',
                              location: selectedSchool!=null?selectedSchool!:' ',
                              sentBy: selectedAthlete!=null?selectedAthlete!:' '
                            )
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const CCP_38()));
                        //  }
                      },
                      child: Container(
                        height: 44,
                        // width: _width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10)),
                            border: Border.all(
                                color: const Color(0xFFFFEE00),
                                width: 1.5)),
                        child: const Text('Send',
                            style: TextStyle(
                                color: Color(0xFFFFEE00),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0)),
                      )),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 44,
                        // width: _width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10)),
                            border: Border.all(
                                color: const Color(0xFFFFEE00),
                                width: 1.5)),
                        child: const Text('Download',
                            style: TextStyle(
                                color: Color(0xFFFFEE00),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0)),
                      )
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
