import 'package:flutter/material.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/drawer_widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Profile', style: TextStyle(color: Colors.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.notifications, color: Colors.white),
            ),
          ],
          bottom: PreferredSize(
              child: Container(
                color: Color(0xFF474747),
                height: 4.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
        ),
        drawer: drawerWidget(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Stack(
                    overflow: Overflow.visible,
                      children: [
                        Image.asset('assets/profile_cover.png'),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/profile_img.png'),
                            radius: 36.0,
                          ),
                        )
                      ]
                  )
              ),
            ],
          ),
        ));
  }
}

class DetailProfile extends StatelessWidget {
  const DetailProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(),
    );
  }
}
