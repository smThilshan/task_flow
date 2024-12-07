import 'package:flutter/material.dart';

class AppConstants {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getDevicePixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  static Orientation getOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }
}
