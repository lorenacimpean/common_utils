# Common Utils

**common_utils** is a foundational library for Flutter projects, providing a collection of reusable utilities to accelerate your development workflow. It features a robust set of helpers and extensions for common tasks, including theming, comprehensive form validation, and platform-specific adaptations.

## Features

*   **Theming Utilities:** Access your app's theme and media query data with ease using convenient `BuildContext` extensions.
*   **Form Validation:** A comprehensive `FormValidator` class with a wide range of pre-built validation methods for your form fields.
*   **Platform Utilities:** Easily check the current platform (Android, iOS, etc.).
*   **Debugging Tools:** A simple `DebugLogger` for printing messages only in debug mode.

## Getting started

To use this package, add `common_utils` as a [dependency in your pubspec.yaml file](https://flutter.dev/to/develop-packages).

## Usage

Here are some examples of how to use the utilities in this package.

### BuildContext Shortcuts

Access `ThemeData`, `MediaQueryData`, and more directly from your `BuildContext`.

```dart
import 'package:common_utils/common_utils.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight,
      color: context.primaryColor,
      child: Text(
        'Hello, world!',
        style: context.textTheme.headline6,
      ),
    );
  }
}
```

### Form Validation

Use the `FormValidator` singleton to validate your `TextFormField`s.

```dart
import 'package:common_utils/common_utils.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) => FormValidator.instance.required(value),
          ),
          TextFormField(
            validator: (value) {
              return FormValidator.compose([
                () => FormValidator.instance.required(value),
                () => FormValidator.instance.email(value),
              ]);
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Process data
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
```

## Additional information

For more information, feel free to browse the source code. To contribute to this package, please file an issue or submit a pull request.
