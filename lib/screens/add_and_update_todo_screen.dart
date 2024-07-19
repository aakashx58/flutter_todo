import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/cubit/add_and_update_todo/add_and_update_todo_cubit.dart';
import 'package:flutter_todo/helper/color_helper.dart';
import 'package:flutter_todo/helper/dimension_helper.dart';
import 'package:flutter_todo/helper/font_helper.dart';
import 'package:flutter_todo/helper/string_helper.dart';
import 'package:flutter_todo/models/add_and_update_todo_model.dart';
import 'package:flutter_todo/models/get_all_todo_model.dart';
import 'package:flutter_todo/utils/loading_indicator.dart';
import 'package:flutter_todo/utils/toast_message.dart';

class AddAndUpdateTodoScreen extends StatefulWidget {
  final Map args;
  const AddAndUpdateTodoScreen({super.key, required this.args});

  @override
  State<AddAndUpdateTodoScreen> createState() => _AddAndUpdateTodoScreenState();
}

class _AddAndUpdateTodoScreenState extends State<AddAndUpdateTodoScreen> {
  String type = "";
  Items? item;
  bool isDone = false;

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  void initState() {
    if (widget.args.containsKey('type')) {
      type = widget.args['type'];
    }

    if (widget.args.containsKey('item')) {
      item = widget.args['item'];
      title.text = item?.title ?? "";
      description.text = item?.description ?? "";
    }
    debugPrint('Print Args: ${widget.args.toString()}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        leading: BackButton(color: ColorHelper.whitecolor),
        backgroundColor: ColorHelper.primarycolor,
        title: Text(
          type == 'add' ? StringHelper.addTodo : StringHelper.updateTodo,
          style: TextStyle(color: ColorHelper.whitecolor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(DimensionHelper.size_12),
        child: Column(
          children: [
            TextFormField(
              controller: title,
              style: TextStyle(
                fontSize: FontHelper.font_20,
                fontWeight: FontHelper.w500,
                color: ColorHelper.blackColor,
              ),
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: TextStyle(
                  fontSize: FontHelper.font_20,
                  fontWeight: FontHelper.w500,
                  color: ColorHelper.blackColor,
                ),
                border: InputBorder.none,
              ),
            ),
            TextFormField(
              controller: description,
              style: TextStyle(
                fontSize: FontHelper.font_18,
                fontWeight: FontHelper.w500,
                color: ColorHelper.blackColor,
              ),
              decoration: InputDecoration(
                hintText: "Description",
                hintStyle: TextStyle(
                  fontSize: FontHelper.font_18,
                  fontWeight: FontHelper.w500,
                  color: ColorHelper.blackColor,
                ),
                border: InputBorder.none,
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringHelper.done,
                  style: TextStyle(
                    fontSize: FontHelper.font_20,
                    fontWeight: FontHelper.w500,
                    color: ColorHelper.blackColor,
                  ),
                ),
                Switch(
                  value: isDone,
                  activeColor: ColorHelper.primarycolor,
                  onChanged: (bool value) {
                    setState(() {
                      isDone = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: DimensionHelper.size_30),
            BlocProvider(
              create: (BuildContext context) => AddAndUpdateTodoCubit(),
              child: BlocConsumer<AddAndUpdateTodoCubit, AddAndUpdateTodoState>(
                  listener: (context, state) => debugPrint(state.toString()),
                  builder: (context, state) {
                    return SizedBox(
                      height: DimensionHelper.size_45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (state is AddAndUpdateTodoLoading) {
                          } else {
                            if (title.text.isEmpty) {
                              toastMessage(StringHelper.pleaseEnterTitle);
                            } else if (description.text.isEmpty) {
                              toastMessage(StringHelper.pleaseEnterDescription);
                            } else {
                              AddAndUpdateTodoModel addAndUpdateTodoModel =
                                  AddAndUpdateTodoModel(
                                title: title.text.toString(),
                                description: description.text.toString(),
                                // isCompleted: isDone.toString(),
                              );
                              context
                                  .read<AddAndUpdateTodoCubit>()
                                  .addAndUpdateTodo(context, type,
                                      addAndUpdateTodoModel, item?.sId ?? "");
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorHelper.secondarycolor,
                            foregroundColor: ColorHelper.primarycolor),
                        child: state is AddAndUpdateTodoLoading
                            ? loadingIndicator()
                            : Text(
                                type == 'add'
                                    ? StringHelper.addTodo
                                    : StringHelper.updateTodo,
                                style:
                                    TextStyle(color: ColorHelper.primarycolor),
                              ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
