import 'package:flutter/material.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/custom_radio_buttons.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'scp_6_2.dart';

class SCP6_1 extends StatefulWidget {
  const SCP6_1({Key? key}) : super(key: key);

  @override
  _SCP6_1State createState() => _SCP6_1State();
}

class _SCP6_1State extends State<SCP6_1> {

  List<Gender> genders = List<Gender>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    genders.add(new Gender("High School\nAthlete", 'assets/football.png', false));
    genders.add(new Gender("Collegiate\nCoach", 'assets/football.png', false));
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
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SCP6_2()));
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
}
