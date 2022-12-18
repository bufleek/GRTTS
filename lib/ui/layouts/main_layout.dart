import 'package:flutter/material.dart';
import 'package:grtts/data/auth_manager.dart';
import 'package:grtts/ui/theme/colors.dart';
import 'package:grtts/ui/theme/typography.dart';
import 'package:grtts/utils/routes.dart';
import 'package:grtts/utils/strings.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({
    super.key,
    required this.child,
    this.showTopView = true,
    this.appBar,
    this.enforceAuthRequired = true,
    this.redirectOnAuthenticated = false,
  });
  final Widget child;
  final bool showTopView;
  final AppBar? appBar;
  final bool enforceAuthRequired;
  final bool redirectOnAuthenticated;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  void initState() {
    AuthManager().addListener(onAuthChanged);
    super.initState();
  }

  @override
  void dispose() {
    AuthManager().removeListener(onAuthChanged);
    super.dispose();
  }

  void onAuthChanged() {
    print("onAuthChanged Called");
    if (widget.enforceAuthRequired && !AuthManager().isAuthenticated) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.employeeOnBoarding, (route) => false);
    } else if (widget.redirectOnAuthenticated &&
        AuthManager().isAuthenticated) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.showTopView)
                      Column(
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
                        ],
                      ),
                    Expanded(child: widget.child),
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
