import 'dart:io';
import 'package:mason/mason.dart';

const _greenCheck = "\x1B[32m\u2714\x1B[0m";
const _git = "https://github.com/joshthedevelopa/mason_bricks";
const _defaultOptions = ProgressOptions();
final _defaultDirectoryTarget = DirectoryGeneratorTarget(Directory.current);

void main() async {
  final brick = Brick.git(GitPath(_git, path: "clar_ui", ref: "main"));
  final generator = await MasonGenerator.fromBrick(brick);
  final files = await generator.generate(
    _defaultDirectoryTarget,
    vars: {"name": "auth"},
  );

  for (final file in files) {
    final fileName = file.path.replaceAll("\\", "/");

    print(
      "$_greenCheck Generated "
      "${fileName.replaceAll(RegExp(".*lib/"), "")} - ${file.status.name}",
    );
  }
}

Future<void> generate(
  Logger logger,
  String path, [
  Map<String, dynamic> vars = const {},
]) async {
  logger.info("");
  final generationProgress = logger.progress(
    "Generating ${path.split("_").lastOrNull ?? "clar"} files",
    options: ProgressOptions(),
  );

  final brick = Brick.git(GitPath(_git, path: path, ref: "main"));
  final generator = await MasonGenerator.fromBrick(brick);
  final files = await generator.generate(_defaultDirectoryTarget, vars: vars);

  generationProgress.complete();

  for (final file in files) {
    final fileName = file.path.replaceAll("\\", "/");
    logger.info(
      "$_greenCheck Generated "
      "${fileName.replaceAll(RegExp(".*lib/"), "")} - ${file.status.name}",
    );
  }
}

Future<void> installPackages(Logger logger) async {
  final installProgress = logger.progress(
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
      "go_router",
      "dev:build_runner",
      "dev:freezed",
      "dev:json_serializable",
      "dev:go_router_builder"
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
    options: _defaultOptions,
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
