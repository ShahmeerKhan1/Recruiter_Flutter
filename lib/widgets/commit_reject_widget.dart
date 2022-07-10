import 'package:flutter/material.dart';
import 'package:recruiter_flutter/model/offers_model.dart';
import 'package:recruiter_flutter/util/colors.dart';

class CommitRejectWidget<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final String text1, text2;
  final Color color;

  CommitRejectWidget(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.text1,
      required this.text2,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return InkWell(
        onTap: () {
          onChanged(value);
        },
        child: Column(
          children: [
            Container(
              height: 26,
              width: 82,
              //  margin: EdgeInsets.only(right: 2.0, bottom: 6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: isSelected ? color : Color(0xFF111111),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  border: Border.all(
                      color: !isSelected
                          ? AppColor.textGreyColor
                          : const Color(0xFF111111))),
              child: !isSelected
                  ? Text(
                      text1,
                      style: TextStyle(
                          color: AppColor.textGreyColor,
                          fontWeight: FontWeight.w500),
                    )
                  : Text(
                      text2,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
            ),
          ],
        ));
  }
}
