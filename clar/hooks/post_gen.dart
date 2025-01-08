import "package:mason/mason.dart";
import "package:mason_function_extensions/mason_function_extensions.dart";

Future<void> run(HookContext context) async {
  final name = context.vars["name"];

  final {
    "include_setup": include_setup,
    "include_ui": include_ui,
    "include_domain": include_domain,
    "include_data": include_data
  } = context.vars;

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
