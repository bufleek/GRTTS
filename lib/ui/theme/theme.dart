import 'package:flutter/material.dart';
import 'package:grtts/ui/theme/colors.dart';
import 'package:grtts/ui/theme/typography.dart';
import 'package:material_color_generator/material_color_generator.dart';

final theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: generateMaterialColor(color: AppColors.primary),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      error: AppColors.error,
      onError: AppColors.onError,
      background: AppColors.white,
      onBackground: AppColors.black,
    ),
    scaffoldBackgroundColor: AppColors.primary,
    fontFamily: "Exo",
    elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.secondary));

final elevatedButtonStyle = ButtonStyle(
  elevation: const MaterialStatePropertyAll(0.0),
  padding: const MaterialStatePropertyAll(
    EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  ),
  backgroundColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? AppColors.secondary.withAlpha(128)
        : AppColors.secondary;
  }),
  textStyle: MaterialStatePropertyAll(
    AppTypography.bodyBold(color: AppColors.onSecondary),
  ),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide.none,
    ),
  ),
);
