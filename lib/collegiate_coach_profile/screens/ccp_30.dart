import 'package:flutter/material.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_31.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_app_bar.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';

class CCP_30 extends StatefulWidget {
  const CCP_30({Key? key}) : super(key: key);

  @override
  _CCP_30State createState() => _CCP_30State();
}

class _CCP_30State extends State<CCP_30> {

  int _speed = 0;
  int _weight = 0;
  int _force = 0;
  int _work = 0;

  bool leader1 = false;
  bool tactical1 = false;
  bool sprinter1 = false;

  bool leader2 = false;
  bool tactical2 = false;
  bool sprinter2 = false;

  bool leader3 = false;
  bool tactical3 = false;
  bool sprinter3 = false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: ccpAppBar('Evaluate', Icons.notifications, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Column(
            children: [
              Text(
                'Top Characteristics',
                style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        leader1 = !leader1;
                      });
                    },
                    child: Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            color: leader1 ? Color(0xFF10E9A1) : null,
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          children: [
                            leader1
                                ? Image.asset('assets/leader.png',
                                color: Colors.white,
                                fit: BoxFit.fill,
                                width: 75,
                                height: 75)
                                : Image.asset('assets/leader.png',
                                fit: BoxFit.fill, width: 75, height: 75),
                            Text(
                              'Leader',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        tactical1 = !tactical1;
                      });
                    },
                    child: Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            color: tactical1 ? Color(0xFF10E9A1) : null,
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          children: [
                            tactical1
                                ? Image.asset('assets/tactical.png',
                                color: Colors.white,
                                fit: BoxFit.fill,
                                width: 85,
                                height: 85)
                                : Image.asset('assets/tactical.png',
                                fit: BoxFit.fill, width: 85, height: 85),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Tactical',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        sprinter1 = !sprinter1;
                      });
                    },
                    child: Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            color: sprinter1 ? Color(0xFF10e9A1) : null,
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            !sprinter1
                                ? Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover)
                                : Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover, color: Colors.white),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Sprinter',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        leader2 = !leader2;
                      });
                    },
                    child: Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            color: leader2 ? Color(0xFF10E9A1) : null,
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          children: [
                            leader2
                                ? Image.asset('assets/leader.png',
                                color: Colors.white,
                                fit: BoxFit.fill,
                                width: 75,
                                height: 75)
                                : Image.asset('assets/leader.png',
                                fit: BoxFit.fill, width: 75, height: 75),
                            Text(
                              'Leader',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        tactical2 = !tactical2;
                      });
                    },
                    child: Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            color: tactical2 ? Color(0xFF10E9A1) : null,
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          children: [
                            tactical2
                                ? Image.asset('assets/tactical.png',
                                color: Colors.white,
                                fit: BoxFit.fill,
                                width: 85,
                                height: 85)
                                : Image.asset('assets/tactical.png',
                                fit: BoxFit.fill, width: 85, height: 85),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Tactical',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        sprinter2 = !sprinter2;
                      });
                    },
                    child: Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            color: sprinter2 ? Color(0xFF10e9A1) : null,
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            !sprinter2
                                ? Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover)
                                : Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover, color: Colors.white),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Sprinter',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        leader3 = !leader3;
                      });
                    },
                    child: Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            color: leader3 ? Color(0xFF10E9A1) : null,
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          children: [
                            leader3
                                ? Image.asset('assets/leader.png',
                                color: Colors.white,
                                fit: BoxFit.fill,
                                width: 75,
                                height: 75)
                                : Image.asset('assets/leader.png',
                                fit: BoxFit.fill, width: 75, height: 75),
                            Text(
                              'Leader',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        tactical3 = !tactical3;
                      });
                    },
                    child: Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            color: tactical3 ? Color(0xFF10E9A1) : null,
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          children: [
                            tactical3
                                ? Image.asset('assets/tactical.png',
                                color: Colors.white,
                                fit: BoxFit.fill,
                                width: 85,
                                height: 85)
                                : Image.asset('assets/tactical.png',
                                fit: BoxFit.fill, width: 85, height: 85),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Tactical',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        sprinter3 = !sprinter3;
                      });
                    },
                    child: Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            color: sprinter3 ? Color(0xFF10e9A1) : null,
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            !sprinter3
                                ? Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover)
                                : Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover, color: Colors.white),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Sprinter',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 32),
              Card(
                color: Color(0xFF111111),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Color(0xFF707070),
                    // here for close state
                    colorScheme: ColorScheme.light(
                      primary: Colors.white,
                    ),
                  ),
                  child: ExpansionTile(
                    backgroundColor: Color(0xFF111111),
                    //   collapsedIconColor: Colors.red,
                    // sets the color of the arrow when expanded
                    //  iconColor: Colors.green,
                    //  collapsedTextColor: Colors.black,
                    title: Text(
                      'Atheletic Abilities',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    children: <Widget>[
                      Divider(color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                        child: Row(
                          children: [
                            Text(
                              'Speed',
                              style: TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  print('backprss');
                                  setState(() {
                                    // _speed--;
                                    if (_speed != 0) {
                                      _speed--;
                                      print('0 now');
                                    }
                                  });
                                },
                                child: Icon(Icons.arrow_back_ios,
                                    color: Color(0xFF707070))),
                            SizedBox(width: 8),
                            Text(
                              _speed.toString(),
                              style: TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            SizedBox(width: 12),
                            InkWell(
                                onTap: () {
                                  print('fwdprss');
                                  setState(() {
                                    _speed++;
                                  });
                                },
                                child: Icon(Icons.arrow_forward_ios,
                                    color: Color(0xFF707070)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                        child: Row(
                          children: [
                            Text(
                              'Weight-bearing',
                              style: TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  print('backprss');
                                  setState(() {
                                    // _speed--;
                                    if (_weight != 0) {
                                      _weight--;
                                      print('0 now');
                                    }
                                  });
                                },
                                child: Icon(Icons.arrow_back_ios,
                                    color: Color(0xFF707070))),
                            SizedBox(width: 8),
                            Text(
                              _weight.toString(),
                              style: TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            SizedBox(width: 12),
                            InkWell(
                                onTap: () {
                                  print('fwdprss');
                                  setState(() {
                                    _weight++;
                                  });
                                },
                                child: Icon(Icons.arrow_forward_ios,
                                    color: Color(0xFF707070)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                        child: Row(
                          children: [
                            Text(
                              'Force - Power',
                              style: TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  print('backprss');
                                  setState(() {
                                    // _speed--;
                                    if (_force != 0) {
                                      _force--;
                                      print('0 now');
                                    }
                                  });
                                },
                                child: Icon(Icons.arrow_back_ios,
                                    color: Color(0xFF707070))),
                            SizedBox(width: 8),
                            Text(
                              _force.toString(),
                              style: TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            SizedBox(width: 12),
                            InkWell(
                                onTap: () {
                                  print('fwdprss');
                                  setState(() {
                                    _force++;
                                  });
                                },
                                child: Icon(Icons.arrow_forward_ios,
                                    color: Color(0xFF707070)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                        child: Row(
                          children: [
                            Text(
                              'Workrate',
                              style: TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  print('backprss');
                                  setState(() {
                                    // _speed--;
                                    if (_work != 0) {
                                      _work--;
                                      print('0 now');
                                    }
                                  });
                                },
                                child: Icon(Icons.arrow_back_ios,
                                    color: Color(0xFF707070))),
                            SizedBox(width: 8),
                            Text(
                              _work.toString(),
                              style: TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            SizedBox(width: 12),
                            InkWell(
                                onTap: () {
                                  print('fwdprss');
                                  setState(() {
                                    _work++;
                                  });
                                },
                                child: Icon(Icons.arrow_forward_ios,
                                    color: Color(0xFF707070)))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                  color: Color(0xFF111111),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Color(0xFF707070),
                      // here for close state
                      colorScheme: ColorScheme.light(
                        primary: Colors.white,
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        'Attacking',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  )),
              SizedBox(height: 16),
              Card(
                  color: Color(0xFF111111),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Color(0xFF707070),
                      // here for close state
                      colorScheme: ColorScheme.light(
                        primary: Colors.white,
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        'Defensive',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  )),
              SizedBox(height: 16),
              Card(
                  color: Color(0xFF111111),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Color(0xFF707070),
                      // here for close state
                      colorScheme: ColorScheme.light(
                        primary: Colors.white,
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        'Mental Skills',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  )),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_31()));
                },
                child: Container(
                  height: _height * 0.08,
                  width: _width,
                  alignment: Alignment.center,
                  //  padding: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 4.0, right: 4.0),
                  margin: EdgeInsets.only(
                      top: 16.0, bottom: 16.0, left: 4.0, right: 4.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFEE00),
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: Text(
                    'SUBMIT EVALUATION',
                    style: TextStyle(
                        color: Color(0xFF18152E),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
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