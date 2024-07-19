import 'package:bloc/bloc.dart';
import 'package:flutter_todo/helper/string_helper.dart';
import 'package:flutter_todo/network_manager/injection.dart';
import 'package:flutter_todo/utils/connectivity.dart';
import 'package:flutter_todo/utils/toast_message.dart';
import 'package:meta/meta.dart';

part 'delete_todo_state.dart';

class DeleteTodoCubit extends Cubit<DeleteTodoState> {
  DeleteTodoCubit() : super(DeleteTodoInitial());

  deleteTodo(String id) async {
    if (await isNetworkAvailable()) {
      emit(DeleteTodoLoading());
      client.deleteTodo(id).then((value) {
        emit(DeleteTodoLoaded());

        toastMessage(StringHelper.deletedSuccessfully);
      }).onError((error, stackTrace) {
        emit(DeleteTodoError());

        toastMessage(StringHelper.someThingWentWrong);
      });
    } else {
      toastMessage(StringHelper.pleaseCheckInternet);
    }
  }
}
