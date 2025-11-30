import 'package:project_starter_kit/src/utils/validation/validation_extension.dart';

/// A singleton class that provides validation methods for form fields.
///
/// It uses the [StringValidationExtension] for its core logic and adapts
/// the boolean results into error messages suitable for the UI.
class FormValidator {
  static final FormValidator instance = FormValidator._();
  FormValidator._();

  /// Validates if the string contains only letters and numbers.
  ///
  /// This check ensures the string has no spaces, symbols, or special
  /// characters. The validation is only performed if the [value] is not empty.
  /// An empty or null string is considered valid.
  ///
  /// @param [value] The string to validate.
  /// @param [message] The custom error message to return on validation failure.
  /// @return A [String] error message if validation fails, otherwise `null`.
  ///
  /// @example
  /// TextFormField(
  ///   validator: (value) => FormValidator.instance.alphanumeric(
  ///     value,
  ///     message: 'Your username can only have letters and numbers.'
  ///   ),
  /// )
  String? alphanumeric(
    String? value, {
    String message = 'Only letters and numbers are allowed',
  }) => (value.isNotEmpty && !value.isAlphanumeric) ? message : null;

  /// Validates if the string is a well-formed email address.
  ///
  /// This check is only performed if the [value] is not empty. An empty or
  /// null string is considered valid by this method, allowing for optional
  /// email fields. For required fields, compose this with `required()`.
  ///
  /// @param [value] The string to validate.
  /// @param [message] The custom error message to return on validation failure.
  /// @return A [String] error message if the format is invalid, otherwise `null`.
  ///
  /// @example
  /// TextFormField(
  ///   validator: (value) {
  ///     return FormValidator.instance.required(value) ??
  ///            FormValidator.instance.email(value);
  ///   },
  /// )
  String? email(
    String? value, {
    String message = 'Enter a valid email address',
  }) => (value.isNotEmpty && !value.isEmail) ? message : null;

  /// Validates if a numeric string is within a specific inclusive range.
  ///
  /// This validator first checks if the string is numeric before checking the range.
  /// If a custom [message] is not provided, a default one is used.
  ///
  /// @param [value] The string to validate.
  /// @param [message] The custom error message to return on validation failure.
  /// @param [min] The minimum allowed numeric value.
  /// @param [max] The maximum allowed numeric value.
  /// @return A [String] error message if the value is not in range, otherwise `null`.
  String? inRange(String? value, num min, num max, {String? message}) =>
      (value.isNotEmpty && !value.isNumericInRange(min, max))
      ? message ?? 'Must be between $min and $max'
      : null;

  /// Validates if the string represents a valid integer (a whole number).
  ///
  /// The check ensures the string contains no decimal points. It is only
  /// performed on non-empty strings.
  ///
  /// @param [value] The string to validate.
  /// @param [message] The custom error message to return on validation failure.
  /// @return A [String] error message if the value is not an integer, otherwise `null`.
  String? integer(String? value, {String message = 'Must be a whole number'}) =>
      (value.isNotEmpty && !value.isInteger) ? message : null;

  /// Validates if the string's length is within an inclusive range.
  ///
  /// This is useful for inputs like usernames or bios that must have a
  /// specific character count.
  ///
  /// @param [value] The string to validate.
  /// @param [message] The custom error message to return on validation failure.
  /// @param [min] The minimum allowed numeric value.
  /// @param [max] The maximum allowed numeric value.

  /// @return A [String] error message if the length is not in range, otherwise `null`.
  String? lengthInRange(String? value, int min, int max, {String? message}) =>
      (value.isNotEmpty && !value.hasLengthInRange(min, max))
      ? message ?? 'Must be between $min and $max characters'
      : null;

  /// Validates that the string has a minimum character length.
  ///
  /// The check is only performed on non-empty strings. If a custom [message]
  /// is not provided, a default message including the minimum length will be used.
  ///
  /// @param [value] The string to validate.
  /// @param [message] The custom error message to return on validation failure.
  /// @param [min] The minimum required character length.
  /// @return A [String] error message if the string is too short, otherwise `null`.
  ///
  /// @example
  /// TextFormField(
  ///   validator: (value) => FormValidator.instance.minLength(value, 8),
  /// )
  String? minLength(String? value, int min, {String? message}) =>
      (value.isNotEmpty && !value.hasMinLength(min))
      ? message ?? 'Must be at least $min characters long'
      : null;

