import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/cubit/delete_todo/delete_todo_cubit.dart';
import 'package:flutter_todo/cubit/get_todo_list/get_todo_list_cubit.dart';
import 'package:flutter_todo/helper/color_helper.dart';
import 'package:flutter_todo/helper/dimension_helper.dart';
import 'package:flutter_todo/utils/loading_indicator.dart';

class DeleteButton extends StatelessWidget {
  final String todoId;
  const DeleteButton({super.key, required this.todoId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DeleteTodoCubit(),
      child: BlocConsumer<DeleteTodoCubit, DeleteTodoState>(
          // listener: (context, state) => debugPrint(state.toString()),
          listener: (context, state) {
        if (state is DeleteTodoLoaded) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            context.read<GetTodoListCubit>().getTodoList(false);
          });
        }
      }, builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (state is DeleteTodoLoading) {
            } else {
              context.read<DeleteTodoCubit>().deleteTodo(todoId);
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: DimensionHelper.size_35,
            width: DimensionHelper.size_80,
            decoration: BoxDecoration(
              color: ColorHelper.redColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(DimensionHelper.size_50),
            ),
            child: state is DeleteTodoLoading
                ? loadingIndicator()
                : Icon(
                    Icons.delete_outline,
                    color: ColorHelper.redColor,
                  ),
          ),
        );
      }),
    );
  }
}
