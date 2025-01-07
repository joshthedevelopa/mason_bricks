import "package:mason/mason.dart";
import "package:mason_function_extensions/mason_function_extensions.dart";

Future<void> run(HookContext context) async {
  await generate(context, "clar_setup");
  await installPackages(context);
  await build(context);
}
