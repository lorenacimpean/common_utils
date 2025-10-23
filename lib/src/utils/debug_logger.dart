import 'dart:io';

// This check works in pure Dart.
// In debug mode, assertions are enabled, so the assert runs and sets this to true.
// In release mode, assertions are stripped out, so it remains false.
const bool _isDebug = !bool.fromEnvironment('dart.vm.product');

/// A utility class for colored and formatted debug logging in pure Dart.
///
/// This abstract class is not meant to be instantiated. It provides a set of
/// static methods for logging that only print when the app is in debug mode.
abstract class DebugLogger {
  // ANSI Color Codes
  static const String _reset = '\x1B[0m';
  static const String _lightPurple = '\x1B[95m';
  static const String _lightBlue = '\x1B[94m';
  static const String _red = '\x1B[31m';

  /// Logs a simple informational message in light purple.
  ///
  /// - [message]: The string message to log.
  static void log(String message) {
    if (_isDebug) {
      _printFormatted(color: _lightPurple, title: 'INFO', message: message);
    }
  }

  /// Logs a message with an associated data object in light blue.
  ///
  /// - [message]: A descriptive message for the data.
  /// - [data]: The object to be logged. Its `.toString()` method will be used.
  static void logData(String message, Object data) {
    if (_isDebug) {
      _printFormatted(
        color: _lightBlue,
        title: 'DATA',
        message: '$message\n${data.toString()}',
      );
    }
  }

  /// Logs an error message with an associated error object in red.
  ///
  /// - [message]: A descriptive message for the error.
  /// - [error]: The error object (e.g., an Exception).
  /// - [stackTrace]: The optional stack trace.
  static void logError(String message, Object error, [StackTrace? stackTrace]) {
    if (_isDebug) {
      _printFormatted(
        color: _red,
        title: 'ERROR',
        message:
            '$message\n${error.toString()}${stackTrace == null ? '' : '\n$stackTrace'}',
      );
    }
  }

  /// Internal helper to get the caller's location from the stack trace.
  /// Internal helper to get the caller's location from the stack trace.
  static String _getCallerInfo() {
    try {
      final stack = StackTrace.current.toString().split('\n');
      if (stack.length > 3) {
        final callerLine = stack[3];
        final parts = callerLine.split(RegExp(r'\s+'));
        final location = parts.length > 1 ? parts[1] : 'Unknown';

        // Split the location by the dot to separate class and method
        if (location.contains('.')) {
          final locationParts = location.split('.');
          final className = locationParts[0];
          final methodName = locationParts[1];
          return '[Class: $className] [Method: $methodName]';
        } else {
          // Handle cases where the call is from a top-level function
          return '[Function: $location]';
        }
      }
    } catch (e) {
      // Fallback in case of a parsing error
      DebugLogger.logError('Failed to parse stack trace for caller info', e);
    }
    return '[Location: Unknown]';
  }

  /// Internal helper to format and print the log message.
  static void _printFormatted({
    required String color,
    required String title,
    required String message,
  }) {
    final callerInfo = _getCallerInfo();
    final demarcation = '═' * 80;

    stdout.writeln('$color$demarcation$_reset');
    stdout.writeln('$color$title $callerInfo$_reset');
    stdout.writeln('$color$message$_reset');
    stdout.writeln('$color$demarcation$_reset');
  }
}
