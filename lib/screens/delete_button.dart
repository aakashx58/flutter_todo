import 'package:flutter/material.dart';
import 'package:flutter_todo/helper/color_helper.dart';
import 'package:flutter_todo/helper/dimension_helper.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: DimensionHelper.size_35,
      width: DimensionHelper.size_80,
      decoration: BoxDecoration(
        color: ColorHelper.redColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(DimensionHelper.size_50),
      ),
      child: Icon(
        Icons.delete_outline,
        color: ColorHelper.redColor,
      ),
    );
  }
}
