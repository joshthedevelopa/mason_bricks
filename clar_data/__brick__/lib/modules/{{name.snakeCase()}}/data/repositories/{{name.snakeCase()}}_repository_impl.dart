part of "../{{name.snakeCase()}}.data.dart";

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final Base{{name.pascalCase()}}Service _localService;
  final Base{{name.pascalCase()}}Service _remoteService;

  const {{name.pascalCase()}}RepositoryImpl({
    required Base{{name.pascalCase()}}Service localService,
    required Base{{name.pascalCase()}}Service remoteService,
  }) : 
    _localService = localService,
    _remoteService = remoteService;
}