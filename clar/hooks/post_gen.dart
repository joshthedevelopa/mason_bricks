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
    await installPackages(context);
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

  await build(context);
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

  final brick = Brick.path("parts/$path");
  final generator = await MasonGenerator.fromBrick(brick);
  final files = await generator.generate(directoryTarget, vars: vars);

  generationProgress.complete();

  for (final file in files) {
    final fileName = file.path.replaceAll("\\", "/");
    context.logger.info(
      "$greenCheck Generated "
      "${fileName.replaceAll(RegExp(".*lib\/"), "")} - ${file.status.name}",
    );
  }
}

Future<void> installPackages(HookContext context) async {
  final installProgress = context.logger.progress(
    "Installing packages.",
    options: ProgressOptions(),
  );

  await Process.run(
    "flutter",
    [
      "pub",
      "add",
      "flutter_bloc",
      "freezed_annotation",
      "json_annotation",
      "go_router"
    ],
    runInShell: true,
  );
  await Process.run(
    "flutter",
    [
      "pub",
      "add",
      "--dev",
      "build_runner",
      "build_verify",
      "freezed",
      "json_serializable",
      "go_router_builder"
    ],
    runInShell: true,
  );

  await Process.run(
    "flutter",
    ["pub", "get"],
    runInShell: true,
  );

  installProgress.complete();
}

Future<void> build(HookContext context) async {
  final buildProgress = context.logger.progress(
    "Building project.",
    options: option,
  );

  final buildYaml = File("build.yaml");
  if (await buildYaml.exists()) {
    String content = await buildYaml.readAsString();
    if (!RegExp("{{dir}}").hasMatch(content)) {
      content = content.replaceAll("{dir}", "{{dir}}");
      content = content.replaceAll("{file}", "{{file}}");

      await buildYaml.writeAsString(content);
    }
  }

  await Process.run(
    "dart",
    ["run", "build_runner", "build", "-d"],
    runInShell: true,
  );

  buildProgress.complete();
}
