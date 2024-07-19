import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/helper/string_helper.dart';
import 'package:flutter_todo/models/add_and_update_todo_model.dart';
import 'package:flutter_todo/network_manager/injection.dart';
import 'package:flutter_todo/utils/connectivity.dart';
import 'package:flutter_todo/utils/toast_message.dart';
import 'package:meta/meta.dart';

part 'add_and_update_todo_state.dart';

class AddAndUpdateTodoCubit extends Cubit<AddAndUpdateTodoState> {
  AddAndUpdateTodoCubit() : super(AddAndUpdateTodoInitial());

  addAndUpdateTodo(BuildContext context, String type,
      AddAndUpdateTodoModel addAndUpdateTodoModel, String id) async {
    if (await isNetworkAvailable()) {
      emit(AddAndUpdateTodoLoading());
      if (type == 'add') {
        client.addTodo(addAndUpdateTodoModel).then((value) {
          emit(AddAndUpdateTodoLoaded());
          toastMessage(StringHelper.addedSuccessfully);
          // context.read<GetTodoListCubit>().getTodoList();

          Navigator.pop(context, true);
        }).onError((error, stackTrace) {
          toastMessage(StringHelper.someThingWentWrong);
        });
      } else {
        client.updateTodo(id, addAndUpdateTodoModel).then((value) {
          emit(AddAndUpdateTodoLoaded());
          toastMessage(StringHelper.updatedSuccessfully);
          // context.read<GetTodoListCubit>().getTodoList();

          if (type != 'done') {
            Navigator.pop(context, true);
          }
        }).onError((error, stackTrace) {
          toastMessage(StringHelper.someThingWentWrong);
        });
      }
    } else {
      toastMessage(StringHelper.pleaseCheckInternet);
    }
  }
}
