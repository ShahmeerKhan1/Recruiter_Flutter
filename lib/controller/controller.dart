
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController{

  final textController = TextEditingController();

  RxString controllerText = ''.obs;

  final List<String> homeTeam = ['Team 1', 'Team 2', 'Team 3'].obs;
  final List<String> awayTeam = ['Team X', 'Team Y', 'Team Z'].obs;

  RxString selectedHomeTeam = ''.obs;
  RxString selectedAwayTeam = ''.obs;

  RxString selectedVal1 = 'Team 1'.obs;
  RxString selectedVal2 = 'Team X'.obs;

  final List<String> names = <String>[].obs;

  var addGame = false;

  addItemToList() {
    names.insert(0, textController.text);
    print('names ki length $names');
  print('textcont text ${textController.text}');
  }

  //final imgFile = Rx<File?>;

 // Rx<File?> imgFile = (null).obs;

  changeStatus() {
    if(addGame){
      addGame = true;
      print(addGame);
    }
    else{
      addGame = false;
      print(addGame);
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    textController.addListener(() {
      controllerText.value = textController.text;
      print('getX ${controllerText.value = textController.text}');
    });
  }
}