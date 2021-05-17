
import 'package:flutter/material.dart' as p;

/// Author: xuweiyu
/// Date: 4/22/21
/// Description:
class LogUtil {
  static const String _TAG = "---->";

  static void printl(Object object) {
    //print(_TAG);
    if (object is String) {
      print(_TAG + object.toString());
    } else {
      print(_TAG + object.toString());
    }
  }
}
