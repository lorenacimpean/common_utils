import 'package:diacritic/diacritic.dart';

/// Provides a set of convenient extension methods on [String?] for common
/// text manipulation, formatting, and parsing tasks.

extension CommonStringExtensions on String? {
  /// Converts the first letter of each word in a string to uppercase.
  ///
  /// Trims leading/trailing whitespace before processing and splits by one
  /// or more whitespace characters. Handles `null` or empty strings gracefully.
  ///
  /// @return A new [String] in title case, or `null` if the original was `null`.
  /// @example
  /// 'hello world'.toTitleCase() // -> 'Hello World'
  /// '  dart  flutter '.toTitleCase() // -> 'Dart Flutter'
  String? toTitleCase() {
    if (this == null || this!.trim().isEmpty) return this;
    return this!
        .trim()
        .split(RegExp(r'\s+'))
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  /// Converts only the first letter of the entire string to uppercase.
  /// Leaves the rest of the string as is.
  /// @return A new [String] with the first letter capitalized, or `null`.
  /// @example
  /// 'hello world'.capitalize() // -> 'Hello world'
  String? capitalize() {
    if (this == null || this!.isEmpty) return this;
    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }

  /// Checks if the string contains a given [other] string, ignoring case.

  /// @param [other] The [String] to search for.
  /// @return `true` if the string contains [other] in a case-insensitive manner,
  /// otherwise `false`.
  /// Returns `false` if the original string is `null`.
  bool containsIgnoreCase(String other) {
    if (this == null) return false;
    return this!.toLowerCase().contains(other.toLowerCase());
  }

  /// Safely parses the string into an [int], returning `null` on failure.
  /// This is a convenient wrapper for `int.tryParse()`.
  /// @return The parsed [int], or `null` if the string is `null` or not a
  /// valid integer.
  int? toIntOrNull() {
    if (this == null) return null;
    return int.tryParse(this!);
  }

  /// Safely parses the string into a [double], returning `null` on failure.
  /// This is a convenient wrapper for `double.tryParse()`.
  /// @return The parsed [double], or `null` if the string is `null` or not a
  /// valid double.
  double? toDoubleOrNull() {
    if (this == null) return null;
    return double.tryParse(this!);
  }

  /// Truncates the string to a specified [maxLength] and appends an [ellipsis].
  /// @param [maxLength] The maximum number of characters to keep from the original.
  /// @param [ellipsis] The [String] to append if truncation occurs.
  /// @return The truncated [String], or the original if it's `null` or
  /// shorter than [maxLength].
  String? truncate(int maxLength, {String ellipsis = '...'}) {
    if (this == null || this!.length <= maxLength) return this;
    return '${this!.substring(0, maxLength)}$ellipsis';
  }

  /// Removes all whitespace characters (spaces, tabs, newlines) from the string.
  /// @return A new [String] with all whitespace removed, or `null`.
  /// @example
  /// '  hello   world  '.removeWhitespace() // -> 'helloworld'
  String? removeWhitespace() {
    if (this == null) return null;
    return this!.replaceAll(RegExp(r'\s+'), '');
  }

  /// Checks if the string contains a [query] string, ignoring both case
  /// and diacritics (accents).
  /// This is ideal for user-facing search, allowing "timisoara" to match
  /// "Timișoara". Relies on the `removeDiacritics` function from the
  /// `package:diacritic/diacritic.dart`.
  /// @param [query] The [String] to search for.
  /// @return `true` if the string contains [query] in a case-insensitive and
  ///  diacritic-insensitive manner.
  bool containsIgnoreCaseAndDiacritics(String query) {
    if (this == null) return false;

    final normalizedText = removeDiacritics(this!).toLowerCase();
    final normalizedQuery = removeDiacritics(query).toLowerCase();

    return normalizedText.contains(normalizedQuery);
  }
}
