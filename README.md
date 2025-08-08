# Mason Bricks Collection

A collection of Mason bricks for Flutter development to help generate boilerplate code quickly and consistently.

## Bricks Available

### podunk_module

A Flutter module generator that creates a complete module structure with repository pattern and Riverpod providers.

**Generated Structure:**
```
modules/your_module/
├── data/
│   ├── your_module_repository.dart (abstract repository)
│   └── supabase_your_module_repository.dart (Supabase implementation)
└── providers/
    └── your_module_repository_provider.dart (Riverpod provider)
```

**Variables:**
- `moduleName`: The name of your module (default: "home")
- `projectName`: The name of your project for imports (default: "none")

## Usage

### Option 1: Install from GitHub (Recommended)

```bash
# Add this brick from GitHub
mason add podunk_module --git-url https://github.com/YOUR_USERNAME/mason_bricks --git-path bricks/podunk_module

# Generate code
mason make podunk_module --moduleName user --projectName my_app
```

### Option 2: Install Locally

```bash
# Clone this repository
git clone https://github.com/YOUR_USERNAME/mason_bricks.git

# Navigate to your Flutter project
cd your_flutter_project

# Add the brick locally
mason add podunk_module --path path/to/mason_bricks/bricks/podunk_module

# Generate code
mason make podunk_module --moduleName user --projectName my_app
```

### Option 3: Global Installation

```bash
# Install globally
mason add -g podunk_module --git-url https://github.com/YOUR_USERNAME/mason_bricks --git-path bricks/podunk_module

# Use anywhere
mason make podunk_module --moduleName user --projectName my_app
```

## Requirements

- [Mason CLI](https://github.com/felangel/mason) installed
- Flutter project using Riverpod for state management
- Project structure that includes a `modules/` directory

## Installation of Mason CLI

```bash
# Install Mason CLI
dart pub global activate mason_cli

# Verify installation
mason --version
```

## Example Usage

```bash
# Navigate to your Flutter project root
cd my_flutter_app

# Generate a user management module
mason make podunk_module --moduleName user --projectName my_flutter_app

# This will create:
# lib/modules/user/
# ├── data/
# │   ├── user_repository.dart
# │   └── supabase_user_repository.dart
# └── providers/
#     └── user_repository_provider.dart
```

## Contributing

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/new-brick`)
3. Add your brick to the `bricks/` directory
4. Update this README with documentation for your brick
5. Commit your changes (`git commit -am 'Add new brick'`)
6. Push to the branch (`git push origin feature/new-brick`)
7. Create a Pull Request

## Update Your Bricks

To get the latest version of bricks in your projects:

```bash
# Update specific brick
mason upgrade podunk_module

# Update all bricks
mason upgrade
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.