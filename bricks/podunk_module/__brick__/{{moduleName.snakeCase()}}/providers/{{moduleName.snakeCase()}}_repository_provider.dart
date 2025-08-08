import 'package:{{projectName.paramCase()}}/modules/{{moduleName.paramCase()}}/data/{{moduleName.snakeCase()}}_repository.dart';
import 'package:{{projectName.paramCase()}}/modules/{{moduleName.paramCase()}}/data/supabase_{{moduleName.snakeCase()}}_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{{moduleName.paramCase()}}_repository_provider.g.dart';

@riverpod
{{moduleName.pascalCase()}}Repository {{moduleName.paramCase()}}Repository(
  Ref ref,
) {
  return Supabase{{moduleName.pascalCase()}}Repository();
}