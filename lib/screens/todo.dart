import 'package:flutter/material.dart';
import 'package:flutter_todo/helper/color_helper.dart';
import 'package:flutter_todo/helper/dimension_helper.dart';
import 'package:flutter_todo/helper/font_helper.dart';
import 'package:flutter_todo/helper/string_helper.dart';
import 'package:flutter_todo/models/get_all_todo_model.dart';
import 'package:flutter_todo/routes/route_name.dart';
import 'package:flutter_todo/screens/delete_button.dart';
import 'package:flutter_todo/screens/done_button.dart';
import 'package:flutter_todo/utils/date_format.dart';

class Todo extends StatelessWidget {
  final List<Items> items;
  const Todo({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    // print('item length: ${items.length}');
    return items.length == 0
        ? Center(
            child: Text(
              StringHelper.noTodoFound,
              style: TextStyle(
                color: ColorHelper.blackColor,
                fontWeight: FontHelper.w400,
                fontSize: FontHelper.font_16,
              ),
            ),
          )
        : ListView.separated(
            itemCount: items.length,
            padding:
                const EdgeInsets.symmetric(vertical: DimensionHelper.size_12),
            separatorBuilder: (context, i) =>
                const SizedBox(height: DimensionHelper.size_8),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.addAndUpdateTodoScreen,
                      arguments: {
                        "type": "update",
                        "item": items[index],
                      });
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
                    borderRadius:
                        BorderRadius.circular(DimensionHelper.size_12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              items[index].title ?? "",
                              style: TextStyle(
                                color: ColorHelper.blackColor,
                                fontWeight: FontHelper.w500,
                                fontSize: FontHelper.font_18,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DeleteButton(
                            todoId: items[index].sId ?? "",
                          ),
                        ],
                      ),
                      Text(
                        items[index].description ?? "",
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
                          DoneButton(
                            items: items[index],
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: DimensionHelper.size_16,
                                vertical: DimensionHelper.size_8),
                            // height: DimensionHelper.size_35,
                            // width: DimensionHelper.size_130,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorHelper.primarycolor),
                              // color: ColorHelper.primarycolor,
                              borderRadius: BorderRadius.circular(
                                  DimensionHelper.size_50),
                            ),
                            child: Text(
                              dateFormat(items[index].createdAt ?? ""),
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
