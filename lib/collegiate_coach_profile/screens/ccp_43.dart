import 'package:flutter/material.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/screens/ccp_42.dart';
import 'package:recruiter_flutter/collegiate_coach_profile/widget/ccp_app_bar.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

class CCP_43 extends StatefulWidget {
  const CCP_43({Key? key}) : super(key: key);

  @override
  _CCP_43State createState() => _CCP_43State();
}

class _CCP_43State extends State<CCP_43> {

  final TextEditingController _filter = TextEditingController();
  final TextEditingController _search = TextEditingController();

  bool _notification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: () {
                  setState(() {
                    _notification = true;
                  });
                  print('noti');
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CCP_42()));
                },
                child: _notification ?  Icon(Icons.notifications, color: Colors.white)
                    : Icon(Icons.notifications_none)
            ),
          ),
        ],
        bottom: PreferredSize(
            child: Container(
              color: const Color(0xFF474747),
              height: 4.0,
            ),
            preferredSize: const Size.fromHeight(4.0)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                        controller: _search,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 12.0),
                          filled: true,
                          fillColor: const Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Search",
                          labelStyle: const TextStyle(color: Color(0xFF686868)),
                          suffixIcon: const Icon(Icons.search, color: Color(0xFF686868)),
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
                        controller: _filter,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 8.0),
                          filled: true,
                          fillColor: const Color(0xFF111111),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Filter",
                          labelStyle: const TextStyle(color: Color(0xFF686868)),
                          suffixIcon:
                          Image.asset('assets/filter.png' , color: const Color(0xFF686868)),
                          //  prefixIcon: Icon(Icons.people),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                ],
              ),
            ),
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.40,
            //   width: MediaQuery.of(context).size.width,
            //   margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            //   padding: const EdgeInsets.all(10.0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12.0),
            //     color: const Color(0xFF111111),
            //   ),
            //   child: Column(
            //     children: [
            //       Row(
            //         children: [
            //           const CircleAvatar(
            //             backgroundImage: AssetImage('assets/drawer_img.png'),
            //             radius: 28,
            //           ),
            //           const SizedBox(width: 6),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               SizedBox(
            //                 //  color: Colors.blue,
            //                 width: MediaQuery.of(context).size.width * 0.7,
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   children: const [
            //                     Text(
            //                       'Martin Mangram',
            //                       style: TextStyle(color: Colors.white),
            //                     ),
            //                     Text(
            //                       ' - ',
            //                       style: TextStyle(color: Colors.grey),
            //                     ),
            //                     Text(
            //                       '1m',
            //                       style: TextStyle(color: Colors.grey),
            //                     ),
            //                     Spacer(),
            //                     Icon(Icons.more_horiz, color: Colors.white),
            //                     //     IconButton(
            //                     //         onPressed: () {},
            //                     //         icon: Icon(Icons.more_horiz))
            //                   ],
            //                 ),
            //               ),
            //               //  SizedBox(height: 4),
            //               const Text(
            //                 'After a great conversation with coach Ark \nCarter, I am extremely blessed to receive an \noffer from the University of Arkansas',
            //                 overflow: TextOverflow.visible,
            //                 style: TextStyle(
            //                     color: Colors.white, fontSize: 12),
            //               )
            //             ],
            //           )
            //         ],
            //       ),
            //       const SizedBox(height: 10),
            //       Column(
            //         children: [
            //           SizedBox(
            //             width: MediaQuery.of(context).size.width,
            //             child: Image.asset(
            //               'assets/posts_img_four.png',
            //               fit: BoxFit.fill,
            //             ),
            //           ),
            //           // SizedBox(width: 8),
            //           // Expanded(
            //           //   flex: 1,
            //           //   child: Container(
            //           //       height: 110,
            //           //       //  color: Colors.green,
            //           //       child: Image.asset(
            //           //         'assets/posts_img_two.png',
            //           //         fit: BoxFit.fill,
            //           //       )),
            //           // ),
            //           // SizedBox(height: 8),
            //           // Row(
            //           //   children: [
            //           //     Expanded(
            //           //       flex: 1,
            //           //       child: Container(
            //           //           height: 110,
            //           //           //  color: Colors.blue,
            //           //           child: Image.asset(
            //           //             'assets/posts_img_three.png',
            //           //             fit: BoxFit.fill,
            //           //           )),
            //           //     ),
            //           //     SizedBox(width: 8),
            //           //     Expanded(
            //           //       flex: 1,
            //           //       child: Container(
            //           //           height: 110,
            //           //           //  color: Colors.green,
            //           //           child: Image.asset(
            //           //             'assets/posts_img_four.png',
            //           //             fit: BoxFit.fill,
            //           //           )),
            //           //     )
            //           //   ],
            //           // ),
            //         ],
            //       ),
            //       const SizedBox(height: 16),
            //       Row(
            //         children: [
            //           Row(
            //             children: [
            //               Icon(Icons.favorite,
            //                   color: AppColor.greyBorderColor, size: 20),
            //               const SizedBox(width: 2),
            //               Text(
            //                 '1.1k',
            //                 style:
            //                 TextStyle(color: AppColor.greyBorderColor),
            //               )
            //             ],
            //           ),
            //           const SizedBox(width: 26),
            //           Row(
            //             children: [
            //               Icon(Icons.comment,
            //                   color: AppColor.greyBorderColor, size: 20),
            //               const SizedBox(width: 2),
            //               Text('1.1k',
            //                   style: TextStyle(
            //                       color: AppColor.greyBorderColor))
            //             ],
            //           ),
            //           const SizedBox(width: 26),
            //           Row(
            //             children: [
            //               Icon(Icons.star,
            //                   color: AppColor.greyBorderColor, size: 20),
            //               const SizedBox(width: 2),
            //               Text('1.1k',
            //                   style: TextStyle(
            //                       color: AppColor.greyBorderColor))
            //             ],
            //           ),
            //           // SizedBox(width: 16),
            //           const Spacer(),
            //           Icon(Icons.share,
            //               color: AppColor.greyBorderColor, size: 20),
            //         ],
            //       )
            //     ],
            //   ),
            // ),
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.31,
            //   width: MediaQuery.of(context).size.width,
            //   margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            //   decoration: const BoxDecoration(
            //     color: Color(0xFF111111),
            //     borderRadius: BorderRadius.all(Radius.circular(12.0)),
            //   ),
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            //         child: Align(
            //             alignment: Alignment.topRight,
            //             child: Icon(Icons.more_horiz,
            //                 color: AppColor.greyBorderColor)),
            //       ),
            //       Image.asset('assets/events_img1.png'),
            //       Padding(
            //         padding: const EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
            //         child: Row(
            //           children: [
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   'Fri, Oct 2nd',
            //                   style: TextStyle(
            //                       color: AppColor.yellowColor,
            //                       fontWeight: FontWeight.w500),
            //                 ),
            //                 const SizedBox(height: 2),
            //                 const Text(
            //                   'Private Football Camp',
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.w500,
            //                       fontSize: 16.0,
            //                       color: Colors.white),
            //                 ),
            //                 const SizedBox(height: 2),
            //                 Text(
            //                   'Ohio Stadium',
            //                   style: TextStyle(color: AppColor.greyBorderColor),
            //                 )
            //               ],
            //             ),
            //             const Spacer(),
            //             Column(
            //               children: [
            //                 Text('\$',
            //                     style: TextStyle(
            //                         color: AppColor.greyBorderColor, fontSize: 16.0, fontWeight: FontWeight.w500)),
            //                 const SizedBox(height: 4),
            //                 Container(
            //                   width: 46,
            //                   height: 24,
            //                   alignment: Alignment.center,
            //                   // padding: EdgeInsets.all(6.0),
            //                   decoration: BoxDecoration(
            //                       borderRadius: const BorderRadius.all(
            //                           Radius.circular(6.0)),
            //                       color: Colors.black,
            //                       border: Border.all(
            //                           color: AppColor.greyBorderColor)),
            //                   child: Text('Share', style: TextStyle(color: AppColor.greyBorderColor, fontSize: 12.0),),
            //                 )
            //               ],
            //             ),
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}