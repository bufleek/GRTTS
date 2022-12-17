import 'package:flutter/material.dart';
import 'package:grtts/data/providers/main_provider.dart';
import 'package:grtts/ui/layouts/main_layout.dart';
import 'package:grtts/ui/theme/typography.dart';
import 'package:grtts/ui/widgets/home/home_item.dart';
import 'package:grtts/utils/strings.dart';
import 'package:provider/provider.dart';

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
    //TODO
    if (_mainProvider.isClockedIn) {
      //CLOCK OUT
    } else {
      //CLOCK IN
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Consumer<MainProvider>(builder: (context, provider, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "${'greetings'.get()} Bruno",
                style: AppTypography.body(),
              ),
            ),
            Text(
              provider.isClockedIn
                  ? "You are clocked out"
                  : "You clocked in at ${"7:00 am"}",
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
                      onClicked: () {},
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
