import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/typography.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.onClicked,
    required this.text,
    this.loading = false,
    this.enabled = true,
  });

  final VoidCallback onClicked;
  final String text;
  final bool loading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: onClicked,
          child: Card(
            color: AppColors.white.withAlpha((enabled && !loading) ? 128 : 64),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyBold(
                      color: (enabled && !loading)
                          ? AppColors.black
                          : AppColors.black.withAlpha(128)),
                ),
              ),
            ),
          ),
        ),
        if (loading) const CircularProgressIndicator()
      ],
    );
  }
}
