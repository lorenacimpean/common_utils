import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

/// A utility class for colored and formatted debug logging in pure Dart.
///
/// This abstract class serves as a namespace and is not meant to be instantiated.
/// It provides a set of static methods for logging that will only print when the
/// application is in debug mode (`kDebugMode`).
///
/// In debug builds, logs are formatted with optional ANSI colors, caller context,
/// and visual separators for readability.
///
/// On platforms where ANSI colors are not supported (such as iOS/macOS in Xcode),
/// color output is automatically disabled to ensure clean and readable logs.
///
/// In release builds, calls to these methods are ignored and have no performance
/// impact.
abstract class DebugLogger {
  // ANSI Color Codes (used only on supported platforms)
  static const String _reset = '\x1B[0m';
  static const String _lightPurple = '\x1B[95m';
  static const String _lightBlue = '\x1B[94m';
  static const String _red = '\x1B[31m';

  /// Regular expression used to extract caller information
  /// from a stack trace line.
  static final _callerInfoRegex = RegExp(r'#\d+\s+(.+)\s+\((.+)\)');

  /// Returns the ANSI reset code if supported, otherwise an empty string.
  static String get _r => _supportsAnsi ? _reset : '';

  /// Whether the current platform supports ANSI color output.
  ///
  /// Xcode’s console (iOS/macOS) does not reliably support ANSI escape sequences,
  /// so colors are disabled on those platforms.
  static bool get _supportsAnsi => !Platform.isIOS && !Platform.isMacOS;

  /// Logs a simple informational message.
  ///
  /// The message is displayed with a visual separator and optional coloring.
  /// Caller information (class/method/function) is automatically included.
  ///
  /// - [message]: The informational message to log.
  static void log(String message) {
    if (!kDebugMode) return;

    _printFormatted(
      color: _c(_lightPurple),
      title: 'INFO',
      message: message,
    );
  }

  /// Logs a message with an associated data object.
  ///
  /// The [data] object is converted to a string using its `toString()` method.
  /// This is useful for debugging structured objects or API responses.
  ///
  /// - [message]: A descriptive label for the data.
  /// - [data]: The object to log.
  static void logData(String message, Object data) {
    if (!kDebugMode) return;

    _printFormatted(
      color: _c(_lightBlue),
      title: 'DATA',
      message: '$message\n$data',
    );
  }

  /// Logs an error message with optional stack trace information.
  ///
  /// Errors are highlighted for visibility and include caller context.
  ///
  /// - [message]: A human-readable description of the error.
  /// - [error]: The error or exception object.
  /// - [stackTrace]: Optional stack trace associated with the error.
  static void logError(
    String message,
    Object error, [
    StackTrace? stackTrace,
  ]) {
    if (!kDebugMode) return;

    _printFormatted(
      color: _c(_red),
      title: 'ERROR',
      message: '$message\n$error\n${stackTrace ?? StackTrace.current}',
    );
  }

  /// Returns the ANSI color code if supported, otherwise an empty string.
  static String _c(String color) => _supportsAnsi ? color : '';

  /// Extracts information about the calling method or function.
  ///
  /// This method inspects the current stack trace to determine the
  /// class, method, or function that invoked the public logging API.
  ///
  /// If parsing fails, a fallback value is returned.
  static String _getCallerInfo() {
    try {
      final stack = StackTrace.current.toString().split('\n');

      // Stack layout (typical):
      // #0 _getCallerInfo
      // #1 _printFormatted
      // #2 log/logData/logError
      // #3 Actual caller  <-- target
      final callerLine = stack.length > 3 ? stack[3] : null;

      if (callerLine != null) {
        final match = _callerInfoRegex.firstMatch(callerLine);

        if (match != null) {
          final location = match.group(1) ?? 'Unknown';

          if (location.contains('.')) {
            final parts = location.split('.');
            return '${parts[0]}.${parts[1]}';
          }

          return location;
        }
      }
    } catch (_) {
      // Intentionally ignored: fallback will be used.
    }

    return 'Unknown';
  }

  /// Formats and prints the final log message.
  ///
  /// Builds a structured, multi-line log entry containing:
  /// - A visual separator
  /// - Log level title
  /// - Caller information
  /// - Message content
  ///
  /// Output is written using `print()` to avoid truncation issues
  /// that occur with `debugPrint` on some platforms (notably iOS).
  static void _printFormatted({
    required String color,
    required String title,
    required String message,
  }) {
    final callerInfo = _getCallerInfo();
    final separator = '═' * 80;

    final buffer = StringBuffer()
      ..writeln('$color$separator$_r')
      ..writeln('$color[$title] [$callerInfo]$_r')
      ..writeln(message)
      ..writeln('$color$separator$_r');

    // Use print instead of debugPrint to avoid truncation on iOS.
    print(buffer.toString());
  }
}
