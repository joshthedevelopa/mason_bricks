import "../../imports.dart";

part "views/{{ name.snakeCase() }}_view.dart";

part "bloc/{{ name.snakeCase() }}_bloc.dart";
part "bloc/{{ name.snakeCase() }}_event.dart";
part "bloc/{{ name.snakeCase() }}_state.dart";

part ".generated/{{ name.snakeCase() }}.freezed.dart";
part ".generated/{{ name.snakeCase() }}.g.dart";

@immutable
final class {{ name.pascalCase() }}Route extends GoRouteData {
  const {{ name.pascalCase() }}Route();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => {{ name.pascalCase() }}Bloc(),
      child: {{ name.pascalCase() }}View(),
    );
  }
}
