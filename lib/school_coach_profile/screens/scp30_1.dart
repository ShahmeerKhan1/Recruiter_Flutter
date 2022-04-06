import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruiter_flutter/widgets/custom_app_bar.dart';

class SCP30_1 extends StatefulWidget {
  const SCP30_1({Key? key}) : super(key: key);

  @override
  _SCP30_1State createState() => _SCP30_1State();
}

class _SCP30_1State extends State<SCP30_1> {
  int _speed = 0;
  int _weight = 0;
  int _force = 0;
  int _work = 0;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: customAppBar('Evaluate', Icons.notifications),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Column(
            children: [
              Text(
                'Top Characteristics',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          children: [
                            Image.asset('assets/leader.png',
                                fit: BoxFit.fill, width: 75, height: 75),
                            Text(
                              'Leader',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/tactical.png',
                              fit: BoxFit.cover,
                              height: 85,
                              width: 85,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Leader',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover),
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
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          children: [
                            Image.asset('assets/leader.png',
                                fit: BoxFit.fill, width: 75, height: 75),
                            Text(
                              'Leader',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/tactical.png',
                              fit: BoxFit.cover,
                              height: 85,
                              width: 85,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Leader',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover),
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
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          children: [
                            Image.asset('assets/leader.png',
                                fit: BoxFit.fill, width: 75, height: 75),
                            Text(
                              'Leader',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/tactical.png',
                              fit: BoxFit.cover,
                              height: 85,
                              width: 85,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Leader',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: _height * 0.14,
                        width: _width * 0.28,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover),
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
                    )
                  ],
                ),
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
              Container(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}