import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ColorHelper {
  ColorHelper._();
  static final ColorHelper colorHelper = ColorHelper._();

  factory ColorHelper() {
    return colorHelper;
  }

  static Color primarycolor = HexColor("#20ab5c");
  static Color secondarycolor = HexColor("#b7dda6");
  static Color whitecolor = Colors.white;
  static Color blackColor = Colors.black;
  static Color greyColor = Colors.grey;
  static Color redColor = const Color.fromARGB(255, 255, 17, 0);
}
