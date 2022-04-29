import 'package:flutter/material.dart';

class OffersModel {
  String img, date, name, type, commit, location;

  OffersModel(
      {required this.img,
        required this.date,
        required this.name,
        required this.location,
        required this.type,
      required this.commit});
}