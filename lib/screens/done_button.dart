import 'package:flutter/material.dart';
import 'package:flutter_todo/helper/color_helper.dart';
import 'package:flutter_todo/helper/dimension_helper.dart';
import 'package:flutter_todo/helper/font_helper.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: DimensionHelper.size_35,
      width: DimensionHelper.size_130,
      decoration: BoxDecoration(
        color: ColorHelper.primarycolor,
        borderRadius: BorderRadius.circular(DimensionHelper.size_50),
      ),
      child: Text(
        'Done',
        style: TextStyle(
          color: ColorHelper.whitecolor,
          fontSize: FontHelper.font_16,
          fontWeight: FontHelper.w500,
        ),
      ),
    );
  }
}
