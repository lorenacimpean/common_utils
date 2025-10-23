import 'dart:io';

/// A compile-time constant that is `true` if the application is running in
/// debug mode, and `false` in release mode.
///
/// This is determined by checking the `dart.vm.product` environment flag, which
/// is the standard method for creating debug-only logic in pure Dart.
const bool _isDebug = !bool.fromEnvironment('dart.vm.product');

/// A utility class for colored and formatted debug logging in pure Dart.
///
/// This abstract class serves as a namespace and is not meant to be instantiated.
/// It provides a set of static methods for logging that will only print when the
/// application is in debug mode (`!bool.fromEnvironment('dart.vm.product')`).
/// In release builds, calls to these methods are completely ignored with no
/// performance impact.
abstract class DebugLogger {
  // ANSI Color Codes
  static const String _reset = '\x1B[0m';
  static const String _lightPurple = '\x1B[95m';
  static const String _lightBlue = '\x1B[94m';
  static const String _red = '\x1B[31m';

  /// Logs a simple informational message in light purple.
  ///
  /// Automatically includes the class and method from where it was called.
  /// - [message]: The string message to log.
  static void log(String message) {
    if (_isDebug) {
      _printFormatted(color: _lightPurple, title: 'INFO: ', message: message);
    }
  }

  /// Logs a message with an associated data object in light blue.
  ///
  /// Automatically includes the class and method from where it was called.
  /// The [data] object will be converted to a string using its `.toString()` method.
  /// - [message]: A descriptive message for the data.
  /// - [data]: The object to be logged.
  static void logData(String message, Object data) {
    if (_isDebug) {
      _printFormatted(
        color: _lightBlue,
        title: 'DATA: ',
        message: '$message\n${data.toString()}',
      );
    }
  }

  /// Logs an error message with an associated error object and stack trace in red.
  ///
  /// Automatically includes the class and method from where it was called.
  /// - [message]: A descriptive message for the error.
  /// - [error]: The error object (e.g., an `Exception`).
  /// - [stackTrace]: The optional stack trace associated with the error.
  static void logError(String message, Object error, [StackTrace? stackTrace]) {
    if (_isDebug) {
      _printFormatted(
        color: _red,
        title: 'ERROR: ',
        message:
            '$message\n${error.toString()}${stackTrace ?? StackTrace.current}',
      );
    }
  }

  /// A compiled regular expression for efficiently parsing stack trace lines.
  static final _callerInfoRegex = RegExp(r'#\d+\s+(.+)\s+\((.+)\)');

  /// Internal helper to get the caller's location from the stack trace.
  ///
  /// Parses `StackTrace.current` to find the class and method that invoked
  /// the public logging method, providing context for the log message.
  static String _getCallerInfo() {
    try {
      final stack = StackTrace.current.toString().split('\n');
      // The call stack is typically: #0 _getCallerInfo, #1 _printFormatted,
      // #2 log/logData/logError, #3 the actual caller. We target index 3.
      final callerLine = stack.length > 3 ? stack[3] : null;

      if (callerLine != null) {
        final match = _callerInfoRegex.firstMatch(callerLine);
        if (match != null) {
          final location = match.group(1) ?? 'Unknown';
          if (location.contains('.')) {
            final parts = location.split('.');
            return '[Class: ${parts[0]}] [Method: ${parts[1]}]';
          } else {
            return '[Function: $location]';
          }
        }
      }
    } catch (e) {
      // Return a fallback string if parsing fails for any reason.
      return '[Location: Error Parsing Stack]';
    }
    return '[Location: Unknown]';
  }

  /// Internal helper to format and print the final log message.
  ///
  /// Builds the complete log output with demarcation lines, title, caller info,
  /// and the message content using a `StringBuffer` for efficiency.
  static void _printFormatted({
    required String color,
    required String title,
    required String message,
  }) {
    final callerInfo = _getCallerInfo();
    final demarcation = '═' * 80;

    // Use StringBuffer for efficient string building.
    final buffer = StringBuffer();
    buffer.writeln('$color$demarcation$_reset');
    buffer.writeln('$color$title $callerInfo$_reset');
    buffer.writeln(
      message,
    ); // Message is printed without color to preserve its content
    buffer.writeln('$color$demarcation$_reset');

    // Use a single write call to stdout.
    stdout.write(buffer.toString());
  }
}
