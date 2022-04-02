import 'package:flutter/material.dart';
import 'package:recruiter_flutter/school_coach_profile/model/notifications_model.dart';
import 'package:recruiter_flutter/school_coach_profile/widgets/custom_app_bar.dart';
import 'package:recruiter_flutter/util/colors.dart';

class SCP42_1 extends StatelessWidget {
  SCP42_1({Key? key}) : super(key: key);

  List<NotificationsModel> _list = [
    NotificationsModel(
        'assets/drawer_img.png', 'Martin Mangram liked your post', '1m ago'),
    NotificationsModel(
        'assets/drawer_img.png', 'Martin Mangram commented on your post', '1m ago'),
    NotificationsModel('assets/drawer_img.png',
        'Congratulations, coach Martin has sent you an', '1m ago',
        offer: 'Offer'),
    NotificationsModel(
        'assets/drawer_img.png', 'Martin Mangram commented on your post', '1m ago'),
    NotificationsModel(
        'assets/drawer_img.png', 'Martin Mangram commented on your post', '1m ago'),
    NotificationsModel(
        'assets/drawer_img.png', 'Martin Mangram commented on your post', '1m ago'),
    NotificationsModel(
        'assets/drawer_img.png', 'Martin Mangram commented on your post', '1m ago'),
    NotificationsModel(
        'assets/drawer_img.png', 'Martin Mangram commented on your post', '1m ago'),
    NotificationsModel(
        'assets/drawer_img.png', 'Martin Mangram commented on your post', '1m ago'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Notifications', Icons.notifications),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
             // color: Colors.blue,
              child: ListView.builder(
                  itemCount: _list.length,
                  shrinkWrap: true,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                  // color: Colors.blue,
                   padding: EdgeInsets.only(left: 16.0, right: 16.0),
                   //   color: Colors.blue,
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                               // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset(_list[index].img, width: 40, height: 40),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            _list[index].txt,
                                            overflow: TextOverflow.visible,
                                            style: TextStyle(
                                                color: Colors.white, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        _list[index].offer != null ? Expanded(
                                          flex: 3,
                                          child: Text(
                                            _list[index].offer!,
                                            style: TextStyle(
                                              decoration: TextDecoration.underline,
                                                color: AppColor.yellowColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ) : Text(''),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    _list[index].time,
                                    style: TextStyle(
                                        color: AppColor.textGreyColor, fontSize: 12.0),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.white, height: 0)
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
