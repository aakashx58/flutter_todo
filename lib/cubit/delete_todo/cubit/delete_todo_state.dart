part of 'delete_todo_cubit.dart';

@immutable
abstract class DeleteTodoState {}

final class DeleteTodoInitial extends DeleteTodoState {}

final class DeleteTodoLoading extends DeleteTodoState {}

final class DeleteTodoLoaded extends DeleteTodoState {}

final class DeleteTodoError extends DeleteTodoState {}
