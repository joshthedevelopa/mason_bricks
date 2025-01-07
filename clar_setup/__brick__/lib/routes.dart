import 'imports.dart';

@TypedShellRoute<EntryRoute>(routes: [])
@immutable
class EntryRoute extends ShellRouteData {
  const EntryRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) =>
      navigator;
}
