import 'package:flutter/material.dart';
import 'package:grtts/ui/theme/colors.dart';
import 'package:grtts/ui/theme/typography.dart';

OutlineInputBorder _buildOutlineInputBorder(
    {Color color = AppColors.onSurface}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color),
  );
}

class OutlinedInput extends StatelessWidget {
  const OutlinedInput({
    super.key,
    required this.label,
    this.hint,
    this.textInputType,
    this.validator,
    this.onchaged,
    this.obscureText = false,
    this.error,
    this.initialValue,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
  });

  final String label;
  final String? hint;
  final TextInputType? textInputType;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String>? onchaged;
  final bool obscureText;
  final String? error;
  final String? initialValue;
  final TextEditingController? controller;
  final bool enabled;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.body(),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: TextFormField(
            enabled: enabled,
            readOnly: readOnly,
            obscureText: obscureText,
            keyboardType: textInputType,
            initialValue: initialValue,
            controller: controller,
            onChanged: onchaged,
            validator: validator,
            decoration: InputDecoration(
              errorText: error,
              hintText: hint,
              hintStyle:
                  AppTypography.body(color: AppColors.onSurface.withAlpha(180)),
              border: _buildOutlineInputBorder(),
              enabledBorder: _buildOutlineInputBorder(),
              focusedBorder:
                  _buildOutlineInputBorder(color: AppColors.secondary),
              errorBorder: _buildOutlineInputBorder(color: AppColors.error),
              focusedErrorBorder:
                  _buildOutlineInputBorder(color: AppColors.error),
            ),
          ),
        ),
      ],
    );
  }
}
