import "dart:io";
import "package:mason/mason.dart";

const greenCheck = "\x1B[32m\u2714\x1B[0m";
const git = "https://github.com/joshthedevelopa/mason_bricks.git";
const option = const ProgressOptions();
final directoryTarget = DirectoryGeneratorTarget(Directory.current);

Future<void> run(HookContext context) async {
  final name = context.vars["name"];

  final include_ui = context.vars["include_ui"];
  final include_domain = context.vars["include_domain"];
  final include_data = context.vars["include_data"];
  final include_setup = context.vars["include_setup"];

  if (include_setup) {
    await generate(context, "clar_setup");
  }

  if (include_ui) {
    await generate(context, "clar_ui", {"name": name});
  }

  if (include_domain) {
    await generate(context, "clar_domain", {"name": name});
  }

  if (include_data) {
    await generate(context, "clar_data", {"name": name});
  }
}

Future<void> generate(
  HookContext context,
  String path, [
  Map<String, dynamic> vars = const {},
]) async {
  context.logger.info("");
  final generationProgress = context.logger.progress(
    "Generating ${path.split("_").lastOrNull ?? "clar"} files",
    options: ProgressOptions(),
  );

  final brick = Brick.git(GitPath(git, path: path));
  final generator = await MasonGenerator.fromBrick(brick);
  final files = await generator.generate(directoryTarget, vars: vars);

  generationProgress.complete();

  for (final file in files) {
    final [_, fileName] = file.path.split("lib/");
    context.logger.info(
      "$greenCheck Generated $fileName - ${file.status.name}",
    );
  }

  context.logger.info("");
}
