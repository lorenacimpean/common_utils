/// A namespace for the 8-point soft grid design tokens.
///
/// This abstract class is not meant to be instantiated or implemented.
/// It's used to group related `static const` values for easy access.
abstract class SoftGrid {
  // Spacing scale — based on an 8px grid for proportional rhythm
  static const double spaceXXS = 2.0;
  static const double spaceXS = 4.0;
  static const double spaceS = 8.0;
  static const double spaceM = 12.0;
  static const double spaceL = 16.0;
  static const double spaceXL = 24.0;
  static const double spaceXXL = 32.0;
  static const double spaceXXXL = 48.0;

  // Radius scale — consistent rounded corners across app
  static const double radiusXS = 4.0;
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;

  // Standard component heights and sizes
  static const double buttonHeight = 48.0;
  static const double textFieldHeight = 56.0;
  static const double iconButtonSize = 48.0;
  static const double avatarSize = 40.0;
}
