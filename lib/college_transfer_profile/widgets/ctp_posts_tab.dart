import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:recruiter_flutter/college_transfer_profile/controller/new_post_ctp.dart';
import 'package:recruiter_flutter/college_transfer_profile/screens/ctp_9_1.dart';
import 'package:recruiter_flutter/controller/new_post_controller.dart';
import 'package:recruiter_flutter/util/colors.dart';

class CTPPostTab extends StatefulWidget {
  const CTPPostTab({Key? key}) : super(key: key);

  @override
  _CTPPostTabState createState() => _CTPPostTabState();
}

class _CTPPostTabState extends State<CTPPostTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GetBuilder<PostControllerCTP>(
          builder: (_const) {
        if (_const.postListsCtp.isNotEmpty) {
          return Align(
            alignment: Alignment.topCenter,
            child: ListView.builder(
                itemCount: _const.postListsCtp.length,
                shrinkWrap: true,
                reverse: true,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () async {
                      //  setState(() {
                      await Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(
                        builder: (context) =>
                            CTP9_1(data: _const.postListsCtp[index]),
                      ));
                      setState(() {});
                      // pushNewScreen(
                      //   context,
                      //   screen: CTP9_1(data: _const.postListsCtp[index]),
                      //   withNavBar: true, // OPTIONAL VALUE. True by default.
                      //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xFF111111)),
                        constraints: BoxConstraints(
                          minWidth: 300.0,
                          maxWidth: 300.0,
                          minHeight: _const.postListsCtp[index].img != null ?
                          MediaQuery.of(context).size.height * 0.46 : 30.0,
                          maxHeight: _const.postListsCtp[index].img != null ?
                          MediaQuery.of(context).size.height * 0.46 : 100.0,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        _const.postListsCtp[index].profileImg),
                                    radius: 24,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          //  color: Colors.blue,
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.7,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                _const
                                                    .postListsCtp[index].userName,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              const Text(
                                                '- ',
                                                style:
                                                    TextStyle(color: Colors.grey),
                                              ),
                                              Text(
                                                _const.postListsCtp[index].time,
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              const Spacer(),
                                              const Icon(Icons.more_horiz,
                                                  color: Colors.white),
                                              //     IconButton(
                                              //         onPressed: () {},
                                              //         icon: Icon(Icons.more_horiz))
                                            ],
                                          ),
                                        ),
                                        //  SizedBox(height: 4),
                                        Expanded(
                                          child: Text(
                                            _const.postListsCtp[index].desc,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 6),
                            //  _con.postListsCtp[index].img == null ?
                            _const.postListsCtp[index].img != null
                                ? Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                            child: _const.postListsCtp[index]
                                                        .img !=
                                                    null
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 8.0),
                                                    child: Image.file(
                                                        _const.postListsCtp[index]
                                                            .img!,
                                                        fit: BoxFit.fill),
                                                  )
                                                : Container()),
                                        // Row(
                                        //   children: [
                                        //     Expanded(
                                        //       flex: 1,
                                        //       child: Container(
                                        //           height: 110,
                                        //           //  color: Colors.blue,
                                        //           child: Image.asset(
                                        //             _const.postListsCtp[index].img1,
                                        //             fit: BoxFit.fill,)
                                        //       ),
                                        //     ),
                                        //     SizedBox(width: 8),
                                        //     Expanded(
                                        //       flex: 1,
                                        //       child: Container(
                                        //           height: 110,
                                        //           //  color: Colors.green,
                                        //           child: Image.asset(
                                        //             _const.postListsCtp[index].img2,
                                        //             fit: BoxFit.fill,)),
                                        //     )
                                        //   ],
                                        // ),
                                        // SizedBox(height: 8),
                                        // Row(
                                        //   children: [
                                        //     Expanded(
                                        //       flex: 1,
                                        //       child: Container(
                                        //           height: 110,
                                        //           //  color: Colors.blue,
                                        //           child: Image.asset(
                                        //             _const.postListsCtp[index].img3,
                                        //             fit: BoxFit.fill,)
                                        //       ),
                                        //     ),
                                        //     SizedBox(width: 8),
                                        //     Expanded(
                                        //       flex: 1,
                                        //       child: Container(
                                        //           height: 110,
                                        //           //  color: Colors.green,
                                        //           child: Image.asset(
                                        //             _const.postListsCtp[index].img4,
                                        //             fit: BoxFit.fill,)),
                                        //     )
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    color: Colors.green,
                                  ),
                            //    : Image.file(_con.postListsCtp[index].img!),
                            //  const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, left: 2.0),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _const.postListsCtp[index]
                                                    .heartReact =
                                                !_const.postListsCtp[index]
                                                    .heartReact;
                                          });
                                          print('heart toggle');
                                        },
                                        child: !_const
                                                .postListsCtp[index].heartReact
                                            ? Icon(Icons.favorite_outline,
                                                color: AppColor.greyBorderColor,
                                                size: 20)
                                            : Icon(Icons.favorite,
                                                color: Colors.red, size: 20),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        _const.postListsCtp[index].like,
                                        style: TextStyle(
                                            color: AppColor.greyBorderColor),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 30),
                                  Row(
                                    children: [
                                      Icon(Icons.mode_comment_outlined,
                                          color: AppColor.greyBorderColor,
                                          size: 20),
                                      const SizedBox(width: 4),
                                      Text(_const.postListsCtp[index].comment,
                                          style: TextStyle(
                                              color: AppColor.greyBorderColor))
                                    ],
                                  ),
                                  const SizedBox(width: 30),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _const.postListsCtp[index].starReact =
                                                !_const.postListsCtp[index]
                                                    .starReact;
                                          });
                                        },
                                        child: !_const
                                                .postListsCtp[index].starReact
                                            ? Icon(Icons.star_border,
                                                color: AppColor.greyBorderColor,
                                                size: 20)
                                            : Icon(Icons.star,
                                                color: AppColor.goldenColor,
                                                size: 20),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(_const.postListsCtp[index].star,
                                          style: TextStyle(
                                              color: AppColor.greyBorderColor))
                                    ],
                                  ),
                                  // SizedBox(width: 16),
                                  const Spacer(),
                                  Icon(Icons.share,
                                      color: AppColor.greyBorderColor, size: 20),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else {
          return const Center(
            child:
                Text('Please Add Posts', style: TextStyle(color: Colors.white)),
          );
        }
      }),
    );
  }
}

