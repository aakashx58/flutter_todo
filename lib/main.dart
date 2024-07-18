import 'package:flutter/material.dart';
import 'package:flutter_todo/routes/route_name.dart';
import 'package:flutter_todo/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomeScreen(),
      initialRoute: RouteName.homeScreen,

      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
