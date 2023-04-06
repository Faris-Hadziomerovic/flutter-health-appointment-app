import 'package:flutter/material.dart';

import './app_colors.dart';
import './app_shapes.dart';

/// Class that contains the themes used throughout the app.
class AppTheme {
  /// The <code>ThemeData</code> that's used to configure
  /// the light mode app theme.
  static ThemeData get appThemeData => ThemeData(
        colorScheme: AppColors.colorScheme,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: AppColors.colorScheme.primary,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: AppColors.colorScheme.primary,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          titleSmall: TextStyle(
            color: AppColors.colorScheme.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: AppColors.colorScheme.primary,
            fontSize: 15,
            fontWeight: FontWeight.w200,
          ),
        ),
        scaffoldBackgroundColor: AppColors.colorScheme.background,
        appBarTheme: AppBarTheme(
          color: AppColors.colorScheme.background,
          foregroundColor: AppColors.colorScheme.onBackground,
          titleTextStyle: TextStyle(
            color: AppColors.colorScheme.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: AppColors.colorScheme.primary,
            size: 30,
          ),
          elevation: 0,
          scrolledUnderElevation: 5,
          toolbarHeight: 85,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.colorScheme.secondary,
          foregroundColor: AppColors.colorScheme.onPrimary,
          splashColor: AppColors.colorScheme.secondary,
          iconSize: 30,
          extendedTextStyle: const TextStyle(
            fontSize: 17,
          ),
        ),
        dialogTheme: const DialogTheme(
          shape: AppShapes.roundedShapeRadius15,
        ),
        snackBarTheme: const SnackBarThemeData(
          elevation: 0,
          backgroundColor: AppColors.overlayColor,
          shape: AppShapes.roundedShapeTopRadius10,
        ),
        cardTheme: const CardTheme(
          elevation: 3,
          shape: AppShapes.roundedShapeRadius10,
        ),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            // backgroundColor: MaterialStatePropertyAll(AppColors.buttonColor),
            // foregroundColor: MaterialStatePropertyAll(AppColors.onButtonColor),
            shape: MaterialStatePropertyAll(AppShapes.roundedShapeRadius15),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: const MaterialStatePropertyAll(AppShapes.roundedShapeRadius10),
            side: MaterialStatePropertyAll(
              BorderSide(
                width: 1.2,
                color: AppColors.colorScheme.primary,
              ),
            ),
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            visualDensity: VisualDensity.compact,
          ),
        ),
      );
}
