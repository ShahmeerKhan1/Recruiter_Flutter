import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';

OutlineInputBorder myfocusborder(){
  return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: AppColor.borderColor,
        width: 2,
      )
  );
}