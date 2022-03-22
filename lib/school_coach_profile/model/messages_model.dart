import 'package:flutter/material.dart';

class MessagesModel {
  String profileImg, name, type, msg, time;
  IconData info, star;
  bool isSelected = false;

  MessagesModel(
      {required this.profileImg,
      required this.name,
      required this.type,
      required this.msg,
      required this.time,
      required this.info,
      required this.star,
      required this.isSelected});
}
