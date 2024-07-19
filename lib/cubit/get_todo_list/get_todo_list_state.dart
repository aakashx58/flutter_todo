part of 'get_todo_list_cubit.dart';

@immutable
abstract class GetTodoListState {}

class GetTodoListInitial extends GetTodoListState {}

class GetTodoListNetworkError extends GetTodoListState {}

class GetTodoListLoading extends GetTodoListState {}

class GetTodoListLoaded extends GetTodoListState {
  final List<Items> all;
  final List<Items> todo;
  final List<Items> done;

  GetTodoListLoaded(this.all, this.todo, this.done);
}

class GetTodoListError extends GetTodoListState {}
