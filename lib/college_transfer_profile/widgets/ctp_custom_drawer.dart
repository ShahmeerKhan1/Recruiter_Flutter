import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';

Widget customDrawer(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.70,
    // color: Colors.purple,
    child: Drawer(
      // backgroundColor: Color(0xFF2A2A2A),
      backgroundColor: Color(0xFF111111),
    //  backgroundColor: Colors.blue,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                _drawerHeader(context),
                ListTile(
                  onTap: () {
                   // Navigator.push(context, MaterialPageRoute(builder: (_) => SCP26_1()));
                    //   Navigator.pushReplacementNamed(context, Routes.profile);
                  },
                  leading: Image.asset('assets/small_profile.png'),
                  title: Text(
                    "Profile",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                ListTile(
                  onTap: () {
                 //   Navigator.push(context, MaterialPageRoute(builder: (_) => SCP31_1()));
                    //  Navigator.pushReplacementNamed(context, Routes.events);
                  },
                  leading: Image.asset('assets/events.png'),
                  title: Text(
                    "Events",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                ListTile(
                  onTap: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (_) => Bookmarks()));
                    //   Navigator.pushReplacementNamed(context, Routes.bookmarks);
                  },
                  leading: Image.asset('assets/nli.png'),
                  title: Text(
                    "NLI Signing",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                ListTile(
                  onTap: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (_) => Bookmarks()));
                    //   Navigator.pushReplacementNamed(context, Routes.bookmarks);
                  },
                  leading: Image.asset('assets/bookmarks.png'),
                  title: Text(
                    "Bookmarks",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                ListTile(
                  onTap: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (_) => Bookmarks()));
                    //   Navigator.pushReplacementNamed(context, Routes.bookmarks);
                  },
                  leading: Image.asset('assets/transfer.png'),
                  title: Text(
                    "Transfers Portal",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          //  Spacer(),
          Container(
            // color: Colors.orange,
            height: 100,
            alignment: Alignment.centerLeft,
            child: ListTile(
              // onTap: () {
              //   Navigator.push(context, MaterialPageRoute(builder: (_) => Settings()));
              // //  Navigator.pushReplacementNamed(context, Routes.settings);
              // },
              leading: Image.asset('assets/settings.png'),
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _drawerHeader(BuildContext context) {
  return new Container(
    height: 200,
    child: new DrawerHeader(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new CircleAvatar(
                  backgroundImage:
                  AssetImage('assets/drawer_img.png'),
                  radius: 32,
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Martin Mangram',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                // SizedBox(width: 12),
                // Container(
                //   height: 24,
                //   width: 56,
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //     border: Border.all(
                //         color: AppColor.goldenColor, width: 1.0),
                //     borderRadius: BorderRadius.all(
                //         Radius.circular(
                //             6.0) //                 <--- border radius here
                //     ),
                //   ),
                //   //             <--- BoxDecoration here
                //   child: Text(
                //     "Coach",
                //     style: TextStyle(
                //         fontSize: 12.0,
                //         color: AppColor.goldenColor,
                //         fontWeight: FontWeight.w500),
                //   ),
                // )
              ],
            ),
            Text(
              '@martin',
              style: TextStyle(color: AppColor.greyBorderColor),
            ),
            SizedBox(height: 12),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              //  color: Colors.blue,
              child: Row(
                children: [
                  Text(
                    '800',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'followers',
                    style: TextStyle(
                        color: AppColor.greyBorderColor),
                  ),
                  SizedBox(width: 16),
                  Text(
                    '600',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'following',
                    style: TextStyle(
                        color: AppColor.greyBorderColor),
                  ),
                ],
              ),
            )
          ],
        )),
    //    color: Colors.tealAccent
  );
}