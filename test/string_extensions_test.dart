import 'package:common_utils/src/utils/validation/common_string_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('StringExtensions', () {
    group('capitalize', () {
      test('should make the first letter uppercase for a standard string', () {
        expect('hello'.capitalize(), 'Hello');
      });

      test('should return an empty string if the input is empty', () {
        expect(''.capitalize(), '');
      });

      test('should handle a single character string', () {
        expect('a'.capitalize(), 'A');
      });

      test('should return null if the string is null', () {
        String? text;
        expect(text.capitalize(), null);
      });

      test('should not change an already capitalized string', () {
        expect('World'.capitalize(), 'World');
      });
    });

    group('toTitleCase', () {
      test('should capitalize the first letter of each word', () {
        expect(
          'hello world from flutter'.toTitleCase(),
          'Hello World From Flutter',
        );
      });

      test('should handle extra spaces between words correctly', () {
        expect(
          '  this should remove leading and trailing spaces  '.toTitleCase(),
          'This Should Remove Leading And Trailing Spaces',
        );
      });

      test('should return an empty string if the input is empty', () {
        expect(''.toTitleCase(), '');
      });

      test('should return null if the string is null', () {
        String? text;
        expect(text.toTitleCase(), null);
      });
    });
  });
}
