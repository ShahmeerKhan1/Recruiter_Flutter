import 'dart:io';

import 'package:flutter/material.dart';

class NewPostModel {
  String text, profileImg;
  File? img;

  NewPostModel({required this.text, required this.profileImg, required this.img});
}