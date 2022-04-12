import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_7_1.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_7_2.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_7_4.dart';
import 'package:recruiter_flutter/util/colors.dart';

class CTP_7 extends StatefulWidget {
  const CTP_7({Key? key}) : super(key: key);

  @override
  _CTP_7State createState() => _CTP_7State();
}

class _CTP_7State extends State<CTP_7> with SingleTickerProviderStateMixin {
  int _navSelectedIndex = 0; // bottom Nav Index
  int _currentIndex = 0; // bottom Nav

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
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
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Colors.white,
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: AppColor.goldenColor,
            unselectedItemColor: AppColor.greyBorderColor,
            //   selectedLabelStyle: TextStyle(color: AppColors.purpleColor, fontWeight: FontWeight.w500),
            //  unselectedLabelStyle: TextStyle(color: Color(0xFF341950)),
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
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.work),
                  //  icon: SvgPicture.asset('assets/bottom_nav_office.svg'),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outline, size: 38),
                  //  icon: SvgPicture.asset('assets/bottom_nav_add.svg'),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.email),
                  //  icon: SvgPicture.asset('assets/bottom_nav_mail.svg'),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  // icon: SvgPicture.asset('assets/bottom_nav_search.svg'),
                  label: '')
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
          CTP_7_1(),
          // showBottomSheet(),
          //  SecondScreen(),
          // modelBottomSet(),
          Container(color: Colors.blue),
          CustomOverlay(),
          // Container(
          //   color: Colors.pink,
          // ),

          // Container(
          //   color: Colors.black.withOpacity(0.5),
          //     child: showBottomSheet()),
          //  SCP15_1(),
          Container(
            color: Colors.purple,
          ),
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
                    Navigator.push(context, MaterialPageRoute(builder: (_) => CTP7_4()));
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
                    Navigator.push(context, MaterialPageRoute(builder: (_) => CTP7_2()));
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