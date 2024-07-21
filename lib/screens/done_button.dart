import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/cubit/add_and_update_todo/add_and_update_todo_cubit.dart';
import 'package:flutter_todo/cubit/get_todo_list/get_todo_list_cubit.dart';
import 'package:flutter_todo/helper/color_helper.dart';
import 'package:flutter_todo/helper/dimension_helper.dart';
import 'package:flutter_todo/helper/font_helper.dart';
import 'package:flutter_todo/models/add_and_update_todo_model.dart';
import 'package:flutter_todo/models/get_all_todo_model.dart';
import 'package:flutter_todo/utils/loading_indicator.dart';

class DoneButton extends StatelessWidget {
  final Items items;
  const DoneButton({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddAndUpdateTodoCubit(),
      child: BlocConsumer<AddAndUpdateTodoCubit, AddAndUpdateTodoState>(
          listener: (context, state) {
        if (state is AddAndUpdateTodoLoaded) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            context.read<GetTodoListCubit>().getTodoList(false);
          });
        }
      }, builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (items.isCompleted == false) {
              AddAndUpdateTodoModel addAndUpdateTodoModel =
                  AddAndUpdateTodoModel(
                title: items.title,
                description: items.description,
                isCompleted: true.toString(), //newmodel
              );

              context.read<AddAndUpdateTodoCubit>().addAndUpdateTodo(
                  context, 'done', addAndUpdateTodoModel, items.sId ?? "");
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: DimensionHelper.size_35,
            width: DimensionHelper.size_130,
            decoration: BoxDecoration(
              color: ColorHelper.primarycolor,
              borderRadius: BorderRadius.circular(DimensionHelper.size_50),
            ),
            child: state is AddAndUpdateTodoLoading
                ? loadingIndicator()
                : Text(
                    items.isCompleted == true ? 'Done' : 'Mark as Done',
                    style: TextStyle(
                      color: ColorHelper.whitecolor,
                      fontSize: FontHelper.font_16,
                      fontWeight: FontHelper.w500,
                    ),
                  ),
          ),
        );
      }),
    );
  }
}
