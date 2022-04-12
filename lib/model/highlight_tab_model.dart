import 'dart:io';

import 'package:video_player/video_player.dart';

class HighLightTabModel {
  String profileImg, userName, time, title, desc, like, comment, star;

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
    required this.VideoController,
    required this.initializeVideoPlayerFuture
  });
}
