import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final moduleName = context.vars['moduleName'] as String;
  final moduleNameParam = moduleName.paramCase;

  // Format the generated code
  final formatProgress = context.logger.progress('Formatting generated code');
  try {
    final formatResult = await Process.run(
      'dart',
      ['format', 'lib/modules/$moduleNameParam/'],
    );
    if (formatResult.exitCode == 0) {
      formatProgress.complete('✓ Code formatted successfully');
    } else {
      formatProgress.fail('✗ Code formatting failed');
      context.logger.err('Format error: ${formatResult.stderr}');
    }
  } catch (e) {
    formatProgress.fail('✗ Code formatting failed');
    context.logger.warn('dart format not available or failed: $e');
  }

  // Run build_runner to generate .g.dart files
  final buildProgress = context.logger.progress('Generating .g.dart files');
  try {
    final buildResult = await Process.run(
      'dart',
      ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    );
    if (buildResult.exitCode == 0) {
      buildProgress.complete('✓ Code generation completed');
    } else {
      buildProgress.fail('✗ Code generation failed');
      context.logger.err('Build runner error: ${buildResult.stderr}');
    }
  } catch (e) {
    buildProgress.fail('✗ Code generation failed');
    context.logger.warn('build_runner not available or failed: $e');
  }

  // Apply automatic Dart fixes
  final fixProgress = context.logger.progress('Applying automatic fixes');
  try {
    final fixResult = await Process.run(
      'dart',
      ['fix', '--apply'],
    );
    if (fixResult.exitCode == 0) {
      fixProgress.complete('✓ Automatic fixes applied');
    } else {
      fixProgress.fail('✗ Automatic fixes failed');
      context.logger.err('Dart fix error: ${fixResult.stderr}');
    }
  } catch (e) {
    fixProgress.fail('✗ Automatic fixes failed');
    context.logger.warn('dart fix not available or failed: $e');
  }

  // Display completion message
  context.logger.info('');
  context.logger.info('🎉 Module "$moduleName" generated successfully!');
  context.logger.info('');
  context.logger.info('Generated files:');
  context.logger.info(
      '  • lib/modules/$moduleNameParam/data/${moduleName.snakeCase}_repository.dart');
  context.logger.info(
      '  • lib/modules/$moduleNameParam/data/supabase_${moduleName.snakeCase}_repository.dart');
  context.logger.info(
      '  • lib/modules/$moduleNameParam/providers/${moduleName.paramCase}_repository_provider.dart');
  context.logger.info('');
  context.logger.info('Next steps:');
  context.logger.info('  1. Implement your repository methods');
  context.logger.info('  2. Add your business logic');
  context.logger.info('  3. Use the provider in your widgets');
}
