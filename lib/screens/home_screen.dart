import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/cubit/get_todo_list/get_todo_list_cubit.dart';
import 'package:flutter_todo/helper/color_helper.dart';
import 'package:flutter_todo/helper/dimension_helper.dart';
import 'package:flutter_todo/helper/font_helper.dart';
import 'package:flutter_todo/helper/string_helper.dart';
import 'package:flutter_todo/routes/route_name.dart';
import 'package:flutter_todo/screens/todo.dart';
import 'package:flutter_todo/utils/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<GetTodoListCubit>().getTodoList();
    super.initState();
  }

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
        body: BlocConsumer<GetTodoListCubit, GetTodoListState>(
            listener: (context, state) => debugPrint(state.toString()),
            builder: (context, state) {
              if (state is GetTodoListNetworkError) {
                return const Center(
                  child: Text(StringHelper.pleaseCheckInternet),
                );
              } else if (state is GetTodoListLoading) {
                return loadingIndicator();
              } else if (state is GetTodoListError) {
                return const Center(
                  child: Text(StringHelper.someThingWentWrong),
                );
              } else if (state is GetTodoListLoaded) {
                return TabBarView(
                  children: [
                    Todo(items: state.all),
                    Todo(items: state.todo),
                    Todo(items: state.done),
                  ],
                );
              }
              return const SizedBox();
            }),
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
