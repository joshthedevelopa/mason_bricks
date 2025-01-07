import "dart:io";
import "package:mason/mason.dart";

Future<void> run(HookContext context) async {
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

  final buildYaml = File("./build.yaml");
  if (await buildYaml.exists()) {
    String content = await buildYaml.readAsString();
    content = content.replaceAll("{value}", "{{value}}");
    await buildYaml.writeAsString(content);
  }
}
