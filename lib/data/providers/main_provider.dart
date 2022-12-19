import 'package:flutter/widgets.dart';
import 'package:grtts/data/auth_manager.dart';
import 'package:grtts/data/models/time_log.dart';
import 'package:grtts/data/models/time_summary.dart';
import 'package:grtts/data/repos/main_repo.dart';

class MainProvider extends ChangeNotifier {
  void onChange() => notifyListeners();
  final _mainRepo = MainRepo();

  //employee identification/onboarding
  bool get isIdentifyingUser => _mainRepo.isIdentifyingUser;
  void identifyUser(String employeeId) =>
      _mainRepo.identifyUser(employeeId, notifyStateChanged: notifyListeners);

  bool get isClockedIn => AuthManager().user?.isClockedIn ?? false;
  bool get isClockingInProgress => _mainRepo.isClockingInProgress;
  bool get isGettingTimeReports => _mainRepo.isGettingTimeReports;
  List<TimeLog> get timeReports => _mainRepo.timeLogs;

  List<TimeSummary> get timeReportSummaries => [
        TimeSummary(title: "This week", hours: _sumAllHoursIn().toDouble()),
        TimeSummary(title: "This Month", hours: _sumAllHoursIn().toDouble()),
      ];

  double _sumAllHoursIn() {
    double hrs = 0;
    for (var report in timeReports) {
      hrs += report.hoursIn;
    }
    return hrs;
  }

  void clockOut() {
    _mainRepo.clockOut(notifyStateChanged: notifyListeners);
  }

  void clockIn() {
    _mainRepo.clockIn(notifyStateChanged: notifyListeners);
  }

  void getTimeReports() {
    _mainRepo.getTimeReports(notifyStateChanged: notifyListeners);
  }
}
