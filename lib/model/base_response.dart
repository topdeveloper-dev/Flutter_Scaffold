import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(name: 'errorCode')
  int errorCode;
  @JsonKey(name: 'errorMsg')
  String errorMsg;
  @JsonKey(name: 'data')
  T? data;

  BaseResponse(this.errorCode, this.errorMsg, this.data);

  factory BaseResponse.fromJson(
          Map<String, dynamic> srcJson, T Function(dynamic json) fromJsonT) =>
      _$BaseResponseFromJson(srcJson, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);

  @override
  String toString() {
    return 'BaseResponse{errorCode: $errorCode, errorMsg: $errorMsg, data: $data}';
  }
}
