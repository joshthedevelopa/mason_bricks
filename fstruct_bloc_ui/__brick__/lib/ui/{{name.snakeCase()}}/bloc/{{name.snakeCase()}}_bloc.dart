part of "../{{name.snakeCase()}}.ui.dart";

class {{name.pascalCase()}}Bloc extends Bloc<{{ name.pascalCase() }}Event, {{ name.pascalCase() }}State>{
  const {{name.pascalCase()}}Bloc(
    {{ name.pascalCase() }}State state = const {{ name.pascalCase() }}State(),
  ) : super(state);
}