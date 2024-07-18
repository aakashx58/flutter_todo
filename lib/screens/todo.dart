import 'package:flutter/material.dart';
import 'package:flutter_todo/helper/color_helper.dart';
import 'package:flutter_todo/helper/dimension_helper.dart';
import 'package:flutter_todo/helper/font_helper.dart';
import 'package:flutter_todo/routes/route_name.dart';
import 'package:flutter_todo/screens/delete_button.dart';
import 'package:flutter_todo/screens/done_button.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, i) =>
          const SizedBox(height: DimensionHelper.size_8),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteName.addAndUpdateTodoScreen,
                arguments: {"type": "update"});
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: DimensionHelper.size_8,
                vertical: DimensionHelper.size_8),
            margin: const EdgeInsets.symmetric(
              horizontal: DimensionHelper.size_12,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorHelper.secondarycolor,
              ),
              borderRadius: BorderRadius.circular(DimensionHelper.size_12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'title',
                        style: TextStyle(
                          color: ColorHelper.blackColor,
                          fontWeight: FontHelper.w500,
                          fontSize: FontHelper.font_18,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const DeleteButton(),
                  ],
                ),
                Text(
                  'Description',
                  style: TextStyle(
                    color: ColorHelper.blackColor,
                    fontWeight: FontHelper.w400,
                    fontSize: FontHelper.font_18,
                  ),
                ),
                const SizedBox(height: DimensionHelper.size_12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const DoneButton(),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: DimensionHelper.size_16,
                          vertical: DimensionHelper.size_8),
                      // height: DimensionHelper.size_35,
                      // width: DimensionHelper.size_130,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorHelper.primarycolor),
                        // color: ColorHelper.primarycolor,
                        borderRadius:
                            BorderRadius.circular(DimensionHelper.size_50),
                      ),
                      child: Text(
                        '18  July 2024',
                        style: TextStyle(
                          color: ColorHelper.blackColor,
                          fontSize: FontHelper.font_14,
                          fontWeight: FontHelper.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
