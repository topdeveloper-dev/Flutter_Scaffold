import 'dart:io';

import 'package:Flutter_Scaffold/base/net/net_error_interceptor.dart';
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
    _dio.options.receiveTimeout = 5000; //5s

    LogInterceptor _logInterceptor =
        LogInterceptor(requestBody: true, responseBody: true);
    _dio.interceptors.add(_logInterceptor);
    _dio.interceptors.add(NetErrorInterceptor());
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
