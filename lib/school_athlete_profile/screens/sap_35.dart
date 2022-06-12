import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';
import 'package:recruiter_flutter/controller/new_event.dart';
import 'package:recruiter_flutter/model/events_model.dart';
import 'package:recruiter_flutter/school_athlete_profile/widgets/sap_app_bar.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

import 'sap_34.dart';

class SAP_35 extends StatefulWidget {

  const SAP_35({Key? key}) : super(key: key);

  @override
  _SAP_35State createState() => _SAP_35State();
}

class _SAP_35State extends State<SAP_35> {

  TextEditingController title = TextEditingController(text: ' ');
  TextEditingController description = TextEditingController(text: ' ');
  TextEditingController date = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController office = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController fees = TextEditingController(text: ' ');

  bool isButtonEnabled = false;
  File? imageFile;

  _onAddImageClick() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
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

  final format = DateFormat("HH:mm");

  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (timePicked != null) {
      setState(() {
        _selectedTime = timePicked;
      });
    }
    // Conversion logic starts here
    DateTime tempDate = DateFormat("hh:mm").parse(
        _selectedTime!.hour.toString() +
            ":" + _selectedTime!.minute.toString());
    var dateFormat = DateFormat("h:mm a"); // you can change the format here
    print(dateFormat.format(tempDate));
  }

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: sapAppBar('New Event', Icons.notifications, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageFile != null
                  ? Container(
                width: MediaQuery.of(context).size.width,
                //  height: 200,
                //  height: 200,
                decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(16.0)),
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
                  borderRadius:
                  const BorderRadius.all(Radius.circular(16.0)),
                  border: Border.all(color: const Color(0xFF474747)),
                ),
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0),
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
                              color: Color(0xFF919191),
                              fontSize: 12),
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
                    child: Text('Event Title',
                        style:
                        TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                      controller: title,
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
                        contentPadding: const EdgeInsets.only(
                            left: 16.0, right: 16, top: 0, bottom: 0),
                        // contentPadding: EdgeInsets.only(left: 16),
                        floatingLabelBehavior:
                        FloatingLabelBehavior.never,
                        // prefixIcon: Icon(Icons.lock),
                        //  labelText: "Reply To Post...",
                        labelStyle: const TextStyle(
                            color: Color(0xFFBABABA), fontSize: 12),
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
                    child: Text('Event Description',
                        style:
                        TextStyle(color: Colors.white, fontSize: 16)),
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
                        // contentPadding: EdgeInsets.only(
                        //     left: 16.0, right: 16, top: 0, bottom: 0),
                        contentPadding: const EdgeInsets.all(16),
                        floatingLabelBehavior:
                        FloatingLabelBehavior.never,
                        // prefixIcon: Icon(Icons.lock),
                        //  labelText: "Reply To Post...",
                        labelStyle: const TextStyle(
                            color: Color(0xFFBABABA), fontSize: 12),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 6.0),
                          child: Text('Date',
                              style:
                              TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        const SizedBox(height: 6),
                        TextField(
                            controller: date,
                            style: const TextStyle(color: Colors.white),
                            readOnly: true,
                            // keyboardType: TextInputType.text,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101));
                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = DateFormat('EEEE, d MMM')
                                    .format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  date.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              //  hintText: "MM/DD/YYYY",
                              fillColor: const Color(0xFF111111),
                              // hintText: "Search",
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              // border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 16.0, right: 16, top: 0, bottom: 0),
                              // contentPadding: EdgeInsets.only(left: 16),
                              // floatingLabelBehavior:
                              //     FloatingLabelBehavior.never,
                              // prefixIcon: Icon(Icons.lock),
                              labelText: "MM/DD/YYYY",
                              //  labelText: "Reply To Post...",
                              labelStyle: TextStyle(
                                  color: AppColor.greyBorderColor,
                                  fontSize: 13),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 6.0),
                          child: Text('Time',
                              style:
                              TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        const SizedBox(height: 6),
                        TextField(
                            controller: from,
                            readOnly: true,
                            style: const TextStyle(color: Colors.white),
                            onTap: () async {
                              final TimeOfDay? timePicked = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (timePicked != null) {
                                setState(() {
                                  _selectedTime = timePicked;
                                });
                              }
                              // Conversion logic starts here
                              DateTime tempDate = DateFormat("hh:mm").parse(
                                  _selectedTime!.hour.toString() +
                                      ":" + _selectedTime!.minute.toString());
                              var dateFormat = DateFormat("h:mm a"); // you can change the format here
                              from.text = dateFormat.format(tempDate);
                              print(dateFormat.format(tempDate));

                            },
                            decoration: InputDecoration(
                              filled: true,
                              //  hintText: "MM/DD/YYYY",
                              fillColor: const Color(0xFF111111),
                              // hintText: "Search",
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              // border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 8.0, right: 0, top: 0, bottom: 0),
                              // contentPadding: EdgeInsets.all(0),
                              // floatingLabelBehavior:
                              //     FloatingLabelBehavior.never,
                              // prefixIcon: Icon(Icons.lock),
                              labelText: "From",
                              //  labelText: "Reply To Post...",
                              labelStyle: TextStyle(
                                  color: AppColor.greyBorderColor,
                                  fontSize: 13),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 6.0),
                          child: Text('',
                              style:
                              TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        const SizedBox(height: 6),
                        TextField(
                            controller: to,
                            readOnly: true,
                            style: const TextStyle(color: Colors.white),
                            onTap: () async {
                                final TimeOfDay? timePicked = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (timePicked != null) {
                                  setState(() {
                                    _selectedTime = timePicked;
                                  });
                                }
                                // Conversion logic starts here
                                DateTime tempDate = DateFormat("hh:mm").parse(
                                    _selectedTime!.hour.toString() +
                                        ":" + _selectedTime!.minute.toString());
                                var dateFormat = DateFormat("h:mm a"); // you can change the format here
                                to.text = dateFormat.format(tempDate);
                                print(dateFormat.format(tempDate));

                            },
                            decoration: InputDecoration(
                              filled: true,
                              //  hintText: "MM/DD/YYYY",
                              fillColor: const Color(0xFF111111),
                              // hintText: "Search",
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              // border: InputBorder.none,
                              // contentPadding: EdgeInsets.only(
                              //     left: 16.0, right: 16, top: 0, bottom: 0),
                              contentPadding: const EdgeInsets.only(left: 8.0, right: 0, top: 0, bottom: 0),
                              // floatingLabelBehavior:
                              //     FloatingLabelBehavior.never,
                              // prefixIcon: Icon(Icons.lock),
                              labelText: "To",
                              //  labelText: "Reply To Post...",
                              labelStyle: TextStyle(
                                  color: AppColor.greyBorderColor,
                                  fontSize: 13),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                            )),
                      ],
                    ),
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
                        style:
                        TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                      controller: address,
                      style: const TextStyle(color: Colors.white, fontSize: 12.0),
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF111111),
                        contentPadding: const EdgeInsets.only(
                            left: 16.0, right: 16, top: 0, bottom: 0),
                        // contentPadding: EdgeInsets.only(left: 16),
                        floatingLabelBehavior:
                        FloatingLabelBehavior.never,
                        // prefixIcon: Icon(Icons.lock),
                        labelText: "Address",
                        //  labelText: "Reply To Post...",
                        labelStyle: const TextStyle(
                            color: Color(0xFFBABABA), fontSize: 13),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            controller: office,
                            style: const TextStyle(color: Colors.white),
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFF111111),
                              contentPadding: const EdgeInsets.only(
                                  left: 16.0, right: 16, top: 0, bottom: 0),
                              // contentPadding: EdgeInsets.only(left: 16),
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              // prefixIcon: Icon(Icons.lock),
                              labelText: "Building/Office #",
                              //  labelText: "Reply To Post...",
                              labelStyle: const TextStyle(
                                  color: Color(0xFFBABABA), fontSize: 13),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                            )),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: TextField(
                            controller: city,
                            style: const TextStyle(color: Colors.white),
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFF111111),
                              contentPadding: const EdgeInsets.only(
                                  left: 16.0, right: 16, top: 0, bottom: 0),
                              // contentPadding: EdgeInsets.only(left: 16),
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              // prefixIcon: Icon(Icons.lock),
                              labelText: "City",
                              //  labelText: "Reply To Post...",
                              labelStyle: const TextStyle(
                                  color: Color(0xFFBABABA), fontSize: 13),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            controller: state,
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
                              contentPadding: const EdgeInsets.only(
                                  left: 16.0, right: 16, top: 0, bottom: 0),
                              // contentPadding: EdgeInsets.only(left: 16),
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              // prefixIcon: Icon(Icons.lock),
                              labelText: "State",
                              //  labelText: "Reply To Post...",
                              labelStyle: const TextStyle(
                                  color: Color(0xFFBABABA), fontSize: 13),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                            )),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: TextField(
                            controller: code,
                            style: const TextStyle(color: Colors.white),
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFF111111),
                              contentPadding: const EdgeInsets.only(
                                  left: 16.0, right: 16, top: 0, bottom: 0),
                              // contentPadding: EdgeInsets.only(left: 16),
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              // prefixIcon: Icon(Icons.lock),
                              labelText: "Code",
                              //  labelText: "Reply To Post...",
                              labelStyle: const TextStyle(
                                  color: Color(0xFFBABABA), fontSize: 13),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                            )),
                      ),
                    ],
                  )
                ],
              ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 6.0),
                              child: Text(
                                'Fees',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 6),
                            TextField(
                                controller: fees,
                                style: const TextStyle(color: Colors.white),
                                keyboardType: TextInputType.number,
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
                                  contentPadding: const EdgeInsets.only(
                                      left: 16.0,
                                      right: 16,
                                      top: 0,
                                      bottom: 0),
                                  // contentPadding: EdgeInsets.only(left: 16),
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                                  // prefixIcon: Icon(Icons.lock),
                                  // labelText: "MM/DD/YYYY",
                                  //  labelText: "Reply To Post...",
                                  labelStyle: const TextStyle(
                                      color: Color(0xFFBABABA),
                                      fontSize: 12),
                                  enabledBorder: myinputborder(),
                                  focusedBorder: myfocusborder(),
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [

                          ],
                        ),
                      ),
                    ],
                  ),
              const SizedBox(height: 26),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            //   _editPerformance = !_editPerformance;
                          });
                        },
                        child: Container(
                          height: 44,
                         // width: _width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10)),
                              border: Border.all(
                                  color: const Color(0xFFF61F1F),
                                  width: 1.5)),
                          child: const Text('Cancel',
                              style: TextStyle(
                                  color: Color(0xFFF61F1F),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0)),
                        )),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        if (title.text == "") {
                          print('please enter text');
                        } else {
                          //  _onSubmit();
                          //  setState(() {
                          // //   _addNewGame = !_addNewGame;
                          //
                          //  });
                         // add();
                          print('navigate new list');
                          Get.put(EventController()).eventLists.add(
                            EventsModel(
                                imgFile: imageFile,
                                date: date.text,
                                from: from.text,
                                to: to.text,
                                match: title.text,
                                location: address.text,
                                desc: description.text,
                                officeNo: office.text,
                                city: city.text,
                                state: state.text,
                                code: code.text,
                                rate: fees.text == " " ? fees.text = "Free" : "${"\$"}${fees.text}" ,
                                share: 'Share'
                            ),
                          );
                           Navigator.push(context, MaterialPageRoute(builder: (_) => const SAP_34()));
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
                        child: const Text('Create',
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
        ),
      );
  }
}
