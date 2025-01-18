part of "../{{name.snakeCase()}}.data.dart";

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}LocalService _localService;
  final {{name.pascalCase()}}RemoteService _remoteService;

  const {{name.pascalCase()}}RepositoryImpl({
    required Base{{name.pascalCase()}}LocalService localService,
    required Base{{name.pascalCase()}}RemoteService remoteService,
  }) : 
    _localService = localService,
    _remoteService = remoteService;
}