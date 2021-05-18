import 'package:Flutter_Scaffold/model/base_response.dart';
import 'package:dio/dio.dart';

/// Author: xuweiyu
/// Date: 4/22/21
/// Description:
class NetErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Response response = Response(requestOptions: err.requestOptions);
    if (response.statusCode != 200) {
      response.statusCode = 200;
      response.statusMessage = "网络异常";
      response.data = BaseResponse(-1, "网络异常", null).toJson((value) => null);
    }
    handler.resolve(response);
  }
}
