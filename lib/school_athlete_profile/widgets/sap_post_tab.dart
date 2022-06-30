import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/controller/new_post_controller.dart';
import 'package:recruiter_flutter/school_athlete_profile/controller/new_post_sap.dart';
import 'package:recruiter_flutter/school_athlete_profile/screens/sap_9.dart';
import 'package:recruiter_flutter/util/colors.dart';

class SAPPostTab extends StatefulWidget {
  const SAPPostTab({Key? key}) : super(key: key);

  @override
  _SAPPostTabState createState() => _SAPPostTabState();
}

class _SAPPostTabState extends State<SAPPostTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GetBuilder<PostControllerSAP>(
          builder: (_const) {
            if (_const.postLists.isNotEmpty) {
              return ListView.builder(
                  itemCount: _const.postLists.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () async {
                        await Navigator.of(context, rootNavigator: true).
                        push(
                          MaterialPageRoute(
                            builder: (context) => SAP_9(data: _const.postLists[index]),
                          ),
                        );
                        setState(() {

                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          height: _const.postLists[index].img != null ?
                          MediaQuery.of(context).size.height * 0.46 :
                          MediaQuery.of(context).size.height * 0.14,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
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
                                          _const.postLists[index].profileImg),
                                      radius: 24,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            //  color: Colors.blue,
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.7,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                  _const.postLists[index].userName,
                                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                                ),
                                                const Text(
                                                  '- ',
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                                Text(
                                                  _const.postLists[index].time,
                                                  style: const TextStyle(color: Colors.grey),
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
                                              _const.postLists[index].desc,
                                              style:
                                              TextStyle(color: Colors.white,
                                                  fontSize: 13, fontWeight: FontWeight.normal),
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
                              _const.postLists[index].img != null ? Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(child: _const.postLists[index].img != null ?
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Image.file(_const.postLists[index].img!, fit: BoxFit.fill),
                                    ) : Container()),
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
                              ) : Container(color: Colors.green,),
                              //    : Image.file(_con.postListsCtp[index].img!),
                              //  const SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0, left: 2.0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              _const.postLists[index].heartReact = !_const.postLists[index].heartReact;
                                            });
                                            print('heart toggle');
                                          },
                                          child: !_const.postLists[index].heartReact ? Icon(Icons.favorite_outline,
                                              color: AppColor.greyBorderColor, size: 20)
                                              : Icon(Icons.favorite,
                                              color: Colors.red, size: 20),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          _const.postLists[index].like,
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
                                        Text(_const.postLists[index].comment,
                                            style:
                                            TextStyle(color: AppColor.greyBorderColor))
                                      ],
                                    ),
                                    const SizedBox(width: 30),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              _const.postLists[index].starReact = !_const.postLists[index].starReact;
                                            });
                                          },
                                          child: !_const.postLists[index].starReact ? Icon(Icons.star_border,
                                              color: AppColor.greyBorderColor, size: 20)
                                              : Icon(Icons.star,
                                              color: AppColor.goldenColor, size: 20),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(_const.postLists[index].star,
                                            style:
                                            TextStyle(color: AppColor.greyBorderColor))
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
                  }
              ); }
            else {
              return const Center(child: Text('Please Add Posts', style: TextStyle(color: Colors.white)),);
            }
          }
      ),
    );
  }
}


Widget sapPostTab() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: GetBuilder<PostControllerSAP>(
        builder: (_const) {
          if (_const.postLists.isNotEmpty) {
            return ListView.builder(
                itemCount: _const.postLists.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      print('card tapped');
                       Navigator.push(
                         context, MaterialPageRoute(builder: (context) => SAP_9(data: _const.postLists[index]),
                         ),
                       );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.46,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: const Color(0xFF111111),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        _const.postLists[index].profileImg),
                                    radius: 28,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          //  color: Colors.blue,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.7,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: [
                                              Text(
                                                _const.postLists[index].userName,
                                                style: const TextStyle(color: Colors.white),
                                              ),
                                              const Text(
                                                '- ',
                                                style: TextStyle(color: Colors.grey),
                                              ),
                                              Text(
                                                _const.postLists[index].time,
                                                style: const TextStyle(color: Colors.grey),
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
                                            _const.postLists[index].desc,
                                            style:
                                            const TextStyle(color: Colors.white, fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            //  _con.postLists[index].img == null ?
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(child: _const.postLists[index].img != null ?
                                  Image.file(_const.postLists[index].img!, fit: BoxFit.fill) : Container()),
                                  // Row(
                                  //   children: [
                                  //     Expanded(
                                  //       flex: 1,
                                  //       child: Container(
                                  //           height: 110,
                                  //           //  color: Colors.blue,
                                  //           child: Image.asset(
                                  //             _const.postLists[index].img1,
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
                                  //             _const.postLists[index].img2,
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
                                  //             _const.postLists[index].img3,
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
                                  //             _const.postLists[index].img4,
                                  //             fit: BoxFit.fill,)),
                                  //     )
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                            //    : Image.file(_con.postLists[index].img!),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.favorite,
                                        color: AppColor.greyBorderColor, size: 20),
                                    const SizedBox(width: 2),
                                    Text(
                                      _const.postLists[index].like,
                                      style: TextStyle(
                                          color: AppColor.greyBorderColor),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 26),
                                Row(
                                  children: [
                                    Icon(Icons.comment,
                                        color: AppColor.greyBorderColor, size: 20),
                                    const SizedBox(width: 2),
                                    Text(_const.postLists[index].comment,
                                        style:
                                        TextStyle(color: AppColor.greyBorderColor))
                                  ],
                                ),
                                const SizedBox(width: 26),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: AppColor.greyBorderColor, size: 20),
                                    const SizedBox(width: 2),
                                    Text(_const.postLists[index].star,
                                        style:
                                        TextStyle(color: AppColor.greyBorderColor))
                                  ],
                                ),
                                // SizedBox(width: 16),
                                const Spacer(),
                                Icon(Icons.share,
                                    color: AppColor.greyBorderColor, size: 20),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ); }
          else {
            return const Center(child: Text('Please Add Posts', style: TextStyle(color: Colors.white)),);
          }
        }
    ),
  );
}