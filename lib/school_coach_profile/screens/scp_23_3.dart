import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:recruiter_flutter/controller/controller.dart';
import 'package:recruiter_flutter/controller/game_controller.dart';
import 'package:recruiter_flutter/model/game_model.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/profile.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class SCP23_3 extends StatefulWidget {
  const SCP23_3({Key? key}) : super(key: key);

  @override
  _SCP23_3State createState() => _SCP23_3State();
}

List<GameModel> gameList=<GameModel>[];
class _SCP23_3State extends State<SCP23_3> {
  TextEditingController title = TextEditingController(text: ' ');
  TextEditingController description = TextEditingController(text: ' ');
  TextEditingController date = TextEditingController(text: ' ');
  TextEditingController location = TextEditingController(text: ' ');
  TextEditingController homeScoreCtr = TextEditingController(text: ' ');
  TextEditingController awayScoreCtr = TextEditingController(text: ' ');

  static const id = '/page1';
  final controller = Get.put(Controller());

  bool isButtonEnabled = false;

 final List<String> homeTeam = ['Team 1', 'Team 2', 'Team 3'];

 final List<String> awayTeam = ['Team X', 'Team Y', 'Team Z'];

 String? selectedHomeTeam;
 String? selectedAwayTeam;

  final _homeTeamFormKey = GlobalKey<FormState>();
  final _awayTeamFormKey = GlobalKey<FormState>();

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

    title = TextEditingController(text: "");

    if (title.text.trim() != "") {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
  }

  bool isTextFieldEmpty() {
    setState(() {
      if (title.text != "") {
        isButtonEnabled = true;
      } else {
        isButtonEnabled = false;
      }
    });
    return isButtonEnabled;
  }

