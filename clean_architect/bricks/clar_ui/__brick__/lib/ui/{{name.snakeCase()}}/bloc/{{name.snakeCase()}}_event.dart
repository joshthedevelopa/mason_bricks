part of "../{{name.snakeCase()}}.ui.dart";

@freezed
class {{ name.pascalCase() }}Event with _${{ name.pascalCase() }}Event {
  const factory {{ name.pascalCase() }}Event.init() = _Init{{ name.pascalCase() }}Event;
}