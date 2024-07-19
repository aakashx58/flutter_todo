import 'package:flutter/material.dart';
import 'package:flutter_todo/helper/color_helper.dart';
import 'package:flutter_todo/helper/dimension_helper.dart';
import 'package:flutter_todo/helper/font_helper.dart';
import 'package:flutter_todo/models/get_all_todo_model.dart';

class DoneButton extends StatelessWidget {
  final Items items;
  const DoneButton({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (items.isCompleted == false) {}
      },
      child: Container(
        alignment: Alignment.center,
        height: DimensionHelper.size_35,
        width: DimensionHelper.size_130,
        decoration: BoxDecoration(
          color: ColorHelper.primarycolor,
          borderRadius: BorderRadius.circular(DimensionHelper.size_50),
        ),
        child: Text(
          items.isCompleted == true ? 'Done' : 'Mark as Done',
          style: TextStyle(
            color: ColorHelper.whitecolor,
            fontSize: FontHelper.font_16,
            fontWeight: FontHelper.w500,
          ),
        ),
      ),
    );
  }
}
