import 'dart:io';

import 'package:get/get.dart';
import 'package:recruiter_flutter/model/game_model.dart';
import 'package:recruiter_flutter/model/highlight_tab_model.dart';
import 'package:recruiter_flutter/model/post_tab_model.dart';

class HighlightController extends GetxController{

  List<HighLightTabModel> highlightList = <HighLightTabModel>[];

  @override
  void onInit() {
    super.onInit();
  }
}