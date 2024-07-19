import 'package:bloc/bloc.dart';
import 'package:flutter_todo/models/get_all_todo_model.dart';
import 'package:flutter_todo/network_manager/injection.dart';
import 'package:flutter_todo/utils/connectivity.dart';
import 'package:meta/meta.dart';

part 'get_todo_list_state.dart';

class GetTodoListCubit extends Cubit<GetTodoListState> {
  GetTodoListCubit() : super(GetTodoListInitial());

  getTodoList() async {
    if (await isNetworkAvailable()) {
      emit(GetTodoListLoading());
      client.getAllTodo().then((value) {
        // List<Items> all = [];
        List<Items> todo = [];
        List<Items> done = [];

        // all = value.items!;

        for (var item in value.items!) {
          if (item.isCompleted == true) {
            done.add(item);
          } else {
            todo.add(item);
          }
        }

        emit(GetTodoListLoaded(value.items!, todo, done));
      }).onError((error, stackTrace) {
        emit(GetTodoListError());
      });
    } else {
      emit(GetTodoListNetworkError());
    }
  }
}
