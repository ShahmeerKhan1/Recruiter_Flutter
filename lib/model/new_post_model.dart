import 'dart:io';


class NewPostModel {
  String text, profileImg;
  File? img;

  NewPostModel({required this.text, required this.profileImg, required this.img});
}