import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_6_2.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp6_2.dart';
import 'package:recruiter_flutter/school_athlete_profile/screens/sap_6_2.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/scp_6_2.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/custom_radio_buttons.dart';

class ChooseProfile extends StatefulWidget {
  const ChooseProfile({Key? key}) : super(key: key);

  @override
  _ChooseProfileState createState() => _ChooseProfileState();
}

class _ChooseProfileState extends State<ChooseProfile> {

  List<Gender> genders = List<Gender>.empty(growable: true);
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    genders.add(new Gender("High School\nAthlete", 'assets/football.png', false));
    genders.add(new Gender("Collegiate\nCoach", 'assets/jockey.png', false));
    genders.add(new Gender("High School\nCoach", 'assets/jockey.png', false));
    genders.add(new Gender("Collegiate\nTransfer", 'assets/judo.png', false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                 //   color: Colors.blue,
                    image: DecorationImage(
                        image: AssetImage("assets/one.png"),
                        alignment: Alignment.topLeft
                      //   fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: () {
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Choose Your', style: TextStyle(color: Colors.white, fontSize: 22),),
                            SizedBox(height: 6),
                            Text('Profile Type', style: TextStyle(color: Colors.white, fontSize: 22),),
                          ],
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
             alignment: Alignment.center,
             // color: Colors.green,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisExtent: 165,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
                //  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: genders.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                    //  splashColor: Colors.pinkAccent,
                      onTap: () {
                        setState(() {
                          genders.forEach((gender) => gender.isSelected = false);
                          genders[index].isSelected = true;
                          selectedIndex=index;
                        });
                      },
                      child: CustomRadio(genders[index]).typeWidget(),
                    );
                  })
            ),
            SizedBox(height: 36),
            Container(
              width: 150,
              height: 45,
              child: ElevatedButton(
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {
                  choosePath();
                //  Navigator.push(context, MaterialPageRoute(builder: (_) => CTP6_2()));
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColor.goldenColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  choosePath(){
    switch(selectedIndex){
      case -1:
        Get.snackbar("Note", "Please select Profile Type",snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.goldenColor,colorText: Colors.white);
        break;
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => SAP6_2()));
        print('index 0');
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CCP6_2()));
        print('index 1');
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_) => SCP6_2()));
        print("index 2");
        break;
      case 3:
        print("index 3");
        Navigator.push(context, MaterialPageRoute(builder: (_) => CTP6_2()));
        break;
    }
  }
}
