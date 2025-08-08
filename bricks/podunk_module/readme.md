# flutter_page

A simple Flutter page (StatelessWidget) scaffold.

## Variables
- `name` (string): Page name. Examples: `home`, `settings`, `profile`. Default: `home`.

## Output
Generates a file named `{{name.snakeCase()}}_page.dart` containing a `{{name.pascalCase()}}Page` widget.

## Usage (from repo root)
```bash
mason get
mason make flutter_page --name settings
```

## Example
```dart
// lib/settings_page.dart (generated when name=settings)
class SettingsPage extends StatelessWidget { /* ... */ }
```
```

- Create the directory: `mkdir -p /home/zerkley/Repos/mason_bricks/bricks/flutter_page/__brick__/`
- **`/home/zerkley/Repos/mason_bricks/bricks/flutter_page/__brick__/{{name.snakeCase()}}_page.dart`**
```dart
import 'package:flutter/material.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  static const String routeName = '/{{name.paramCase()}}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{name.titleCase()}}'),
      ),
      body: const Center(
        child: Text('This is the {{name.titleCase()}} page.'),
      ),
    );
  }
}
```

### Minimal usage
- From the repo root:
  - mason get
  - mason make flutter_page --name profile

- Output: `profile_page.dart` with a `ProfilePage` widget.

- Added a local brick `flutter_page` with `brick.yaml`, `README.md`, and a Dart template under `__brick__`, plus root `mason.yaml` referencing it.