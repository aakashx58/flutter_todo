import 'package:flutter/material.dart';
import 'package:flutter_todo/helper/string_helper.dart';

class NoRouteFound extends StatelessWidget {
  const NoRouteFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('StringHelper.todoApp'),
      ),
      body: Center(
        child: Text(StringHelper.someThingWentWrong),
      ),
    );
  }
}