  // _onSubmit() async {
  //   var form = _formKey.currentState;
  //   if (form!.validate()) {
  //     form.save();
  //     // print('Descrip ${model.desc}');
  //     print('msg');
  //
  //     messages.add(
  //       ChatMessageModel(messageContent: search.text, messageType: "sender"),
  //     );
  //     form.reset();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Add New Game', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: PreferredSize(
              child: Container(
                color: const Color(0xFF474747),
                height: 4.0,
              ),
              preferredSize: const Size.fromHeight(4.0))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              imageFile != null
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      //  height: 200,
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
                      height: _height * 0.2,
                      width: _width,
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
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Text('Title',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                      controller: controller.textController,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onSubmitted: null,
                      textCapitalization: TextCapitalization.sentences,
                      // onSaved: (val) {
                      //   setState(() {
                      //     model.desc = val!;
                      //   });
                      // },
                      onChanged: (val) {
                        isTextFieldEmpty();
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF111111),
                        // contentPadding: EdgeInsets.all(0.0),
                        // contentPadding: EdgeInsets.only(left: 16),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        // prefixIcon: Icon(Icons.lock),
                        //  labelText: "Reply To Post...",
                        labelStyle:
                            const TextStyle(color: Color(0xFFBABABA), fontSize: 12),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Text('Description (Optional)',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                      controller: description,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      textCapitalization: TextCapitalization.sentences,
                      // onSaved: (val) {
                      //   setState(() {
                      //     model.desc = val!;
                      //   });
                      // },
                      onChanged: (val) {
                        //  isTextFieldEmpty();
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF111111),
                        // contentPadding: EdgeInsets.all(0.0),
                        // contentPadding: EdgeInsets.only(left: 16),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        // prefixIcon: Icon(Icons.lock),
                        //  labelText: "Reply To Post...",
                        labelStyle:
                            const TextStyle(color: Color(0xFFBABABA), fontSize: 12),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Text('Date',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    // width: 200,
                    alignment: Alignment.centerLeft,
                    //  color: Colors.blue,
                    margin: const EdgeInsets.only(right: 150),
                    child: TextField(
                        controller: date,
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        // textAlign: TextAlign.center,
                        inputFormatters: [
                          DateInputFormatter(),
                        ],
                        // onSaved: (val) {
                        //   setState(() {
                        //     model.desc = val!;
                        //   });
                        // },
                        // onChanged: (val) {
                        //   //  isTextFieldEmpty();
                        // },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF111111),
                          // contentPadding: EdgeInsets.all(0.0),
                          // contentPadding: EdgeInsets.only(left: 16),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          // prefixIcon: Icon(Icons.lock),
                          labelText: "MM/DD/YYYY",
                          //  labelText: "Reply To Post...",
                          labelStyle:
                              const TextStyle(color: Color(0xFFBABABA), fontSize: 12),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Text('Location',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                      controller: location,
                      style: const TextStyle(color: Colors.white),
                      textCapitalization: TextCapitalization.sentences,
                      // textAlign: TextAlign.center,
                      // inputFormatters: [
                      //   DateInputFormatter(),
                      // ],
                      // onSaved: (val) {
                      //   setState(() {
                      //     model.desc = val!;
                      //   });
                      // },
                      // onChanged: (val) {
                      //   //  isTextFieldEmpty();
                      // },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF111111),
                        // contentPadding: EdgeInsets.all(0.0),
                        // contentPadding: EdgeInsets.only(left: 16),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        // prefixIcon: Icon(Icons.lock),
                        // labelText: "MM/DD/YYYY",
                        //  labelText: "Reply To Post...",
                        labelStyle:
                            const TextStyle(color: Color(0xFFBABABA), fontSize: 12),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 6.0, bottom: 6),
                              child: Text('Home Team',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            SizedBox(
                              height: 60,
                              child: Form(
                                key: _homeTeamFormKey,
                                child: DropdownButtonFormField2(
                                  buttonPadding: const EdgeInsets.all(0.0),
                                  //  alignment: Alignment.center,
                                  //  buttonWidth: 50,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFF111111),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelStyle:
                                        const TextStyle(color: Color(0xFFBABABA)),
                                    enabledBorder: myinputborder(),
                                    focusedBorder: myfocusborder(),
                                  ),
                                  hint: const Text(
                                    'Select Team',
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
                                  items: homeTeam
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
                                      selectedHomeTeam = value.toString();
                                      print('home onchange $selectedHomeTeam');
                                    });
                                    //Do something when changing the item if you want.
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      selectedHomeTeam = value.toString();
                                      print('home val $selectedHomeTeam');
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 6.0, bottom: 6),
                              child: Text('Score',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            TextField(
                                controller: homeScoreCtr,
                                style: const TextStyle(color: Colors.white),
                                textCapitalization:
                                    TextCapitalization.sentences,
                                // textAlign: TextAlign.center,
                                // inputFormatters: [
                                //   DateInputFormatter(),
                                // ],
                                // onSaved: (val) {
                                //   setState(() {
                                //     model.desc = val!;
                                //   });
                                // },
                                // onChanged: (val) {
                                //   //  isTextFieldEmpty();
                                // },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFF111111),
                                  // contentPadding: EdgeInsets.all(0.0),
                                  // contentPadding: EdgeInsets.only(left: 16),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  // prefixIcon: Icon(Icons.lock),
                                  // labelText: "MM/DD/YYYY",
                                  //  labelText: "Reply To Post...",
                                  labelStyle: const TextStyle(
                                      color: Color(0xFFBABABA), fontSize: 12),
                                  enabledBorder: myinputborder(),
                                  focusedBorder: myfocusborder(),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 6.0, bottom: 6),
                              child: Text('Away Team',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            SizedBox(
                              height: 60,
                              child: Form(
                                key: _awayTeamFormKey,
                                child: DropdownButtonFormField2(
                                  buttonPadding: const EdgeInsets.all(0.0),
                                  //  alignment: Alignment.center,
                                  //  buttonWidth: 50,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFF111111),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelStyle:
                                        const TextStyle(color: Color(0xFFBABABA)),
                                    enabledBorder: myinputborder(),
                                    focusedBorder: myfocusborder(),
                                  ),
                                  hint: const Text(
                                    'Select Team',
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
                                  items: awayTeam
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
                                      print('away ochange $selectedAwayTeam');
                                      selectedAwayTeam = value.toString();
                                    });
                                    //Do something when changing the item if you want.
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      print('away val $selectedAwayTeam');
                                      selectedAwayTeam = value.toString();
                                    });

                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 6.0, bottom: 6),
                              child: Text('Score',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            TextField(
                                controller: awayScoreCtr,
                                style: const TextStyle(color: Colors.white),
                                textCapitalization:
                                    TextCapitalization.sentences,
                                // textAlign: TextAlign.center,
                                // inputFormatters: [
                                //   DateInputFormatter(),
                                // ],
                                // onSaved: (val) {
                                //   setState(() {
                                //     model.desc = val!;
                                //   });
                                // },
                                // onChanged: (val) {
                                //   //  isTextFieldEmpty();
                                // },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFF111111),
                                  // contentPadding: EdgeInsets.all(0.0),
                                  // contentPadding: EdgeInsets.only(left: 16),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  // prefixIcon: Icon(Icons.lock),
                                  // labelText: "MM/DD/YYYY",
                                  //  labelText: "Reply To Post...",
                                  labelStyle: const TextStyle(
                                      color: Color(0xFFBABABA), fontSize: 12),
                                  enabledBorder: myinputborder(),
                                  focusedBorder: myfocusborder(),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // (controller.textController.text == ""
              //     ? Container(
              //         height: 44,
              //         width: double.infinity,
              //         color: Colors.pink,
              //         child: ElevatedButton(
              //             onPressed: onPressed,
              //             label: label,
              //           style: ElevatedButton.styleFrom(
              //             primary: Color(0xFFBABABA),
              //           ),
              //         ),
              //       )
              //     :
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      // margin: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: ElevatedButton(
                        child: const Text(
                          'Add Game',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        onPressed: () {
                          if (controller.textController.text == "") {
                            print('please enter text');
                            // _scaffoldKey.currentState!
                            //     .showSnackBar(new SnackBar(
                            //     content: new Text(
                            //         'Please enter message...'))
                            // );
                          } else {
                            //  _onSubmit();
                            print("selec:$selectedHomeTeam:$selectedAwayTeam");
                            Get.put(GameController()).gameList.add(GameModel
                              (image:imageFile,
                                title:controller.textController.text ,
                                description: description.text,
                                date: date.text, location: location.text,
                                homeTeam:selectedHomeTeam!=null?selectedHomeTeam!:' ',
                                homeScore: homeScoreCtr.text, awayTeam: selectedAwayTeam!=null?selectedAwayTeam!:' ',
                                awayScore: awayScoreCtr.text));

                           // Get.to(() => Profile());
                          //  controller.addItemToList();
                               Navigator.push(context, MaterialPageRoute(builder: (_) => const Profile()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFBABABA),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
