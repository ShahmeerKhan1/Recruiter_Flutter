import 'package:flutter/material.dart';

class CalendarModel {
  String img, date, match, location, schedule;
  Color color;

  CalendarModel(
      {required this.img,
      required this.date,
      required this.match,
      required this.location,
      required this.schedule,
      required this.color});
}
