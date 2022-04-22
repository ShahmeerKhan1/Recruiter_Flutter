import 'dart:io';

import 'package:flutter/material.dart';

class StatsModel {
  String date, team, location, status, ratio, rating;
  File? image;
  IconData? dlt;
  Color color;

  StatsModel(
      {required this.date,
      required this.team,
      required this.location,
      required this.status,
      required this.ratio,
      required this.rating,
      required this.color, this.dlt, this.image});
}
