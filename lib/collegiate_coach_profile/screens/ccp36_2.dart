import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_36.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_42.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_app_bar.dart';
import 'package:recruiter_flutter/controller/new_offer.dart';
import 'package:recruiter_flutter/model/offer_sent_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP36_2 extends StatefulWidget {
  const CCP36_2({Key? key}) : super(key: key);

  @override
  State<CCP36_2> createState() => _CCP36_2State();
}

class _CCP36_2State extends State<CCP36_2> {

  bool isButtonEnabled = false;

  final List<String> athlete = ['John Doe', 'Martin Mangram', 'ABC Athlete'];

  final List<String> highSchool = ['Bufford High School', 'Ohio State University', 'Harward University'];

  final List<String> offers = ['Offical', 'Verbal',];

  String? selectedAthlete;
  String? selectedSchool;
  String? selectedOffer;

  final _atheleteFormKey = GlobalKey<FormState>();
  final _schoolFormKey = GlobalKey<FormState>();
  final _officalOfferFormKey = GlobalKey<FormState>();

  File? imageFile;

  _onAddImageClick() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
    // final ImagePicker _picker = ImagePicker();
    // imageFile = await _picker.pickImage(
    //   source: ImageSource.gallery,
    // );
    // final File? file = File(imageFile!.path);
    // return file;
  }

  @override
  void initState() {
    super.initState();
  }

  bool _notification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Offer', style: TextStyle(color: Colors.white)),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                    color: Color(0xFF111111),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
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
                          child: Text('Upload File ',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16)),
                        ),
                        imageFile != null
                            ? Container(
                          width: MediaQuery.of(context).size.width,
                            height: 200,
                          //  height: 200,
                          decoration: BoxDecoration(
                            // color: Colors.blue,
                            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                            border: Border.all(color: const Color(0xFF474747)),
                          ),
                          child: Image.file(
                            imageFile!,
                            fit: BoxFit.fill,
                          ),
                        )
                            : Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF111111),
                            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                            border: Border.all(color: const Color(0xFF474747)),
                          ),
                          child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                              dashPattern: const [16, 16],
                              color: Colors.grey,
                              strokeWidth: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _onAddImageClick();
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: Color(0xFF919191),
                                      size: 40,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Upload Cover Photo\nFrom Device',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF919191), fontSize: 12),
                                  )
                                ],
                              )),
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
                          child: Text('Offer Status',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16)),
                        ),
                        SizedBox(
                          height: 60,
                          child: Form(
                            key: _officalOfferFormKey,
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
                                'Select Offer',
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
                              items: offers
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
                                  return 'Select Offer';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  selectedOffer = value.toString();
                                  print('home onchange $selectedOffer');
                                });
                                //Do something when changing the item if you want.
                              },
                              onSaved: (value) {
                                setState(() {
                                  selectedOffer = value.toString();
                                  print('home val $selectedOffer');
                                });
                              },
                            ),
                          ),
                        ),
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
                                if(imageFile != null) {

                                Get.put(OfferController()).offerList.add(
                                    OfferSentModel(
                                        img: imageFile,
                                        date: '8/8/2020',
                                        athleteName: selectedAthlete!=null?selectedAthlete!:' ',
                                        uniName: selectedSchool!=null?selectedSchool!:' ',
                                        offerType: selectedOffer!=null?selectedOffer!:' '
                                    )
                                );
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const CCP36_1()));
                                //  }
                              } else {
                                  Get.snackbar("Note", "Please upload an Image",snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: AppColor.goldenColor,colorText: Colors.white);
                                }
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
            )
          ],
        ),
      ),
    );
  }
}
