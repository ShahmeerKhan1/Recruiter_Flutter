import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';
import 'package:recruiter_flutter/model/notifications_model.dart';
import 'package:recruiter_flutter/school_athlete_profile/widgets/sap_app_bar.dart';
import 'package:recruiter_flutter/util/colors.dart';

class SAP_44 extends StatelessWidget {
  SAP_44({Key? key}) : super(key: key);

  final List<NotificationsModel> _list = [
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
      appBar: sapAppBar('Notifications', Icons.notifications, context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.blue,
              child: ListView.builder(
                  itemCount: _list.length,
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          // color: Colors.blue,
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
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
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            _list[index].txt,
                                            overflow: TextOverflow.visible,
                                            style: const TextStyle(
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
                                        ) : const Text(''),
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
                        const Divider(color: Colors.white, height: 0)
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