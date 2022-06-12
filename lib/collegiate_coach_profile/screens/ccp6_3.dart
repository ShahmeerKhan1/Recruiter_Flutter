import 'package:flutter/material.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_7.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_radio_buttons.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP6_3 extends StatefulWidget {
  const CCP6_3({Key? key}) : super(key: key);

  @override
  _CCP6_3State createState() => _CCP6_3State();
}

class _CCP6_3State extends State<CCP6_3> {

  List<Gender> genders = List<Gender>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    genders.add(Gender("Volley", 'assets/volley.png', false));
    genders.add(Gender("Lacrosse", 'assets/lacrosse.png', false));
    genders.add(Gender("Soccer", 'assets/soccer.png', false));
    genders.add(Gender("Baseball", 'assets/baseball.png', false));
    genders.add(Gender("Volley", 'assets/volley.png', false));
    genders.add(Gender("Lacrosse", 'assets/lacrosse.png', false));
  }

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.22,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          //       color: Colors.blue,
                          image: DecorationImage(
                              image: AssetImage("assets/three.png"),
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
                                    'Athetic',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    'Information',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12.0),
                    child: Text(
                      'Sport',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.56,
                      alignment: Alignment.topCenter,
                      // color: Colors.green,
                      child: GridView.builder(
                          padding: const EdgeInsets.all(0.0),
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 150,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0),
                          //  scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: genders.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              //  splashColor: Colors.pinkAccent,
                              onTap: () {
                                setState(() {
                                  for (var gender in genders) {
                                    gender.isSelected = false;
                                  }
                                  genders[index].isSelected = true;
                                });
                              },
                              child: CustomRadio(genders[index]).atheticWidget(),
                            );
                          })
                  ),
                  Expanded(
                    child: Container(
                      //  color: Colors.orange,
                      // height: MediaQuery.of(context).size.height * 0.14,
                      // width: MediaQuery.of(context).size.width,
                      child:  Column(
                        children: [
                          TextField(
                              controller: search,
                              style: const TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 16.0),
                                filled: true,
                                fillColor: const Color(0xFF111111),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                labelText: "Search for Sport",
                                labelStyle: const TextStyle(color: Color(0xFFBABABA)),
                                suffixIcon: Icon(Icons.search, color: AppColor.greyBorderColor),
                                //  prefixIcon: Icon(Icons.people),
                                border: myinputborder(),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder(),
                              )),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: ElevatedButton(
                              child: const Text(
                                'Finish',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const CCP_7()));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.goldenColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ])
        )
    );
  }
}