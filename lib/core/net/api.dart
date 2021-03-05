import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';


part 'api.g.dart';
/// Author: 2021/3/5
/// Date: wizz
/// Description:
/// flutter pub run build_runner build

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class APIClient{
  factory APIClient(Dio dio, {String baseUrl} ) = _APIClient;

  @POST("http://httpbin.org/post")
  @FormUrlEncoded()
  Future<String> postUrlEncodedFormData(
      @Field() String hello, {
        @Field() String gg,
      });
}
