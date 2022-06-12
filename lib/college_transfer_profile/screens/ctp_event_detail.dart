import 'package:flutter/material.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_37_1.dart';
import 'package:recruiter_flutter/college_transfer_profile/widgets/ctp_app_bar.dart';
import 'package:recruiter_flutter/model/events_model.dart';
import 'package:recruiter_flutter/util/colors.dart';

class CTPEventDetail extends StatefulWidget {
  final EventsModel data;

  const CTPEventDetail({Key? key, required this.data}) : super(key: key);

  @override
  _CTPEventDetailState createState() => _CTPEventDetailState();
}

class _CTPEventDetailState extends State<CTPEventDetail> {

  bool _rsvp = false;
  bool going = false;
  bool mayBe = false;
  bool notGoing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ctpAppBar('Events', Icons.notifications, context),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: widget.data.imgFile != null
                  ? Container(
                width: MediaQuery.of(context).size.width,
                //  height: 200,
                //  height: 200,
                decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(16.0)),
                  border: Border.all(color: const Color(0xFF474747)),
                ),
                child: Image.file(
                  widget.data.imgFile!,
                  fit: BoxFit.fill,
                ),
              ) :
              Image.asset(widget.data.img!),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, right: 8.0, left: 8.0, bottom: 8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.date,
                        style: TextStyle(
                            color: AppColor.yellowColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.data.match,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.data.location,
                        style: TextStyle(color: AppColor.greyBorderColor),
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(widget.data.rate,
                          style: TextStyle(
                              color: AppColor.textGreyColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: AppColor.greyBorderColor, height: 0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/pin.png'),
                      const SizedBox(width: 6),
                      Text(
                        '${widget.data.officeNo} ${widget.data.city} ${widget.data.state} ${widget.data.code}',
                        style: TextStyle(
                            color: AppColor.textGreyColor,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset('assets/dollar.png'),
                      const SizedBox(width: 6),
                      Text(
                        widget.data.rate,
                        style: TextStyle(
                            color: AppColor.yellowColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset('assets/time.png'),
                      const SizedBox(width: 6),
                      Text(
                        '${widget.data.from} to ${widget.data.to}',
                        style: TextStyle(
                            color: AppColor.textGreyColor,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Description',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0)),
                  const SizedBox(height: 8),
                  Text(
                     widget.data.desc,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _rsvp = !_rsvp;
                      });
                    },
                    child: Container(
                      width: 78,
                      height: 34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: _rsvp == false ?  Colors.black : const Color(0xFF2C4471),
                          borderRadius: const BorderRadius.all(Radius.circular(6)),
                          border: Border.all(
                              color: _rsvp == false ? AppColor.textGreyColor : const Color(0xFF2C4471), width: 2)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'RSVP',
                            style: TextStyle(
                                color: _rsvp == false ? AppColor.textGreyColor : Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 2),
                          Icon(Icons.calendar_today_outlined,
                              color: _rsvp == false ? AppColor.textGreyColor : Colors.white, size: 16)
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CTP37_1()));
                    },
                    child: Container(
                      width: 78,
                      height: 34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: const BorderRadius.all(Radius.circular(6)),
                          border: Border.all(
                              color: AppColor.textGreyColor, width: 2)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Invite',
                            style: TextStyle(
                                color: AppColor.textGreyColor,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 2),
                          Icon(Icons.add,
                              color: AppColor.textGreyColor, size: 18)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 78,
                    height: 34,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: const BorderRadius.all(Radius.circular(6)),
                        border: Border.all(
                            color: AppColor.textGreyColor, width: 2)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Share',
                          style: TextStyle(
                              color: AppColor.textGreyColor,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 2),
                        Icon(Icons.share,
                            color: AppColor.textGreyColor, size: 16)
                      ],
                    ),
                  ),
                  Container(
                    width: 82,
                    height: 34,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: const BorderRadius.all(Radius.circular(6)),
                        border: Border.all(
                            color: AppColor.textGreyColor, width: 2)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Remove',
                          style: TextStyle(
                              color: AppColor.textGreyColor,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 2),
                        Icon(Icons.delete,
                            color: AppColor.textGreyColor, size: 18)
                      ],
                    ),
                  )
                ],
              ),
            ),
            _rsvp == true ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        going = !going;
                      });
                    },
                    child: Container(
                      height: 42,
                      width: 106,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: going ? const Color(0xFF239B36) : const Color(0xFF010C21),
                        border: Border.all(
                          color: const Color(0xFF239B36),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                      ),
                      child: Text(
                        'Going',
                        style: TextStyle(
                            color: !going ? const Color(0xFF239B36) : Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        mayBe = !mayBe;
                      });
                    },
                    child: Container(
                      height: 42,
                      width: 106,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: mayBe ? const Color(0xFF989203) : const Color(0xFF010C21),
                        border: Border.all(
                          color: const Color(0xFF989203),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                      ),
                      child: Text(
                        'May Be',
                        style: TextStyle(
                            color: !mayBe ? const Color(0xFF989203) : Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        notGoing = !notGoing;
                      });
                    },
                    child: Container(
                      height: 42,
                      width: 106,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: notGoing ? const Color(0xFF8c0900) : const Color(0xFF010C21),
                        border: Border.all(
                          color: const Color(0xFF8C0900),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                      ),
                      child: Text(
                        'Not Going',
                        style: TextStyle(
                            color: !notGoing ? const Color(0xFF8C0900) : Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}