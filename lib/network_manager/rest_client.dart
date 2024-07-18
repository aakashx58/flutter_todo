import 'package:dio/dio.dart';
import 'package:flutter_todo/models/add_and_update_todo_model.dart';
import 'package:flutter_todo/models/get_all_todo_model.dart';
import 'package:flutter_todo/models/todo_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

//flutter pub run build_runner build
//flutter pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/v1/todos')
  Future<GetAllTodoModel> getAllTodo();

  @POST('/v1/todos')
  Future<TodoModel> addTodo(
      @Body() AddAndUpdateTodoModel addAndUpdateTodoModel);

  @PUT('/v1/todos/{}id')
  Future<TodoModel> updateTodo(@Path() String id);

  @DELETE('/v1/todos/{}id')
  Future<TodoModel> deleteTodo(@Path() String id);
}
