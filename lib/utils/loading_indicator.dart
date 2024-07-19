import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_todo/helper/color_helper.dart';
import 'package:flutter_todo/helper/dimension_helper.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget loadingIndicator() {
  return Center(
    child: SizedBox(
      height: DimensionHelper.size_20,
      width: DimensionHelper.size_50,
      child: LoadingIndicator(
        indicatorType: Indicator.ballBeat,

        /// Required, The loading type of the widget
        colors: [ColorHelper.primarycolor],

        /// Optional, The color collections
        strokeWidth: 2,

        /// Optional, The stroke of the line, only applicable to widget which contains line
      ),
    ),
  );
}
