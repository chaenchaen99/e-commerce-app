import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/error/error_response.dart';

part 'result.freezed.dart';

//API 응답에 따라 성공 또는 실패를 처리하는 결과 클래스
@freezed
class Result<T> with _$Result {
  const factory Result.Success(T data) = Success;
  const factory Result.failure(ErrorResponse error) = Error;
}
