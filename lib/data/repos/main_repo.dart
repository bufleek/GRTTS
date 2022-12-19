import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:grtts/data/auth_manager.dart';
import 'package:grtts/data/models/time_log.dart';
import 'package:grtts/data/repos/base_repo.dart';
import 'package:grtts/utils/functions.dart';
import 'package:location/location.dart' as loc;

class MainRepo extends BaseRepo {
  bool isIdentifyingUser = false;
  bool isClockingInProgress = false;
  bool isGettingTimeReports = false;
  List<TimeLog> timeLogs = [];

  Future<void> identifyUser(
    String employeeId, {
    required Function notifyStateChanged,
  }) async {
    if (isIdentifyingUser) return;
    isIdentifyingUser = true;
    notifyStateChanged();

    await AuthManager().identifyUser(employeeId);

    isIdentifyingUser = false;
    notifyStateChanged();
  }

  Future<void> clockIn({required Function notifyStateChanged}) async {
    if (isClockingInProgress) return;
    isClockingInProgress = true;
    notifyStateChanged();
    try {
      await _getCurrentLocation();
      final user = AuthManager().user;
      if (user != null) {
        final response =
            await post("check_in/", body: {"employee_id": user.employeeId});
        switch (response.statusCode) {
          case 200:
            final timeLog = TimeLog.fromJson(jsonDecode(response.body));
            user.markAsCheckedIn(timeLog);
            break;
          default:
            break;
        }
      }
    } catch (error) {
      printError("MainRepo - clockOut", error);
    }
    isClockingInProgress = false;
    notifyStateChanged();
  }

  Future<void> clockOut({required Function notifyStateChanged}) async {
    if (isClockingInProgress) return;
    isClockingInProgress = true;
    notifyStateChanged();

    try {
      await _getCurrentLocation();
      final user = AuthManager().user;
      if (user != null) {
        final response =
            await post("check_out/", body: {"employee_id": user.employeeId});
        switch (response.statusCode) {
          case 200:
            user.markAsCheckedOut();
            break;
          default:
            break;
        }
      }
    } catch (error) {
      printError("MainRepo - clockOut", error);
    }

    isClockingInProgress = false;
    notifyStateChanged();
  }

  void getTimeReports({required void Function() notifyStateChanged}) async {
    if (isGettingTimeReports) return;
    isGettingTimeReports = true;
    timeLogs.clear();
    notifyStateChanged();

    try {
      final response = await get(
          "time_reports/?employee_id=${AuthManager().user?.employeeId}");
      switch (response.statusCode) {
        case 200:
          timeLogs = TimeLog.parseFromTimeLogList(jsonDecode(response.body));
          break;
        default:
          break;
      }
    } catch (error) {
      printError("MainRepo - getTimeReports", error);
    }

    isGettingTimeReports = false;
    notifyStateChanged();
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      final location = loc.Location();
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        //Location services are not enabled
        showToast("Location services are not enabled");
        return Future.error('Location services are not enabled.');
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        showToast(
            "The app has been denied permission to access location services.");
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      showToast(
          "The app has been denied permission to access location services.");
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
