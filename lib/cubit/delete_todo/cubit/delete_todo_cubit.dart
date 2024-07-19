import 'package:bloc/bloc.dart';
import 'package:flutter_todo/helper/string_helper.dart';
import 'package:flutter_todo/network_manager/injection.dart';
import 'package:flutter_todo/utils/connectivity.dart';
import 'package:flutter_todo/utils/snackbar.dart';
import 'package:meta/meta.dart';

part 'delete_todo_state.dart';

class DeleteTodoCubit extends Cubit<DeleteTodoState> {
  DeleteTodoCubit() : super(DeleteTodoInitial());

  deleteTodo(String id) async {}
}
