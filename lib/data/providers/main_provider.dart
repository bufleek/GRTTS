import 'package:flutter/widgets.dart';
import 'package:grtts/data/models/time_summary.dart';

class MainProvider extends ChangeNotifier {
  void onChange() => notifyListeners();

  bool isClockedIn = false;
  bool isClockingInProgress = false;
  List<TimeSummary> timeReportSummaries = [
    TimeSummary(title: "This week", hours: 20),
    TimeSummary(title: "This Month", hours: 74.6),
  ];
}
