import 'package:flutter/material.dart';

abstract class AppTypography {
  static body({Color? color}) => TextStyle(
        fontFamily: "Exo",
        fontSize: 16,
        color: color,
      );
  static bodyBold({Color? color}) => TextStyle(
        fontFamily: "Exo",
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: color,
      );
  static bodyMedium({Color? color}) => TextStyle(
        fontFamily: "Exo",
        fontSize: 18,
        color: color,
      );
  static bodyMediumBold({Color? color}) => TextStyle(
        fontFamily: "Exo",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color,
      );
  static title({Color? color}) => TextStyle(
        fontFamily: "Exo",
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: color,
      );
}
