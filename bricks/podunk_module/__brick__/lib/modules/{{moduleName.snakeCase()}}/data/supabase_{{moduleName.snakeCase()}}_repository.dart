import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:{{projectName.paramCase()}}/modules/{{moduleName.paramCase()}}/data/{{moduleName.snakeCase()}}_repository.dart';

class Supabase{{moduleName.pascalCase()}}Repository extends {{moduleName.pascalCase()}}Repository {
  final _supabase = Supabase.instance.client;
}
