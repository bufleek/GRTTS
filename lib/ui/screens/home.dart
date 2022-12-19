import 'package:flutter/material.dart';
import 'package:grtts/data/providers/main_provider.dart';
import 'package:grtts/ui/layouts/main_layout.dart';
import 'package:grtts/ui/theme/typography.dart';
import 'package:grtts/ui/widgets/home/home_item.dart';
import 'package:grtts/utils/routes.dart';
import 'package:grtts/utils/strings.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/auth_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainProvider get _mainProvider => context.read<MainProvider>();
  void _handleClockStateToggle() {
    if (_mainProvider.isClockingInProgress) {
      return;
    }
    if (_mainProvider.isClockedIn) {
      _mainProvider.clockOut();
    } else {
      _mainProvider.clockIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Consumer<MainProvider>(builder: (context, provider, __) {
        final user = AuthManager().user;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "${'greetings'.get()} ${(user?.firstName == null || (user?.firstName.isEmpty ?? false)) ? "User (${user?.employeeId ?? ""})" : user?.firstName}",
                style: AppTypography.body(),
              ),
            ),
            Text(
              provider.isClockedIn
                  ? "You clocked in at ${DateFormat("hh:mm:ss a").format(DateTime.parse(user!.activeTimeLog!.timeIn!).add(const Duration(hours: 3)))}"
                  : "You are clocked out",
              style: AppTypography.bodyBold(),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [
                    HomeItem(
                      onClicked: _handleClockStateToggle,
                      text: provider.isClockedIn ? "Clock Out" : "Clock In",
                      loading: provider.isClockingInProgress,
                      enabled: !provider.isClockingInProgress,
                    ),
                    HomeItem(
                      onClicked: () {
                        Navigator.of(context).pushNamed(AppRoutes.timeReports);
                      },
                      text: "View Time Reports",
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
