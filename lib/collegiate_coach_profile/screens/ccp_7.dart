import 'package:flutter/material.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_15.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_36.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_41.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_7_1.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_7_2.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_7_4.dart';
import 'package:recruiter_flutter/util/colors.dart';

class CCP_7 extends StatefulWidget {
  const CCP_7({Key? key}) : super(key: key);

  @override
  _CCP_7State createState() => _CCP_7State();
}

class _CCP_7State extends State<CCP_7> with SingleTickerProviderStateMixin {
  int _navSelectedIndex = 0; // bottom Nav Index
  int _currentIndex = 0; // bottom Nav

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_navSelectedIndex].currentState!.maybePop();
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
            _buildOffstageNavigator(4),
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          // padding: EdgeInsets.all(0.0),
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Colors.white,
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: AppColor.goldenColor,
            unselectedItemColor: AppColor.greyBorderColor,
            type: BottomNavigationBarType.fixed,
            // backgroundColor: AppColors.bgColor,
            elevation: 0,
            // onTap: onTabTapped,
            onTap: (index) {
              setState(() {
                _navSelectedIndex = index;
                print('nav item index $index');
              });
            },
            currentIndex: _navSelectedIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.work),
                  //  icon: SvgPicture.asset('assets/bottom_nav_office.svg'),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outline, size: 38),
                  //  icon: SvgPicture.asset('assets/bottom_nav_add.svg'),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.email),
                  //  icon: SvgPicture.asset('assets/bottom_nav_mail.svg'),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  // icon: SvgPicture.asset('assets/bottom_nav_search.svg'),
                  label: ''
              )
            ],
          ),
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          CCP_7_1(),
         // CTP39_1(),
          CCP36_1(),
          CustomOverlay(),
          CCP_15(),
          CCP_41(),
          Container(),
         // CTP15_1(),
         // CTP_42_1(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    final Map routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _navSelectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }
}

class CustomOverlay extends StatelessWidget {
  const CustomOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_7_4()));
                },
                child: Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFBABABA),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Text('Highlight', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0)),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_7_2()));
                },
                child: Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFBABABA),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Text('Post', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

