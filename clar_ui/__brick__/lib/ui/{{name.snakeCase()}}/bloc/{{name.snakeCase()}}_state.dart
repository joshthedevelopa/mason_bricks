part of "../{{name.snakeCase()}}.ui.dart";

@freezed
class {{ name.pascalCase() }}State with _${{ name.pascalCase() }}State {
  const factory {{ name.pascalCase() }}State({
    @Default(UiStatus.initial) UiStatus status,
  }) = _{{ name.pascalCase() }}State;

  factory {{ name.pascalCase() }}State.fromJson(Map<String, dynamic> json) { 
    return _${{ name.pascalCase() }}FromJson(json);
  }
}