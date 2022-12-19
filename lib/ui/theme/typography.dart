import 'package:flutter/material.dart';
import 'package:grtts/ui/theme/colors.dart';

abstract class AppTypography {
  static body({Color color = AppColors.onSurface}) => TextStyle(
        fontFamily: "Exo",
        fontSize: 16,
        color: color,
      );
  static bodyBold({Color color = AppColors.onSurface}) => TextStyle(
        fontFamily: "Exo",
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: color,
      );
  static bodyMedium({Color color = AppColors.onSurface}) => TextStyle(
        fontFamily: "Exo",
        fontSize: 18,
        color: color,
      );
  static bodyMediumBold({Color color = AppColors.onSurface}) => TextStyle(
        fontFamily: "Exo",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color,
      );
  static title({Color color = AppColors.onSurface}) => TextStyle(
        fontFamily: "Exo",
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: color,
      );
  static caption({Color color = AppColors.onSurface}) => TextStyle(
        fontFamily: "Exo",
        fontSize: 14,
        color: color,
      );
}
