import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

/// Author: 2021/3/8
/// Date: wizz
/// Description:
///
///

class BaseNetClient {
  static final BaseNetClient instance = BaseNetClient._internal();
  Dio _dio;

  BaseNetClient._internal();

  init(
      {String baseUrl,
      requestBody: false,
      responseBody: false,
      String ipAndPort,
      BaseOptions baseOptions}) {
    _dio = Dio();
    if (baseOptions == null) {
      BaseOptions baseOptions = BaseOptions();
      baseOptions.connectTimeout = 5000; //5s
      baseOptions.receiveTimeout = 5000; //5s
      baseOptions.method = "POST"; //5s
      _dio.options = baseOptions;
    } else {
      _dio.options = baseOptions;
    }

    if (baseUrl != null && baseUrl.isNotEmpty) {
      _dio.options.baseUrl = baseUrl;
    }

    // 日志拦截器
    if (requestBody || responseBody) {
      LogInterceptor _logInterceptor =
          LogInterceptor(requestBody: requestBody, responseBody: responseBody);
      _dio.interceptors.add(_logInterceptor);
    }

    _setProxy(ipAndPort);
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

  Future<dynamic> request(String path,
      {data,
      Map<String, dynamic> queryParameters,
      CancelToken cancelToken,
      RequestOptions requestOptions,
      ProgressCallback onSendProgress,
      ProgressCallback onReceiveProgress,
      Function errorHandle}) async {
    ArgumentError.checkNotNull(_dio, '_dio');
    try {
      Response response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: requestOptions,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioError catch (e) {
      if (errorHandle != null) {
        return errorHandle(e);
      }
    }
  }

  Stream<dynamic> request1(String path,
      {data,
      Map<String, dynamic> queryParameters,
      CancelToken cancelToken,
      RequestOptions requestOptions,
      ProgressCallback onSendProgress,
      ProgressCallback onReceiveProgress,
      Function errorHandle}) async* {
    ArgumentError.checkNotNull(_dio, '_dio');
    try {
      Response response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: requestOptions,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      yield response.data;
    } on DioError catch (e) {
      if (errorHandle != null) {
        errorHandle(e);
      }
    }
  }
}
