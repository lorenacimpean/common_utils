import 'package:common_utils/common_utils.dart';
import 'package:test/test.dart';

void main() {
  final validator = FormValidator.instance;

  group('FormValidator', () {
    group('required', () {
      test('should return error message for null value', () {
        expect(validator.required(null), 'This field is required');
      });

      test('should return error message for empty string', () {
        expect(validator.required(''), 'This field is required');
      });

      test('should return error message for whitespace string', () {
        expect(validator.required('   '), 'This field is required');
      });

      test('should return null for a valid string', () {
        expect(validator.required('hello'), null);
      });
    });

    group('email', () {
      test('should return null for a valid email', () {
        expect(validator.email('test@example.com'), null);
      });

      test('should return error message for an invalid email', () {
        expect(validator.email('invalid-email'), 'Enter a valid email address');
      });

      test('should return null for an empty string (optional field)', () {
        expect(validator.email(''), null);
      });
    });

    group('minLength', () {
      test('should return null if length is greater than min', () {
        expect(validator.minLength('password', 6), null);
      });

      test('should return null if length is equal to min', () {
        expect(validator.minLength('secret', 6), null);
      });

      test('should return error message if length is less than min', () {
        expect(
          validator.minLength('short', 6),
          'Must be at least 6 characters long',
        );
      });
    });

    group('password', () {
      test('should return error message for a weak password', () {
        // Assuming isStrongPassword checks for length, case, and number
        expect(validator.password('weak'), 'Password is not strong enough');
      });

      test('should return null for a strong password', () {
        expect(validator.password('StrongP@ss123'), null);
      });
    });

    group('mustMatch', () {
      test('should return null when values match', () {
        expect(validator.mustMatch('a', 'a'), null);
      });

      test('should return error message when values do not match', () {
        expect(validator.mustMatch('a', 'b'), 'Values do not match');
      });
    });
  });
}
