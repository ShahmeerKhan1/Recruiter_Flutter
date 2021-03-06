import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_39_1.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_42_1.dart';
import 'package:recruiter_flutter/school_athlete_profile/screens/sap_43.dart';
import 'package:recruiter_flutter/util/colors.dart';

import 'sap_15.dart';
import 'sap_39.dart';
import 'sap_7_1.dart';
import 'sap_7_2.dart';
import 'sap_7_4.dart';

class SAP_7 extends StatefulWidget {
  const SAP_7({Key? key}) : super(key: key);

  @override
  _SAP_7State createState() => _SAP_7State();
}

class _SAP_7State extends State<SAP_7> with SingleTickerProviderStateMixin {
  int _navSelectedIndex = 0; // bottom Nav Index
  final int _currentIndex = 0; // bottom Nav

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

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
          alignment: Alignment.center,
          padding: EdgeInsets.all(0.0),
          // padding: EdgeInsets.only(right: 6.0, left: 0.0),
          color: Colors.black,
          child: TabBar(
            labelStyle: TextStyle(fontFamily: 'Helvetica', fontSize: 13.0, fontWeight: FontWeight.w100),
            unselectedLabelStyle: TextStyle(fontFamily: 'Helvetica', fontSize: 13.0),
            isScrollable: true,
            padding: EdgeInsets.zero,
            controller: tabController,
            // labelPadding: EdgeInsets.only(right: 6.0, left: 6),
            unselectedLabelColor: AppColor.greyBorderColor,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.only(bottom: 18),
            labelColor: Colors.white,
            onTap: (index) {
              setState(() {
                _navSelectedIndex = index;
              });
            },
            tabs: const [
              Tab(text: 'Home',),
              Tab(text: 'Recruiting'),
              Tab(text: 'Create'),
              Tab(text: 'Messages'),
              Tab(text: 'Search'),
            ],
          ),
          // BottomNavigationBar(
          //   backgroundColor: Colors.black,
          //   selectedItemColor: Colors.white,
          //   selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
          //   //   selectedLabelStyle: TextStyle(color: AppColors.purpleColor, fontWeight: FontWeight.w500),
          //   unselectedLabelStyle: const TextStyle(fontSize: 15.0),
          //   unselectedItemColor: AppColor.greyBorderColor,
          //   type: BottomNavigationBarType.fixed,
          //   selectedIconTheme: const IconThemeData(opacity: 0.0, size: 0),
          //   unselectedIconTheme: const IconThemeData(opacity: 0.0, size: 0),
          //   // backgroundColor: Colors.black,
          //   // selectedItemColor: Colors.white,
          //   // selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
          //   // unselectedItemColor: AppColor.greyBorderColor,
          //   // //   selectedLabelStyle: TextStyle(color: AppColors.purpleColor, fontWeight: FontWeight.w500),
          //   // unselectedLabelStyle: TextStyle(fontSize: 15.0),
          //   // type: BottomNavigationBarType.fixed,
          //   // backgroundColor: AppColors.bgColor,
          //   elevation: 0,
          //   // selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
          //   // unselectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
          //   // onTap: onTabTapped,
          //   onTap: (index) {
          //     setState(() {
          //       _navSelectedIndex = index;
          //       print('nav item index $index');
          //     });
          //   },
          //   currentIndex: _navSelectedIndex,
          //   items: const [
          //     BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.work),
          //         //  icon: SvgPicture.asset('assets/bottom_nav_office.svg'),
          //         label: 'Recruiting'),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.add_circle_outline),
          //         //  icon: SvgPicture.asset('assets/bottom_nav_add.svg'),
          //         label: 'Create'),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.email),
          //         //  icon: SvgPicture.asset('assets/bottom_nav_mail.svg'),
          //         label: 'Messages'),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.search),
          //         // icon: SvgPicture.asset('assets/bottom_nav_search.svg'),
          //         label: 'Search')
          //   ],
          // ),
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const SAP_7_1(),
          const SAP_39(),
          const CustomOverlay(),
          const SAP_15(),
          const SAP_43(),
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SAP7_4()));
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBABABA),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Text('Highlight', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0)),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SAP7_2()));
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBABABA),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Text('Post', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0)),
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}
