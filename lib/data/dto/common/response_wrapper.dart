import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_wrapper.g.dart';

part 'response_wrapper.freezed.dart';

@Freezed(genericArgumentFactories: true)
class ResponseWrapper<T> with _$ResponseWrapper {
  const factory ResponseWrapper({
    @Default('') String status,
    @Default('') String code,
    @Default('') String message,
    T? data,
  }) = _ResponseWrapper;

  factory ResponseWrapper.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ResponseWrapperFromJson(json, fromJsonT);
}