  /// ↔️ Validates if two values are identical.
  ///
  /// This is commonly used for password confirmation fields to ensure that the
  /// user has typed the same password twice.
  ///
  /// @param value1 The first value to compare.
  /// @param value2 The second value to compare against.
  /// @param message The custom error message to return on validation failure.
  /// @return A [String] error message if the values do not match, otherwise `null`.
  ///
  /// @example
  /// // In a 'Confirm Password' field's validator:
  /// validator: (value) => validator.mustMatch(value, _passwordController.text),
  String? mustMatch(
    String? value1,
    String? value2, {
    String message = 'Values do not match',
  }) => !value1.matches(value2) ? message : null;

  /// Validates if the string represents a valid number (integer or double).
  ///
  /// The check is only performed on non-empty strings. An empty or null string
  /// is considered valid, allowing for optional numeric fields.
  ///
  /// @param [value] The string to validate.
  /// @param [message] The custom error message to return on validation failure.
  /// @return A [String] error message if the value is not numeric, otherwise `null`.
  String? numeric(String? value, {String message = 'Must be a number'}) =>
      (value.isNotEmpty && !value.isNumeric) ? message : null;

  /// Validates for a strong password based on a set of criteria.
  ///
  /// This method relies on the `isStrongPassword` extension, which typically
  /// checks for a minimum length and a mix of uppercase letters, lowercase
  /// letters, numbers, and special characters.
  ///
  /// @param [value] The string to validate.
  /// @param [message] The custom error message to return on validation failure.
  /// @return A [String] error message if the password is not strong enough, otherwise `null`.
  ///
  /// @example
  /// TextFormField(
  ///   obscureText: true,
  ///   validator: (value) => FormValidator.instance.password(value),
  /// )
  String? password(
    String? value, {
    String message = 'Password is not strong enough',
  }) => (value.isNotEmpty && !value.isStrongPassword) ? message : null;

  /// Validates if the string resembles a phone number.
  ///
  /// This performs a basic, lenient check. For robust, production-grade
  /// international phone number validation, using a specialized package like
  /// `libphonenumber_plugin` is strongly recommended.
  ///
  /// @param [value] The string to validate.
  /// @param [message] The custom error message to return on validation failure.
  /// @return A [String] error message if the value is not a valid phone number, otherwise `null`.
  String? phoneNumber(
    String? value, {
    String message = 'Enter a valid phone number',
  }) => (value.isNotEmpty && !value.isPhoneNumber) ? message : null;

  /// Validates that a field is not empty.
  ///
  /// Checks if the provided [value] is not `null` and does not consist solely
  /// of whitespace. This is the most common validator for required fields.
  ///
  /// @param [value] The string to validate.
  /// @param [message] The custom error message to return on validation failure.
  /// @return A [String] error message if the value is empty or null, otherwise `null`.
  ///
  /// @example
  /// TextFormField(
  ///   validator: (value) => FormValidator.instance.required(value),
  /// )
  String? required(
    String? value, {
    String message = 'This field is required',
  }) => value.isNotEmpty ? null : message;

  /// Validates if the string is a well-formed URL.
  ///
  /// This check is only performed if the [value] is not empty. An empty or
  /// null string is considered valid by this method, allowing for optional
  /// URL fields. For required fields, compose this with `required()`.
  ///
  /// @param [value] The string to validate.
  /// @param [message] The custom error message to return on validation failure.
  /// @return A [String] error message if validation fails, otherwise `null`.
  ///
  /// @example
  /// TextFormField(
  ///   validator: (value) => FormValidator.instance.url(value),
  /// )
  String? url(String? value, {String message = 'Enter a valid URL'}) =>
      (value.isNotEmpty && !value.isUrl) ? message : null;

  /// Composes multiple validators into a single validation function.
  ///
  /// Executes a list of validator functions in order and returns the first
  /// error message encountered. If all validators pass, it returns `null`.
  ///
  /// @param [validators] A list of validation functions to execute. Each function
  ///   should take no arguments and return a `String?`.
  /// @return The first validation error message, or `null` if all are valid.
  ///
  /// @example
  /// validator: (value) => FormValidator.compose([
  ///   () => FormValidator.instance.required(value),
  ///   () => FormValidator.instance.minLength(value, 8),
  ///   () => FormValidator.instance.password(value),
  /// ]),
  static String? compose(List<String? Function()> validators) {
    for (final validator in validators) {
      final error = validator();
      if (error != null) {
        return error;
      }
    }
    return null;
  }
}
