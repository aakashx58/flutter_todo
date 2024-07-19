import 'package:flutter_todo/helper/color_helper.dart';
import 'package:flutter_todo/helper/font_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: ColorHelper.primarycolor,
    textColor: ColorHelper.whitecolor,
    fontSize: FontHelper.font_16,
  );
}
