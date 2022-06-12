import 'dart:io';


class OfferSentModel {
  File? img;
  String uniName, athleteName, date, offerType;

  OfferSentModel(
      {required this.img,
      required this.uniName,
      required this.athleteName,
      required this.date,
      required this.offerType});
}
