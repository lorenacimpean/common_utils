import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;

/// A utility class providing easy access to platform-specific information.
/// This class helps abstract away the platform-checking logic, making your
/// UI and business logic code cleaner and more readable.
class PlatformUtils {
  PlatformUtils._(); // Private constructor

  static bool get isMobile => Platform.isIOS || Platform.isAndroid;

  static bool get isDesktop =>
      Platform.isWindows || Platform.isLinux || Platform.isMacOS;

  static bool get isWeb => kIsWeb;

  static bool get isIOS => !kIsWeb && Platform.isIOS;

  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
}
