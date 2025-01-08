part of "../{{name.snakeCase()}}.ui.dart";

@freezed
class {{ name.pascalCase() }}Event with _${{ name.pascalCase() }}Event {
  const factory {{ name.pascalCase() }}Event.init() = Init{{ name.pascalCase() }}Event;

  factory {{ name.pascalCase() }}Event.fromJson(Map<String, dynamic> json)  { 
    return _${{ name.pascalCase() }}EventFromJson(json);
  }
}