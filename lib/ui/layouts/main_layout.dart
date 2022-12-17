import 'package:flutter/material.dart';
import 'package:grtts/ui/theme/colors.dart';
import 'package:grtts/ui/theme/typography.dart';
import 'package:grtts/utils/strings.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "app_name".get(),
                        style: AppTypography.title(),
                      ),
                    ),
                    Text(
                      "fleek_tech".get(),
                      style: AppTypography.bodyBold(),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Divider(
                        color: AppColors.onSurface,
                        thickness: 1,
                      ),
                    ),
                    Expanded(child: child),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 4),
                child: Center(
                  child: Text(
                    "V 1.0.0",
                    style: AppTypography.bodyBold(
                        color: AppColors.onSurface.withAlpha(192)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
