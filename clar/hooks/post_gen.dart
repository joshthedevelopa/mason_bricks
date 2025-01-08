import "package:mason/mason.dart";
import "package:mason_function_extensions/mason_function_extensions.dart";

Future<void> run(HookContext context) async {
  final name = context.vars["name"];

  final include_setup = context.vars["include_setup"];
  final include_ui = context.vars["include_ui"];
  final include_domain = context.vars["include_domain"];
  final include_data = context.vars["include_data"];

  if (include_setup) {
    await generate(context.logger, "clar_setup");
    await installPackages(context.logger);
  }

  if (include_ui) {
    await generate(context.logger, "clar_ui", {"name": name});
  }

  if (include_domain) {
    await generate(context.logger, "clar_domain", {"name": name});
  }

  if (include_data) {
    await generate(context.logger, "clar_data", {"name": name});
  }

  await build(context.logger);
}
