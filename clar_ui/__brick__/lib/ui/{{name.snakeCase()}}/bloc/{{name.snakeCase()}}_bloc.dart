part of "../{{name.snakeCase()}}.ui.dart";

class {{name.pascalCase()}}Bloc extends Bloc<{{ name.pascalCase() }}Event, {{ name.pascalCase() }}UiState> {
  {{name.pascalCase()}}Bloc({
    {{ name.pascalCase() }}UiState state = const {{ name.pascalCase() }}UiState(),
  }) : super(state);
}