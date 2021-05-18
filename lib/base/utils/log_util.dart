
/// Author: xuweiyu
/// Date: 4/22/21
/// Description:
class LogUtil {
  static const String _TAG = "xwy---->";

  static void printl(Object object) {
    if (object is String) {
      print(_TAG + object.toString());
    } else {
      print(_TAG + object.toString());
    }
  }
}
