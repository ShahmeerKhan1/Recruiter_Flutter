import 'dart:io';

class PostTabModel {
    String profileImg,
      userName,
      time,
      desc,
      img1,
      img2,
      img3,
      img4,
      like,
      comment,
      star;

    File? img;

  PostTabModel(
      {required this.profileImg,
      required this.userName,
      required this.time,
      required this.desc,
      required this.img1,
      required this.img2,
      required this.img3,
      required this.img4,
      required this.like,
      required this.comment,
      required this.star,
          this.img
      });
}
