import '../../../imports.dart';

part '.generated/ui_status.freezed.dart';
part '.generated/ui_status.g.dart';

@freezed
sealed class UiStatus with _$UiStatus {
  const factory UiStatus.initial() = IntialUiStatus;

  const factory UiStatus.success([String? message]) = SuccessUiStatus;

  const factory UiStatus.loading([dynamic data]) = LoadingUiStatus;

  const factory UiStatus.error(String message, [dynamic data]) = ErrorUiStatus;
}
