/// Provides a set of convenient extension methods on [String?] for common
/// input validation tasks.
///
/// This extension allows for a clean, readable, and fluent API when checking
/// the validity of string data.
///
/// {@tool snippet}
///
/// ```dart
/// final email = 'test@example.com';
/// if (email.isEmail) {
///   print('Valid email!');
/// }
///
/// final username = 'user123';
/// if (username.hasLengthInRange(4, 20)) {
///   print('Valid username length!');
/// }
/// ```
/// {@end-tool}
extension StringValidationExtension on String? {
  /// Internal helper to check for regex match. Handles null values.
  bool _hasMatch(String pattern) {
    if (this == null) return false;
    return RegExp(pattern).hasMatch(this!);
  }

  /// Checks if the string is not `null` and contains non-whitespace characters.
  ///
  /// @return `true` if the string has content, `false` otherwise.
  bool get isNotEmpty => this != null && this!.trim().isNotEmpty;

  /// Checks if the string is a valid email address format.
  ///
  /// @return `true` if the string matches a standard email pattern.
  bool get isEmail {
    return _hasMatch(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  }

  /// Checks if the string has at least a [min] number of characters.
  ///
  /// @param min The minimum required length.
  /// @return `true` if the string's length is greater than or equal to [min].
  bool hasMinLength(int min) {
    if (this == null) return false;
    return this!.length >= min;
  }

  /// Checks for a strong password.
  ///
  /// A strong password must meet the following criteria:
  /// - At least 8 characters long.
  /// - Contains at least one uppercase letter.
  /// - Contains at least one lowercase letter.
  /// - Contains at least one digit.
  /// - Contains at least one special character from the set `[@$!%*?&]`.
  ///
  /// @return `true` if the password meets all the specified criteria.
  bool get isStrongPassword {
    return _hasMatch(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
  }

  /// Checks if the string is a valid URL format.
  ///
  /// This uses a common regex for URL validation but may not cover all edge cases.
  ///
  /// @return `true` if the string resembles a URL.
  bool get isUrl {
    return _hasMatch(
      r'^(?:http|https|ftp)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]*[-A-Za-z0-9+&@#/%=~_|]$',
    );
  }

  /// Checks if the string contains only letters and numbers (a-zA-Z0-9).
  ///
  /// @return `true` if the string is purely alphanumeric.
  bool get isAlphanumeric {
    return _hasMatch(r'^[a-zA-Z0-9]+$');
  }

  /// Checks if the string can be parsed as a number (integer or double).
  ///
  /// @return `true` if the string represents a valid number.
  bool get isNumeric {
    if (this == null) return false;
    return num.tryParse(this!) != null;
  }

  /// Checks if the string can be parsed as an integer (a whole number).
  ///
  /// @return `true` if the string represents a valid integer.
  bool get isInteger {
    if (this == null) return false;
    return int.tryParse(this!) != null;
  }

  /// Checks if the string can be parsed as a double.
  ///
  /// @return `true` if the string represents a valid double.
  bool get isDouble {
    if (this == null) return false;
    return double.tryParse(this!) != null;
  }

  /// Checks if the string is a number within a specified inclusive range.
  ///
  /// This first confirms the string is numeric before checking its value.
  ///
  /// @param min The minimum inclusive value.
  /// @param max The maximum inclusive value.
  /// @return `true` if the parsed number is within the range.
  bool isNumericInRange(num min, num max) {
    if (!isNumeric) return false;
    final number = num.parse(this!);
    return number >= min && number <= max;
  }

  /// Checks if the string's length is within an inclusive range.
  ///
  /// @param min The minimum inclusive character length.
  /// @param max The maximum inclusive character length.
  /// @return `true` if the string's length is between [min] and [max].
  bool hasLengthInRange(int min, int max) {
    if (this == null) return false;
    return this!.length >= min && this!.length <= max;
  }

  /// Performs a basic check for a phone number format.
  ///
  /// This is a lenient check that allows for digits, spaces, hyphens, and parentheses.
  /// **Note**: For production apps, use a dedicated package
  /// @return `true` if the string contains characters common to phone numbers.
  bool get isPhoneNumber {
    if (this == null) return false;
    return _hasMatch(r'^\+?[\d\s\-\(\)]+$');
  }

  /// Checks if the string is identical to another string.
  ///
  /// @param other The string to compare against.
  /// @return `true` if this string is exactly the same as [other].
  bool matches(String? other) => this == other;
}
