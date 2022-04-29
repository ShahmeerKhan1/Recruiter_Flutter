import 'dart:io';

class EventsModel {
  String date, match, desc, location, rate, share, from, to, officeNo, city, state, code;
  String? img;
  File? imgFile;

  EventsModel(
      {this.img,
      required this.date,
      required this.match,
      required this.location,
      required this.desc,
      required this.rate,
      required this.from,
      required this.to,
      required this.share,
        required this.officeNo,
        required this.city,
        required this.state,
        required this.code,
      this.imgFile});
}
