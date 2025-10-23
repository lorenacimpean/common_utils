import 'package:flutter/material.dart';

/// Provides convenient shortcut getters on [BuildContext] for accessing
/// inherited widgets and properties.
extension BuildContextShortcuts on BuildContext {
  /// Shortcut for `Theme.of(this)`.
  ThemeData get theme => Theme.of(this);

  /// Shortcut for `Theme.of(this).textTheme`.
  TextTheme get textTheme => theme.textTheme;

  /// Shortcut for `MediaQuery.of(this)`.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Shortcut for `MediaQuery.of(this).size`.
  Size get screenSize => mediaQuery.size;

  /// Shortcut for `ScaffoldMessenger.of(this)`.
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);

  /// Shortcut for `Theme.of(this).colorScheme`.
  ColorScheme get colorScheme => theme.colorScheme;

  /// Shortcut for `Theme.of(this).colorScheme.primary`.
  Color get primaryColor => colorScheme.primary;

  /// Shortcut for `Theme.of(this).colorScheme.background`.
  Color get backgroundColor => colorScheme.background;

  //  SCREEN & DEVICE PROPERTIES

  /// Shortcut for `MediaQuery.of(this).size.width`.
  double get screenWidth => screenSize.width;

  /// Shortcut for `MediaQuery.of(this).size.height`.
  double get screenHeight => screenSize.height;

  /// Returns `true` if the device is in dark mode.
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Returns `true` if the keyboard is currently visible.
  bool get isKeyboardVisible => mediaQuery.viewInsets.bottom > 0;
}
