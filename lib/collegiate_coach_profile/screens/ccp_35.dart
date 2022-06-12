import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_app_bar.dart';
import 'package:recruiter_flutter/model/calendar_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP_35 extends StatefulWidget {
  final DateTime initialDate = DateTime.now();

  CCP_35({Key? key}) : super(key: key);

  @override
  _CCP_35State createState() => _CCP_35State();
}

class _CCP_35State extends State<CCP_35> {
  TextEditingController search = TextEditingController();
  TextEditingController filter = TextEditingController();

  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  List months = [
    'Jan',
    'Feb',
    'Mar',
    'April',
    'May',
    'Jun',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  final List<CalendarModel> _list = [
    CalendarModel(
        img: 'assets/events_img1.png',
        date: 'Fri, Oct 2nd',
        match: 'Private Football Camp',
        location: 'Ohio Stadium',
        schedule: 'Going',
        color: const Color(0xFF239B36)
    ),
    CalendarModel(
        img: 'assets/events_img2.png',
        date: 'Fri, Oct 2nd',
        match: 'Ohio State \nUniversity Football Camp',
        location: 'Ohio Stadium',
        schedule: 'May Be',
        color: const Color(0xFFB9B200)
    ),
    CalendarModel(
        img: 'assets/events_img1.png',
        date: 'Fri, Oct 2nd',
        match: 'Private Football Camp',
        location: 'Ohio Stadium',
        schedule: 'Going',
        color: const Color(0xFF239B36)),
    CalendarModel(
        img: 'assets/events_img1.png',
        date: 'Fri, Oct 2nd',
        match: 'Private Football Camp',
        location: 'Ohio Stadium',
        schedule: 'Not Going',
        color: const Color(0xFF239B36)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ccpAppBar('Calendar', Icons.notifications, context),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              showMonthPicker(
                context: context,
                firstDate: DateTime(DateTime.now().year - 1, 5),
                lastDate: DateTime(DateTime.now().year + 1, 9),
                initialDate: selectedDate ?? widget.initialDate,
                //  locale: Locale("es"),
              ).then((date) {
                if (date != null) {
                  setState(() {
                    selectedDate = date;
                  });
                }
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: const Color(0xFF111111),
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios, color: AppColor.textGreyColor),
                      const SizedBox(width: 12),
                      Text(
                        months[selectedDate!.month - 1],
                        style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${selectedDate?.year}',
                        style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.arrow_forward_ios,
                          color: AppColor.textGreyColor)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: const Color(0xFF111111),
            // color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                        controller: search,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 16.0),
                          filled: true,
                          fillColor: const Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Search for Events",
                          labelStyle: const TextStyle(color: Color(0xFF686868)),
                          suffixIcon:
                          const Icon(Icons.search, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: TextField(
                        controller: filter,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 16.0),
                          filled: true,
                          fillColor: const Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Filter",
                          labelStyle: const TextStyle(color: Color(0xFF686868)),
                          suffixIcon:
                          const Icon(Icons.filter, color: Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              //  primary: false,
                shrinkWrap: true,
                itemCount: _list.length,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      //   Navigator.push(context, MaterialPageRoute(builder: (_) => SCP36_1()));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
                      margin: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0, bottom: 6.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFF111111),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 180,
                                  width: 140,
                                  child: Image.asset(_list[index].img,
                                      fit: BoxFit.cover)),
                              const SizedBox(width: 6),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _list[index].date,
                                      style: TextStyle(
                                          color: AppColor.yellowColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0),
                                    ),
                                    const SizedBox(height: 4),
                                    SizedBox(
                                      width: 160,
                                      // color: Colors.blue,
                                      // height: MediaQuery.of(context).size.height,
                                      child: Text(
                                        _list[index].match,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _list[index].location,
                                      style: TextStyle(
                                          color: AppColor.greyBorderColor),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.more_horiz,
                                        color: AppColor.textGreyColor)),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 36,
                              width: 82,
                              margin: const EdgeInsets.only(right: 2.0, bottom: 6.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _list[index].color,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Text(
                                _list[index].schedule,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

