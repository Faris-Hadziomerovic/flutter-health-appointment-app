import 'package:flutter/material.dart';

/// Class that contains colors used throughout the app.
class AppColors {
  /// The primary color of the app
  static const primaryColor = Color(0xFF121563);

  /// A color that contrasts the primary color of the app
  static const onPrimaryColor = Color(0xFFFFFFFF);

  /// The secondary color of the app
  static const secondaryColor = Color(0xFF484CBC);

  /// A color that contrasts the secondary color of the app
  static const onSecondaryColor = Color(0xFFFFFFFF);

  /// The tertiary color of the app
  static const tertiaryColor = Color(0xFFEBEBF6);

  /// A color that contrasts the tertiary color of the app
  static const onTertiaryColor = Color(0xFF121563);

  /// The background color of the app
  static const backgroundColor = Color(0xFFFFFFFF);

  /// A color that contrasts the background color of the app
  static const onBackgroundColor = Color(0xFF121563);

  /// The icon color
  static const iconColor = Color(0xFF484CBC);

  /// The color of translucent overlays.
  /// To be used with snackBar and toast widgets as their background.
  static const overlayColor = Color(0x88484CBC);

  /// The error color of the app
  static const errorColor = Color(0xFFFF0000);

  /// The active label color
  static const activeLabelColor = Color(0xFF0477FF);

  /// The completed label color
  static const completedLabelColor = Color(0xFF5FCD39);

  /// A <code>ColorScheme</code> generated for a light app theme.
  /// Uses the global primary and secondary color in the seed.
  static ColorScheme get colorScheme => ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        onPrimary: onPrimaryColor,
        secondary: secondaryColor,
        onSecondary: onSecondaryColor,
        tertiary: tertiaryColor,
        onTertiary: onTertiaryColor,
        background: backgroundColor,
        onBackground: onBackgroundColor,
        error: errorColor,
      );

  /// The primary text color
  static const textColor = Color(0xFF121563);

  /// The primary button color
  static const buttonColor = Color(0xFF121563);

  /// A color that contrasts the primary button color
  static const onButtonColor = Color(0xFFFFFFFF);
}
