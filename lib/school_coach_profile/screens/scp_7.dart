import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/posts_screen.dart';
import 'package:recruiter_flutter/school_coach_profile/screens/scp_15_1.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/drawer_widget.dart';

class SCP7 extends StatefulWidget {
  const SCP7({Key? key}) : super(key: key);

  @override
  _SCP7State createState() => _SCP7State();
}

class _SCP7State extends State<SCP7> with SingleTickerProviderStateMixin {

  late TabController _controller;

 // int _selectedIndex = 0;   //  Tab Bar Index
  int _navSelectedIndex = 0;  // bottom Nav Index
  int _currentIndex = 0;      // bottom Nav

 // GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  // List<Widget> list = [
  //   Tab(text: 'Posts'),
  //   Tab(text: 'Highlights',),
  // ];

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  // void onTabTapped(int index) {     // bottom Nav
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // Create TabController for getting the index of current tab
  //   _controller = TabController(length: list.length, vsync: this);  // Tab Bar
  //
  //   _controller.addListener(() {       // Tab Bar
  //     setState(() {
  //       _selectedIndex = _controller.index;
  //     });
  //     print("Selected Index: " + _controller.index.toString());
  //   });
  // }

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
     //   drawer: drawerWidget(context),
      //  key: _drawerKey,
      //     appBar: AppBar(
      //       backgroundColor: Colors.black,
      //       //automaticallyImplyLeading: false,
      //       iconTheme: IconThemeData(color: Colors.white),
      //       title: Image.asset('assets/logo.png',width: 135),
      //       centerTitle: true,
      //       actions: [
      //         Padding(
      //           padding: const EdgeInsets.only(right: 12.0),
      //           child: Icon(Icons.notifications, color: Colors.white),
      //         )
      //       ],
      //       // bottom: TabBar(
      //       //   labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      //       //   labelColor: Colors.white,
      //       //   unselectedLabelStyle: TextStyle(color: AppColor.greyBorderColor),
      //       //   indicatorColor: Colors.white,
      //       //   onTap: (index) {
      //       //     print('Tab $index is tapped');
      //       //     // Should not used it as it only called when tab options are clicked,
      //       //     // not when user swapped
      //       //   },
      //       //   controller: _controller,
      //       //   tabs: list,
      //       // ),
      //     ),
          body: Stack(
            children: [
            //  pages.elementAt(_navSelectedIndex),
              _buildOffstageNavigator(0),
              _buildOffstageNavigator(1),
              _buildOffstageNavigator(2),
              _buildOffstageNavigator(3),
            ],
          ),
        bottomNavigationBar: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
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

  // List<Widget> pages = <Widget>[
  //   PostsScreen(),
  //   SecondScreen(),
  //   Container(
  //     color: Colors.pink,
  //   ),
  //   SCP15_1(),
  //   Container(
  //     color: Colors.purple,
  //   ),
  // ];

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          PostsScreen(),
          SecondScreen(),
          Container(
            color: Colors.pink,
          ),
          SCP15_1(),
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

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: drawerWidget(context),
        appBar: AppBar(
          // leading: IconButton(onPressed: () {
          //   Navigator.pop(context);
          // }, icon: Icon(Icons.arrow_back_rounded)),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: Image.asset('assets/logo.png',width: 135),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(Icons.notifications, color: Colors.white),
            )
          ],
        ),
        body: Container(
          color: Colors.orange,
          child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ThirdScreen()));
              }, icon: Icon(Icons.add), label: Text('da')),
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}


