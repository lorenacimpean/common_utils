import 'package:common_utils/common_utils.dart';
import 'package:flutter/widgets.dart';

/// A custom spacer widget for creating consistent vertical and horizontal spacing.
///
/// This widget uses predefined spacing values from the [SoftGrid] class
/// and offers constant constructors for optimal performance. Using this widget
/// is preferred over `SizedBox` for maintaining design consistency.
class AppSpacer extends StatelessWidget {
  final double _width;
  final double _height;

  /// Creates a horizontal spacer with a width of `16.0`.
  const AppSpacer.horizontalL({super.key})
    : _width = SoftGrid.spaceL,
      _height = 0.0;

  // --- Vertical Spacers ---

  /// Creates a horizontal spacer with a width of `12.0`.
  const AppSpacer.horizontalM({super.key})
    : _width = SoftGrid.spaceM,
      _height = 0.0;

  /// Creates a horizontal spacer with a width of `8.0`.
  const AppSpacer.horizontalS({super.key})
    : _width = SoftGrid.spaceS,
      _height = 0.0;

  /// Creates a horizontal spacer with a width of `24.0`.
  const AppSpacer.horizontalXL({super.key})
    : _width = SoftGrid.spaceXL,
      _height = 0.0;

  /// Creates a horizontal spacer with a width of `4.0`.
  const AppSpacer.horizontalXS({super.key})
    : _width = SoftGrid.spaceXS,
      _height = 0.0;

  /// Creates a horizontal spacer with a width of `32.0`.
  const AppSpacer.horizontalXXL({super.key})
    : _width = SoftGrid.spaceXXL,
      _height = 0.0;

  /// Creates a horizontal spacer with a width of `2.0`.
  const AppSpacer.horizontalXXS({super.key})
    : _width = SoftGrid.spaceXXS,
      _height = 0.0;

  /// Creates a horizontal spacer with a width of `48.0`.
  const AppSpacer.horizontalXXXL({super.key})
    : _width = SoftGrid.spaceXXXL,
      _height = 0.0;

  /// Creates a vertical spacer with a height of `16.0`.
  const AppSpacer.verticalL({super.key})
    : _width = 0.0,
      _height = SoftGrid.spaceL;

  // --- Horizontal Spacers ---

  /// Creates a vertical spacer with a height of `12.0`.
  const AppSpacer.verticalM({super.key})
    : _width = 0.0,
      _height = SoftGrid.spaceM;

  /// Creates a vertical spacer with a height of `8.0`.
  const AppSpacer.verticalS({super.key})
    : _width = 0.0,
      _height = SoftGrid.spaceS;

  /// Creates a vertical spacer with a height of `24.0`.
  const AppSpacer.verticalXL({super.key})
    : _width = 0.0,
      _height = SoftGrid.spaceXL;

  /// Creates a vertical spacer with a height of `4.0`.
  const AppSpacer.verticalXS({super.key})
    : _width = 0.0,
      _height = SoftGrid.spaceXS;

  /// Creates a vertical spacer with a height of `32.0`.
  const AppSpacer.verticalXXL({super.key})
    : _width = 0.0,
      _height = SoftGrid.spaceXXL;

  /// Creates a vertical spacer with a height of `2.0`.
  const AppSpacer.verticalXXS({super.key})
    : _width = 0.0,
      _height = SoftGrid.spaceXXS;

  /// Creates a vertical spacer with a height of `48.0`.
  const AppSpacer.verticalXXXL({super.key})
    : _width = 0.0,
      _height = SoftGrid.spaceXXXL;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: _width, height: _height);
  }
}
