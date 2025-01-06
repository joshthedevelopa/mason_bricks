import "../../imports.dart";

part "views/{{ name.snakeCase() }}.ui.dart";

part "bloc/{{ name.snakeCase() }}.bloc.dart";
part "bloc/{{ name.snakeCase() }}.event.dart";
part "bloc/{{ name.snakeCase() }}.state.dart";

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
