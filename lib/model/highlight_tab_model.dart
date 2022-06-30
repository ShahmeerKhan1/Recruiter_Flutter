import 'dart:io';

import 'package:video_player/video_player.dart';

class HighLightTabModel {
  String profileImg, userName, time, title, desc, like, comment, star;
  bool heartReact;
  bool starReact;

   File? video;
  VideoPlayerController? VideoController;
  Future<void>? initializeVideoPlayerFuture;

  HighLightTabModel({
    required this.profileImg,
    required this.userName,
    required this.time,
    required this.title,
    required this.desc,
    required this.like,
    required this.comment,
    required this.star,
    required this.video,
    required this.heartReact,
    required this.starReact,
    required this.VideoController,
    required this.initializeVideoPlayerFuture
  });
}
