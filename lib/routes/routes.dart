import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/cubit/get_todo_list/get_todo_list_cubit.dart';
import 'package:flutter_todo/screens/add_and_update_todo_screen.dart';
import 'package:flutter_todo/screens/no_route_found.dart';
import 'package:flutter_todo/routes/route_name.dart';
import 'package:flutter_todo/screens/home_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (BuildContext context) => GetTodoListCubit(),
              child: const HomeScreen()),
        );

      case RouteName.addAndUpdateTodoScreen:
        final args = settings.arguments as Map;

        return MaterialPageRoute(
          builder: (context) => AddAndUpdateTodoScreen(args: args),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const NoRouteFound(),
        );
    }
  }
}
