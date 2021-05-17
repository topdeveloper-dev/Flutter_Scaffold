import 'package:Flutter_Scaffold/base/utils/log_util.dart';
import 'package:dio/dio.dart';

/// Author: xuweiyu
/// Date: 4/22/21
/// Description:
class NetErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err) {
    Response response = err.response ?? Response();
    if (response?.statusCode != 200) {
      response.statusCode = 200;
      response.data = "错误！！！";
    }
    return Future.value(response);
  }
}
