part of "../{{name.snakeCase()}}.ui.dart";

@freezed
class {{ name.pascalCase() }}UiState with _${{ name.pascalCase() }}UiState {
  const factory {{ name.pascalCase() }}UiState({
    @Default(UiStatus.initial()) UiStatus status,
  }) = _{{ name.pascalCase() }}UiState;

  factory {{ name.pascalCase() }}UiState.fromJson(Map<String, dynamic> json) { 
    return _${{ name.pascalCase() }}UiStateFromJson(json);
  }
}