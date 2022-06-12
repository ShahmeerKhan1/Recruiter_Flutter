import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_radio_buttons.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

import 'sap_6_3.dart';


class SAP6_2 extends StatefulWidget {
  const SAP6_2({Key? key}) : super(key: key);

  @override
  _SAP6_2State createState() => _SAP6_2State();
}

class _SAP6_2State extends State<SAP6_2> {

  List<Gender> genders = List<Gender>.empty(growable: true);

  TextEditingController date = TextEditingController();

  final List<String> highSchool = [
    'ABC High School',
    'XYZ High School',
    '123 High School'
  ];

  final List<String> state = [
    'State 1',
    'State 2',
    'State 3'
  ];

  final List<String> city = [
    'City 1',
    'City 2',
    'City 3'
  ];

  String? selectedSchool;
  String? selectedState;
  String? selectedCity;

  final _schoolFormKey = GlobalKey<FormState>();
  final _stateFormKey = GlobalKey<FormState>();
  final _cityFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    genders.add(Gender("Male", 'assets/male.png', false));
    genders.add(Gender("Female", 'assets/female.png', false));
  }

  Future<void> _selectDate(BuildContext context) async {
    DateFormat formatter = DateFormat('dd/MM/yyyy');//specifies day/month/year format

    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        date.value = TextEditingValue(text: formatter.format(picked));//Use formatter to format selected date and assign to text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      //    color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage("assets/two.png"),
                          alignment: Alignment.topLeft
                          //   fit: BoxFit.cover,
                          ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'General',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 22),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Information',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 22),
                              ),
                            ],
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.26,
                  alignment: Alignment.center,
                  //  color: Colors.green,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 8.0),
                        child: Text(
                          'Gender',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisExtent: 165,
                              mainAxisSpacing: 10),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: genders.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    for (var gender in genders) {
                                      gender.isSelected = false;
                                    }
                                    genders[index].isSelected = true;
                                  });
                                },
                                child: CustomRadio(genders[index]).genderWidget(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
              //  color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        'Birth Date',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                        keyboardType: TextInputType.number,
                        // textAlign: TextAlign.center,
                        readOnly: true,
                        inputFormatters: [
                          DateInputFormatter(),
                        ],
                        onTap: () {
                          _selectDate(context);
                        },
                        controller: date,
                        style: const TextStyle(
                            color: Colors.white
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          // prefixIcon: Icon(Icons.lock),
                          labelText: "MM/DD/YYYY",
                          labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        'Choose Your High School',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Form(
                      key: _schoolFormKey,
                      child: Container(
                       // alignment: Alignment.topLeft,
                       // padding: EdgeInsets.all(0.0),
                       // margin: EdgeInsets.all(0.0),
                       // height: 65,
                        child: DropdownButtonFormField2(
                          buttonPadding: const EdgeInsets.all(0.0),
                        //  alignment: Alignment.center,
                        //  buttonWidth: 50,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFF111111),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                          hint: const Text(
                            'Type or Select From The Menu',
                            style: TextStyle(fontSize: 16, color: Color(0xFFBABABA)),
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
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                      color: Color(0xFFBABABA)
                                  ),
                                ),
                              ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select Type';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            //Do something when changing the item if you want.
                          },
                          onSaved: (value) {
                            selectedSchool = value.toString();
                          },
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  'State',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Form(
                                key: _stateFormKey,
                                child: Container(
                                  // alignment: Alignment.topLeft,
                                  // padding: EdgeInsets.all(0.0),
                                  // margin: EdgeInsets.all(0.0),
                                  // height: 65,
                                  child: DropdownButtonFormField2(
                                    buttonPadding: const EdgeInsets.all(0.0),
                                    alignment: Alignment.center,
                                    //  buttonWidth: 50,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xFF111111),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                    ),
                                    hint: const Text(
                                      'Select',
                                      style: TextStyle(fontSize: 16, color: Color(0xFFBABABA)),
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
                                    items: state
                                        .map((item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                                color: Color(0xFFBABABA)
                                            ),
                                          ),
                                        ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select State';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      //Do something when changing the item if you want.
                                    },
                                    onSaved: (value) {
                                      selectedState = value.toString();
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  'City',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Form(
                                key: _cityFormKey,
                                child: Container(
                                  // alignment: Alignment.topLeft,
                                  // padding: EdgeInsets.all(0.0),
                                  // margin: EdgeInsets.all(0.0),
                                  // height: 65,
                                  child: DropdownButtonFormField2(
                                    buttonPadding: const EdgeInsets.all(0.0),
                                    alignment: Alignment.center,
                                    //  buttonWidth: 50,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xFF111111),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                    ),
                                    hint: const Text(
                                      'Select',
                                      style: TextStyle(fontSize: 16, color: Color(0xFFBABABA)),
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
                                    items: city
                                        .map((item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                                color: Color(0xFFBABABA)
                                            ),
                                          ),
                                        ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select City';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      //Do something when changing the item if you want.
                                    },
                                    onSaved: (value) {
                                      selectedCity = value.toString();
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
            //    height: MediaQuery.of(context).size.height * 0.10,
             //   width: MediaQuery.of(context).size.width,
              //  color: Colors.pink,
                child:  SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const SAP6_3()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.goldenColor,
                    ),
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
