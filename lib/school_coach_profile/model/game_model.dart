import 'dart:io';

class GameModel{
  File? image;
  String title;
  String description;
  String date;
  String location;
  String homeTeam;
  String homeScore;
  String awayTeam;
  String awayScore;
  GameModel({required this.image,required this.title,required this.description,
    required this.date,required this.location,required this.homeTeam,
    required this.homeScore,required this.awayTeam,required this.awayScore});

}