import 'package:flutter/material.dart';
import 'package:grtts/data/providers/main_provider.dart';
import 'package:grtts/ui/screens/employee_onboarding.dart';
import 'package:grtts/ui/theme/theme.dart';
import 'package:grtts/utils/routes.dart';
import 'package:grtts/utils/strings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider()),
      ],
      child: MaterialApp(
        title: "app_name".get(),
        theme: theme,
        initialRoute: AppRoutes.employee_onboarding,
        routes: {
          AppRoutes.employee_onboarding: (context) =>
              const EmployeeOnboardingScreen(),
        },
      ),
    );
  }
}
