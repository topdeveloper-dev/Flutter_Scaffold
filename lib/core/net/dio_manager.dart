import 'package:dio/dio.dart';

/// Author: 2021/3/5
/// Date: wizz
/// Description:
///
class DioManager {
  static final DioManager instance = DioManager._internal();

  DioManager._internal(){
    this.dio = Dio();
  }

  Dio dio;
}

class NativeHeaderInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    var channelHeader = Map();
    print("channel header para " + channelHeader.toString());
    if (channelHeader != null) {
      Map map = new Map<String, dynamic>.from(channelHeader);
      options.headers.addAll(map);
    }
    return super.onRequest(options);
  }
}

