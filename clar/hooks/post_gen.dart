import "dart:io";
import "package:mason/mason.dart";

Future<void> run(HookContext context) async {
  // final name = context.vars["name"];

  // final include_ui = context.vars["include_ui"];
  // final include_domain = context.vars["include_domain"];
  // final include_data = context.vars["include_data"];

  // final directoryTarget = DirectoryGeneratorTarget(Directory.current);

  // final generationProgress = context.logger.progress(
  //   "Generating files.",
  //   options: ProgressOptions(
  //     animation: ProgressAnimation(
  //       frames: [
  //         ".\\",
  //         ".|",
  //         "./",
  //         "..\\",
  //         "..|",
  //         "../' '...\\",
  //         "...|",
  //         "..."
  //       ],
  //       interval: Duration(milliseconds: 80),
  //     ),
  //   ),
  // );

  // if (include_ui) {
  //   final brick = Brick.git(GitPath(
  //     "https://github.com/joshthedevelopa/mason_bricks.git",
  //     path: "clar_ui",
  //   ));
  //   final generator = await MasonGenerator.fromBrick(brick);
  //   final files = await generator.generate(
  //     directoryTarget,
  //     vars: {"name": name},
  //   );
  //   context.logger.info("Generated UI files.");
  //   printFiles(context, files);
  // }

  // if (include_domain) {
  //   final brick = Brick.git(GitPath(
  //     "https://github.com/joshthedevelopa/mason_bricks.git",
  //     path: "clar_domain",
  //   ));
  //   final generator = await MasonGenerator.fromBrick(brick);
  //   final files = await generator.generate(
  //     directoryTarget,
  //     vars: {"name": name},
  //   );
  //   context.logger.info("Generated Domain files.");
  //   printFiles(context, files);
  // }

  // if (include_data) {
  //   final brick = Brick.git(GitPath(
  //     "https://github.com/joshthedevelopa/mason_bricks.git",
  //     path: "clar_data",
  //   ));
  //   final generator = await MasonGenerator.fromBrick(brick);
  //   final files = await generator.generate(
  //     directoryTarget,
  //     vars: {"name": name},
  //   );
  //   context.logger.info("Generated Data files.");
  //   printFiles(context, files);
  // }
  // generationProgress.complete();

  final installProgress = context.logger.progress(
    "Installing packages.",
    options: ProgressOptions(
      animation: ProgressAnimation(
        frames: [
          ".\\",
          ".|",
          "./",
          "..\\",
          "..|",
          "../' '...\\",
          "...|",
          "..."
        ],
        interval: Duration(milliseconds: 80),
      ),
    ),
  );

  await Process.run("flutter", ["pub", "add", "flutter_bloc"]);
  await Process.run("flutter", ["pub", "add", "freezed_annotation"]);
  await Process.run("flutter", ["pub", "add", "json_annotation"]);
  await Process.run("flutter", ["pub", "add", "go_router"]);

  await Process.run("flutter", ["pub", "add", "--dev", "build_runner"]);
  await Process.run("flutter", ["pub", "add", "--dev", "build_verify"]);
  await Process.run("flutter", ["pub", "add", "--dev", "freezed"]);
  await Process.run("flutter", ["pub", "add", "--dev", "json_serializable"]);
  await Process.run("flutter", ["pub", "add", "--dev", "go_router_builder"]);

  await Process.run("flutter", ["pub", "get"]);

  installProgress.complete();
}

void printFiles(HookContext context, List<GeneratedFile> files) {
  for (final file in files) {
    context.logger.info("✓ Generated ${file.path} - ${file.status}");
  }
  context.logger.info("--\n\n");
}
