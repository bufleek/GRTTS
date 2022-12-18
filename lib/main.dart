import 'package:flutter/material.dart';
import 'package:grtts/data/auth_manager.dart';
import 'package:grtts/data/providers/main_provider.dart';
import 'package:grtts/ui/screens/employee_onboarding.dart';
import 'package:grtts/ui/screens/home.dart';
import 'package:grtts/ui/screens/time_reports.dart';
import 'package:grtts/ui/theme/theme.dart';
import 'package:grtts/utils/routes.dart';
import 'package:grtts/utils/strings.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthManager().initialize();
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
        initialRoute: AuthManager().isAuthenticated
            ? AppRoutes.home
            : AppRoutes.employeeOnBoarding,
        routes: {
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.employeeOnBoarding: (context) =>
              const EmployeeOnboardingScreen(),
          AppRoutes.timeReports: (context) => const TimeReportsScreen(),
        },
      ),
    );
  }
}
