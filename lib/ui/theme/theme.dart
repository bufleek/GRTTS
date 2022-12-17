import 'package:flutter/material.dart';
import 'package:grtts/ui/theme/colors.dart';
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
  fontFamily: "Exo",
);
