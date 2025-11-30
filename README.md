# Common Utils

**common_utils** is a Flutter utility package that provides a collection of helpers and extensions covering the most common tasks when starting a new project, including theming, form validation, and platform-specific logic, helping reduce boilerplate code.
## Features

* **Theming:** A suite of theming helpers for consistent spacing, sizing, and typography.
* **Validation:** A robust `FormValidator` class with a wide range of pre-built validation methods.
* **Extensions:** Useful Dart extensions for `BuildContext`, `String`, and `Iterable`.
* **Utilities:** Helpers for platform-specific logic and debug logging.

## Getting Started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  common_utils: ^1.0.0 # Replace with the latest version
```

Then, import the package in your Dart files:

```dart
import 'package:common_utils/common_utils.dart';
```

## Usage

### Form Validation

Quickly add validation to any `TextFormField` using the `FormValidator` singleton.

```dart
TextFormField(
  validator: (value) => FormValidator.compose([
    () => FormValidator.instance.required(value),
    () => FormValidator.instance.email(value),
  ]),
),
```

### String Extensions

Easily manipulate strings with helpful extension methods.

```dart
'hello world'.toTitleCase(); // -> 'Hello World'

'some text'.capitalize(); // -> 'Some text'

'  remove spaces  '.removeWhitespace(); // -> 'removespaces'
```

### BuildContext Shortcuts

Access theme and media query properties without the boilerplate.

```dart
// Instead of this:
// width: MediaQuery.of(context).size.width,
// color: Theme.of(context).primaryColor,

// Do this:
Container(
  width: context.screenWidth,
  color: context.primaryColor,
  child: Text(
    'Hello!',
    style: context.textTheme.headlineMedium,
  ),
);
```

## Additional Information

* **Source Code:** [https://github.com/lorenacimpean/common_utils](https://github.com/lorenacimpean/common_utils)
* **Issue Tracker:** [https://github.com/lorenacimpean/common_utils/issues](https://github.com/lorenacimpean/common_utils/issues)

To contribute to this package, please feel free to file an issue or submit a pull request.
