import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruiter_flutter/controller/new_post_controller.dart';
import 'package:recruiter_flutter/util/colors.dart';

Widget sapPostTab() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: GetBuilder<PostController>(
        builder: (_const) {
          if (_const.postLists.isNotEmpty) {
            return ListView.builder(
                itemCount: _const.postLists.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      print('card tapped');
                      // Navigator.push(
                      //   context, MaterialPageRoute(builder: (context) => CTP9_1(data: _const.postLists[index]),
                      //   ),
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.46,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF111111),
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
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
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
                                                style: TextStyle(color: Colors.white),
                                              ),
                                              Text(
                                                '- ',
                                                style: TextStyle(color: Colors.grey),
                                              ),
                                              Text(
                                                _const.postLists[index].time,
                                                style: TextStyle(color: Colors.grey),
                                              ),
                                              Spacer(),
                                              Icon(Icons.more_horiz,
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
                                            TextStyle(color: Colors.white, fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
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
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.favorite,
                                        color: AppColor.greyBorderColor, size: 20),
                                    SizedBox(width: 2),
                                    Text(
                                      _const.postLists[index].like,
                                      style: TextStyle(
                                          color: AppColor.greyBorderColor),
                                    )
                                  ],
                                ),
                                SizedBox(width: 26),
                                Row(
                                  children: [
                                    Icon(Icons.comment,
                                        color: AppColor.greyBorderColor, size: 20),
                                    SizedBox(width: 2),
                                    Text(_const.postLists[index].comment,
                                        style:
                                        TextStyle(color: AppColor.greyBorderColor))
                                  ],
                                ),
                                SizedBox(width: 26),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: AppColor.greyBorderColor, size: 20),
                                    SizedBox(width: 2),
                                    Text(_const.postLists[index].star,
                                        style:
                                        TextStyle(color: AppColor.greyBorderColor))
                                  ],
                                ),
                                // SizedBox(width: 16),
                                Spacer(),
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
            return Center(child: Text('Please Add Posts', style: TextStyle(color: Colors.white)),);
          }
        }
    ),
  );
}