Widget ctpPostsTab() {
  // final List<PostTabModel> _postData = [
  //   // PostTabModel(
  //   //     profileImg: 'assets/drawer_img.png',
  //   //     userName: 'Martin Mangram ',
  //   //     time: '1m',
  //   //     desc: "After a great conversation with coach Ark\nCarter, I am extremely blessed to receive \nan offer from the University of Arkansas",
  //   //     like: '1.1k',
  //   //     comment: '1.1k',
  //   //     star: '1.1k',
  //   //     img1: 'assets/posts_img_one.png',
  //   //     img2: 'assets/posts_img_two.png',
  //   //     img3: 'assets/posts_img_three.png',
  //   //     img4: 'assets/posts_img_four.png'
  //   // ),
  //
  //   // PostTabModel(
  //   //     profileImg: 'assets/drawer_img.png',
  //   //     userName: 'Martin Mangram ',
  //   //     time: '1m',
  //   //     desc: "After a great conversation with coach Ark\nCarter, I am extremely blessed to receive \nan offer from the University of Arkansas",
  //   //     like: '1.1k',
  //   //     comment: '2.2k',
  //   //     star: '2.2k',
  //   //     img1: 'assets/posts_img_one.png',
  //   //     img2: 'assets/posts_img_two.png',
  //   //     img3: 'assets/posts_img_three.png',
  //   //     img4: 'assets/posts_img_four.png'
  //   // ),
  //   //
  //   // PostTabModel(
  //   //     profileImg: 'assets/drawer_img.png',
  //   //     userName: 'Martin Mangram ',
  //   //     time: '1m',
  //   //     desc: "After a great conversation with coach Ark\nCarter, I am extremely blessed to receive \nan offer from the University of Arkansas",
  //   //     like: '1.1k',
  //   //     comment: '1.1k',
  //   //     star: '1.1k',
  //   //     img1: 'assets/posts_img_one.png',
  //   //     img2: 'assets/posts_img_two.png',
  //   //     img3: 'assets/posts_img_three.png',
  //   //     img4: 'assets/posts_img_four.png'
  //   // ),
  // ];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: GetBuilder<PostControllerCTP>(builder: (_const) {
      if (_const.postListsCtp.isNotEmpty) {
        return ListView.builder(
            itemCount: _const.postListsCtp.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  height: _const.postListsCtp[index].img != null
                      ? MediaQuery.of(context).size.height * 0.46
                      : MediaQuery.of(context).size.height * 0.145,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  //  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: const Color(0xFF111111),
                    // color: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  _const.postListsCtp[index].profileImg),
                              radius: 24,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    //  color: Colors.blue,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          _const.postListsCtp[index].userName,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Text(
                                          '- ',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          _const.postListsCtp[index].time,
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        const Spacer(),
                                        const Icon(Icons.more_horiz,
                                            color: Colors.white),
                                        //     IconButton(
                                        //         onPressed: () {},
                                        //         icon: Icon(Icons.more_horiz))
                                      ],
                                    ),
                                  ),
                                  //  SizedBox(height: 4),
                                  Expanded(
                                    child: Text(
                                      _const.postListsCtp[index].desc,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      //  _con.postListsCtp[index].img == null ?
                      _const.postListsCtp[index].img != null
                          ? Expanded(
                              flex: 5,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CTP9_1(
                                            data: _const.postListsCtp[index]),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                          child: _const.postListsCtp[index]
                                                      .img !=
                                                  null
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8.0),
                                                  child: Image.file(
                                                      _const.postListsCtp[index]
                                                          .img!,
                                                      fit: BoxFit.fill),
                                                )
                                              : Container()),
                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //       flex: 1,
                                      //       child: Container(
                                      //           height: 110,
                                      //           //  color: Colors.blue,
                                      //           child: Image.asset(
                                      //             _const.postListsCtp[index].img1,
                                      //             fit: BoxFit.fill,)
                                      //       ),
                                      //     ),
                                      //     SizedBox(width: 8),
                                      //     Expanded(
                                      //       flex: 1,
                                      //       child: Container(
                                      //           height: 110,
                                      //           //  color: Colors.green,
                                      //           child: Image.asset(
                                      //             _const.postListsCtp[index].img2,
                                      //             fit: BoxFit.fill,)),
                                      //     )
                                      //   ],
                                      // ),
                                      // SizedBox(height: 8),
                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //       flex: 1,
                                      //       child: Container(
                                      //           height: 110,
                                      //           //  color: Colors.blue,
                                      //           child: Image.asset(
                                      //             _const.postListsCtp[index].img3,
                                      //             fit: BoxFit.fill,)
                                      //       ),
                                      //     ),
                                      //     SizedBox(width: 8),
                                      //     Expanded(
                                      //       flex: 1,
                                      //       child: Container(
                                      //           height: 110,
                                      //           //  color: Colors.green,
                                      //           child: Image.asset(
                                      //             _const.postListsCtp[index].img4,
                                      //             fit: BoxFit.fill,)),
                                      //     )
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              color: Colors.green,
                            ),
                      //    : Image.file(_con.postListsCtp[index].img!),
                      //  const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 2.0),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Icon(Icons.favorite_outline,
                                      color: AppColor.greyBorderColor,
                                      size: 20),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  _const.postListsCtp[index].like,
                                  style: TextStyle(
                                      color: AppColor.greyBorderColor),
                                )
                              ],
                            ),
                            const SizedBox(width: 30),
                            Row(
                              children: [
                                Icon(Icons.mode_comment_outlined,
                                    color: AppColor.greyBorderColor, size: 20),
                                const SizedBox(width: 4),
                                Text(_const.postListsCtp[index].comment,
                                    style: TextStyle(
                                        color: AppColor.greyBorderColor))
                              ],
                            ),
                            const SizedBox(width: 30),
                            Row(
                              children: [
                                Icon(Icons.star_border,
                                    color: AppColor.greyBorderColor, size: 20),
                                const SizedBox(width: 4),
                                Text(_const.postListsCtp[index].star,
                                    style: TextStyle(
                                        color: AppColor.greyBorderColor))
                              ],
                            ),
                            // SizedBox(width: 16),
                            const Spacer(),
                            Icon(Icons.share,
                                color: AppColor.greyBorderColor, size: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      } else {
        return const Center(
          child:
              Text('Please Add Posts', style: TextStyle(color: Colors.white)),
        );
      }
    }),
  );
}
