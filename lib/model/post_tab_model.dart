import 'dart:io';

import 'package:flutter/cupertino.dart';

class PostTabModel {
    String profileImg,
      userName,
      time,
      desc,
      // img1,
      // img2,
      // img3,
      // img4,
      like,
      comment,
      star;

    File? img;
    bool heartReact;
    bool starReact;

  PostTabModel(
      {required this.profileImg,
      required this.userName,
      required this.time,
      required this.desc,
      // required this.img1,
      // required this.img2,
      // required this.img3,
      // required this.img4,
      required this.like,
      required this.comment,
      required this.star,
          required this.heartReact,
          required this.starReact,
          this.img
      });
}
