import 'package:flutter/widgets.dart';

class MainProvider extends ChangeNotifier {
  void onChange() => notifyListeners();

  bool isClockedIn = false;
  bool isClockingInProgress = false;
}
