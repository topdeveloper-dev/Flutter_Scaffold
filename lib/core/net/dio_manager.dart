import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

/// Author: 2021/3/5
/// Date: wizz
/// Description:
///
class DioManager {
  static final DioManager instance = DioManager._internal();
  Dio _dio;

  Dio get dio => _dio;

  DioManager._internal() {
    _dio = Dio();
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 5000;

    LogInterceptor _logInterceptor =
        LogInterceptor(requestBody: true, responseBody: true);
    _dio.interceptors.add(_logInterceptor);
    _dio.interceptors.add(DioErrorInterceptor());
  }

  /// 设置代理地址
  void _setProxy(String ipAndPort) {
    if (ipAndPort == null || ipAndPort.isEmpty) {
      return;
    }
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) {
        return "PROXY " + ipAndPort;
      };

      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
  }
}

class DioErrorInterceptor extends Interceptor{

  @override
  Future onError(DioError err) {
    Response res = Response();
    if(res.statusCode != 200){
      res.statusCode = 200;
      res.data = {"":""};
    }
    return super.onResponse(res);
  }
}
