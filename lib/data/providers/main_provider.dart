import 'package:flutter/widgets.dart';
import 'package:grtts/data/models/time_summary.dart';
import 'package:grtts/data/repos/main_repo.dart';

class MainProvider extends ChangeNotifier {
  void onChange() => notifyListeners();
  final _mainRepo = MainRepo();

  //employee identification/onboarding
  bool get isIdentifyingUser => _mainRepo.isIdentifyingUser;
  void identifyUser(String employeeId) =>
      _mainRepo.identifyUser(employeeId, notifyStateChanged: notifyListeners);

  bool isClockedIn = false;
  bool isClockingInProgress = false;
  List<TimeSummary> timeReportSummaries = [
    TimeSummary(title: "This week", hours: 20),
    TimeSummary(title: "This Month", hours: 74.6),
  ];
}
