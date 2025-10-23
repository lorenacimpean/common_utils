import 'package:flutter/material.dart';

/// A centralized namespace for the application's typographic design tokens.
///
/// This abstract class is not meant to be instantiated. It provides a single
/// source of truth for all foundational typographic values, including a modular
/// font scale, standard font weights, and line height multipliers.
abstract class Typography {
  // -- Modular Typographic Scale --
  // A set of font sizes with increasing intervals to create a harmonious
  // and clear visual hierarchy.

  /// 6.0 - Micro, for tiny, non-essential text or icon labels. Use sparingly.
  static const double fontSizeXXXXS = 6.0;

  /// 8.0 - Tiny, for very small tags, icon labels, or condensed information.
  static const double fontSizeXXXS = 8.0;

  /// 10.0 - Extra extra small, for legal text or fine print.
  static const double fontSizeXXS = 10.0;

  /// 12.0 - Extra small, suitable for captions or secondary information.
  static const double fontSizeXS = 12.0;

  /// 14.0 - Small, often used for standard body text.
  static const double fontSizeS = 14.0;

  /// 16.0 - Medium, for larger body text or subheadings.
  static const double fontSizeM = 16.0;

  /// 20.0 - Large, typically used for H3 or small titles.
  static const double fontSizeL = 20.0;

  /// 24.0 - Extra large, typically used for H2 or medium titles.
  static const double fontSizeXL = 24.0;

  /// 32.0 - Extra extra large, for H1 or primary headings.
  static const double fontSizeXXL = 32.0;

  /// 48.0 - Giant, reserved for display or hero text.
  static const double fontSizeXXXL = 48.0;

  // -- Font Weights --
  // Standard font weight values from thin to bold.

  /// Light font weight (w300).
  static const FontWeight light = FontWeight.w300;

  /// Regular font weight (w400), the default for most text.
  static const FontWeight regular = FontWeight.w400;

  /// Medium font weight (w500), for slightly more emphasis.
  static const FontWeight medium = FontWeight.w500;

  /// Semi-bold font weight (w600), for strong emphasis.
  static const FontWeight semiBold = FontWeight.w600;

  /// Bold font weight (w700), for headings and titles.
  static const FontWeight bold = FontWeight.w700;

  // -- Line Heights (Leading) --
  // Multipliers for calculating line height based on font size.
  // A line height of 1.5 means the line's height is 150% of the font size.

  /// 1.2 - For tight spacing, often used in headings.
  static const double tight = 1.2;

  /// 1.5 - For comfortable reading, standard for body text.
  static const double regularHeight = 1.5;

  /// 1.7 - For loose, airy spacing.
  static const double loose = 1.7;
}
