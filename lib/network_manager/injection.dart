import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_todo/network_manager/rest_client.dart';

final client = RestClient(dio, baseUrl: "https://api.nstack.in");

final dio = getDio();
Dio getDio() {
  BaseOptions options = BaseOptions(
    receiveDataWhenStatusError: true,
    contentType: "application/json",
    sendTimeout: const Duration(seconds: 10),
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );

  Dio dio = Dio(options);
  dio.interceptors.add(
    InterceptorsWrapper(onRequest: (request, handler) {
      log("Body: ${jsonEncode(request.data ?? "")}");
      return handler.next(request);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      log("Response: ${jsonEncode(response.data ?? "")}");
      return handler.next(response);
    }, onError: (DioException e, handler) {
      final response = e.response;
      log("Error: ${e.toString()} || StatusCode: ${response?.statusCode ?? ""}");

      if (response?.statusCode == 401) {
        // navigate here
      }
      return handler.next(e);
    }),
  );
  return dio;
}
