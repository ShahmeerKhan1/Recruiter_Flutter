import 'package:flutter/material.dart';
import 'package:recruiter_flutter/school_athlete_profile/widgets/sap_app_bar.dart';
import 'package:recruiter_flutter/school_coach_profile/widget/scp_app_bar.dart';

import 'scp42_1.dart';

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

  bool leader1 = false;
  bool tactical1 = false;
  bool sprinter1 = false;

  bool leader2 = false;
  bool tactical2 = false;
  bool sprinter2 = false;

  bool leader3 = false;
  bool tactical3 = false;
  bool sprinter3 = false;

  bool _notification = false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluate', style: TextStyle(color: Colors.white)),
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
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SCP42_1()));
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Column(
            children: [
              const Text(
                'Top Characteristics',
                style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
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
                            color: leader1 ? const Color(0xFF10E9A1) : null,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: const Color(0xFF10E9A1))),
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
                            const Text(
                              'Leader',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
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
                            color: tactical1 ? const Color(0xFF10E9A1) : null,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: const Color(0xFF10E9A1))),
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
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
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
                  const SizedBox(width: 8),
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
                            color: sprinter1 ? const Color(0xFF10e9A1) : null,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: const Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            !sprinter1
                                ? Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover)
                                : Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover, color: Colors.white),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
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
              const SizedBox(height: 8),
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
                            color: leader2 ? const Color(0xFF10E9A1) : null,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: const Color(0xFF10E9A1))),
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
                            const Text(
                              'Leader',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
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
                            color: tactical2 ? const Color(0xFF10E9A1) : null,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: const Color(0xFF10E9A1))),
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
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
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
                  const SizedBox(width: 8),
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
                            color: sprinter2 ? const Color(0xFF10e9A1) : null,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: const Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            !sprinter2
                                ? Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover)
                                : Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover, color: Colors.white),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
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
              const SizedBox(height: 8),
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
                            color: leader3 ? const Color(0xFF10E9A1) : null,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: const Color(0xFF10E9A1))),
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
                            const Text(
                              'Leader',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
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
                            color: tactical3 ? const Color(0xFF10E9A1) : null,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: const Color(0xFF10E9A1))),
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
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
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
                  const SizedBox(width: 8),
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
                            color: sprinter3 ? const Color(0xFF10e9A1) : null,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: const Color(0xFF10E9A1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            !sprinter3
                                ? Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover)
                                : Image.asset('assets/sprinter.png',
                                fit: BoxFit.cover, color: Colors.white),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
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
              const SizedBox(height: 32),
              Card(
                color: const Color(0xFF111111),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: const Color(0xFF707070),
                    // here for close state
                    colorScheme: const ColorScheme.light(
                      primary: Colors.white,
                    ),
                  ),
                  child: ExpansionTile(
                    backgroundColor: const Color(0xFF111111),
                    //   collapsedIconColor: Colors.red,
                    // sets the color of the arrow when expanded
                    //  iconColor: Colors.green,
                    //  collapsedTextColor: Colors.black,
                    title: const Text(
                      'Atheletic Abilities',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    children: <Widget>[
                      const Divider(color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                        child: Row(
                          children: [
                            const Text(
                              'Speed',
                              style: TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            const Spacer(),
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
                                child: const Icon(Icons.arrow_back_ios,
                                    color: Color(0xFF707070))),
                            const SizedBox(width: 8),
                            Text(
                              _speed.toString(),
                              style: const TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            const SizedBox(width: 12),
                            InkWell(
                                onTap: () {
                                  print('fwdprss');
                                  setState(() {
                                    _speed++;
                                  });
                                },
                                child: const Icon(Icons.arrow_forward_ios,
                                    color: Color(0xFF707070)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                        child: Row(
                          children: [
                            const Text(
                              'Weight-bearing',
                              style: TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            const Spacer(),
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
                                child: const Icon(Icons.arrow_back_ios,
                                    color: Color(0xFF707070))),
                            const SizedBox(width: 8),
                            Text(
                              _weight.toString(),
                              style: const TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            const SizedBox(width: 12),
                            InkWell(
                                onTap: () {
                                  print('fwdprss');
                                  setState(() {
                                    _weight++;
                                  });
                                },
                                child: const Icon(Icons.arrow_forward_ios,
                                    color: Color(0xFF707070)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                        child: Row(
                          children: [
                            const Text(
                              'Force - Power',
                              style: TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            const Spacer(),
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
                                child: const Icon(Icons.arrow_back_ios,
                                    color: Color(0xFF707070))),
                            const SizedBox(width: 8),
                            Text(
                              _force.toString(),
                              style: const TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            const SizedBox(width: 12),
                            InkWell(
                                onTap: () {
                                  print('fwdprss');
                                  setState(() {
                                    _force++;
                                  });
                                },
                                child: const Icon(Icons.arrow_forward_ios,
                                    color: Color(0xFF707070)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                        child: Row(
                          children: [
                            const Text(
                              'Workrate',
                              style: TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            const Spacer(),
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
                                child: const Icon(Icons.arrow_back_ios,
                                    color: Color(0xFF707070))),
                            const SizedBox(width: 8),
                            Text(
                              _work.toString(),
                              style: const TextStyle(
                                  color: Color(0xFFFFEE00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            const SizedBox(width: 12),
                            InkWell(
                                onTap: () {
                                  print('fwdprss');
                                  setState(() {
                                    _work++;
                                  });
                                },
                                child: const Icon(Icons.arrow_forward_ios,
                                    color: Color(0xFF707070)))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                  color: const Color(0xFF111111),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: const Color(0xFF707070),
                      // here for close state
                      colorScheme: const ColorScheme.light(
                        primary: Colors.white,
                      ),
                    ),
                    child: const ExpansionTile(
                      title: Text(
                        'Attacking',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  )),
              const SizedBox(height: 16),
              Card(
                  color: const Color(0xFF111111),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: const Color(0xFF707070),
                      // here for close state
                      colorScheme: const ColorScheme.light(
                        primary: Colors.white,
                      ),
                    ),
                    child: const ExpansionTile(
                      title: Text(
                        'Defensive',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  )),
              const SizedBox(height: 16),
              Card(
                  color: const Color(0xFF111111),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: const Color(0xFF707070),
                      // here for close state
                      colorScheme: const ColorScheme.light(
                        primary: Colors.white,
                      ),
                    ),
                    child: const ExpansionTile(
                      title: Text(
                        'Mental Skills',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  )),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
             //     Navigator.push(context, MaterialPageRoute(builder: (_) => const CTP34_1()));
                },
                child: Container(
                  height: _height * 0.08,
                  width: _width,
                  alignment: Alignment.center,
                  //  padding: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 4.0, right: 4.0),
                  margin: const EdgeInsets.only(
                      top: 16.0, bottom: 16.0, left: 4.0, right: 4.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFEE00),
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: const Text(
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
