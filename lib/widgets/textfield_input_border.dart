import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';

OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
  return OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: AppColor.borderColor,
        width: 2,
      )
  );
}