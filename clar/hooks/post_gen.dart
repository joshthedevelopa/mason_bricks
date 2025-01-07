import "package:mason/mason.dart";

void run(HookContext context) {
  context.logger.info("hello {{name}}!");
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

  // final installProgress = context.logger.progress(
  //   "Installing packages.",
  // options: ProgressOptions(
  //   animation: ProgressAnimation(
  //     frames: [
  //       ".\\",
  //       ".|",
  //       "./",
  //       "..\\",
  //       "..|",
  //       "../",
  //       "...\\",
  //       "...|",
  //       "..."
  //     ],
  //     interval: Duration(milliseconds: 80),
  //   ),
  // ),
  // );

  // await Process.run(
  //     "flutter",
  //     [
  //       "packages",
  //       "add",
  //       "flutter_bloc",
  //       "freezed_annotation",
  //       "json_annotation",
  //       "go_router"
  //     ],
  //     runInShell: true);
  // await Process.run(
  //   "flutter",
  //   [
  //     "packages",
  //     "add",
  //     "--dev",
  //     "build_runner",
  //     "build_verify",
  //     "freezed",
  //     "json_serializable",
  //     "go_router_builder"
  //   ],
  // );

  // await Process.run("flutter", ["pub", "get"]);

  // installProgress.complete();
}

// void printFiles(HookContext context, List<GeneratedFile> files) {
//   for (final file in files) {
//     context.logger.info("✓ Generated ${file.path} - ${file.status}");
//   }
//   context.logger.info("--\n\n");
// }
