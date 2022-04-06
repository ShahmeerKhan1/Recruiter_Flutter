import 'package:flutter/material.dart';

class NewMessagesModel {
  String profileImg, name, type, at;
  Widget circle;
  bool isSelected = false;

  NewMessagesModel(
      {required this.profileImg,
        required this.name,
        required this.type,
        required this.at,
        required this.circle,
        required this.isSelected});
}