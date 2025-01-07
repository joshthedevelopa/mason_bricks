import '../../../imports.dart';

part '.generated/result.freezed.dart';
part '.generated/result.g.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = SuccessResult<T>;

  const factory Result.error(String message, [dynamic data]) = ErrorResult;
}

class RequestException extends Error {
  final String message;

  RequestException(this.message) : super(Exception(message));
}
