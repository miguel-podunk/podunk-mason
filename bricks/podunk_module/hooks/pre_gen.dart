import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final moduleName = context.vars['moduleName'] as String;
  final projectName = context.vars['projectName'] as String;

  // Validate module name
  if (moduleName.isEmpty) {
    context.logger.err('Module name cannot be empty');
    exit(1);
  }

  // Validate project name
  if (projectName == 'none' || projectName.isEmpty) {
    context.logger
        .warn('Project name is not set. This may cause import issues.');
    context.logger.info(
        'Consider providing a project name: --projectName your_project_name');
  }

  // Display generation info
  context.logger.info('');
  context.logger.info('🚀 Generating module: $moduleName');
  context.logger.info('📦 Project: $projectName');
  context.logger.info('');

  // Check if modules directory exists, create if not
  final modulesDir = Directory('lib/modules');
  if (!modulesDir.existsSync()) {
    context.logger.info('Creating lib/modules directory...');
    modulesDir.createSync(recursive: true);
  }

  // Check if the module already exists
  final moduleNameParam = moduleName.paramCase;
  final moduleDir = Directory('lib/modules/$moduleNameParam');
  if (moduleDir.existsSync()) {
    final shouldContinue = context.logger.confirm(
      '⚠️  Module "$moduleName" already exists. Continue anyway?',
      defaultValue: false,
    );
    if (!shouldContinue) {
      context.logger.info('Generation cancelled.');
      exit(0);
    }
  }
}
