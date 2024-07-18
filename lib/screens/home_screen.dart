import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todo/helper/color_helper.dart';
import 'package:flutter_todo/helper/dimension_helper.dart';
import 'package:flutter_todo/helper/font_helper.dart';
import 'package:flutter_todo/helper/string_helper.dart';
import 'package:flutter_todo/routes/route_name.dart';
import 'package:flutter_todo/screens/todo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: ColorHelper.primarycolor,
          title: Text(
            StringHelper.todoApp,
            style: TextStyle(color: ColorHelper.whitecolor),
          ),
          bottom: TabBar(
            labelPadding:
                const EdgeInsets.symmetric(vertical: DimensionHelper.size_8),
            labelStyle: const TextStyle(
              // color: ColorHelper.whitecolor,
              fontWeight: FontHelper.bold,
              fontSize: FontHelper.font_20,
            ),
            unselectedLabelStyle: TextStyle(
              color: ColorHelper.whitecolor,
              fontWeight: FontHelper.w500,
              fontSize: FontHelper.font_18,
            ),
            tabs: const [
              Text(StringHelper.all),
              Text(StringHelper.todo),
              Text(StringHelper.done),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Todo(),
            Todo(),
            Todo(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteName.addAndUpdateTodoScreen,
                arguments: {"type": "add"});
          },
          backgroundColor: ColorHelper.secondarycolor,
          child: Icon(
            Icons.add,
            color: ColorHelper.primarycolor,
          ),
        ),
      ),
    );
  }
}
