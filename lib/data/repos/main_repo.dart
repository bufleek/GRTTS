import 'package:geolocator/geolocator.dart';
import 'package:grtts/data/auth_manager.dart';
import 'package:grtts/data/repos/base_repo.dart';
import 'package:grtts/utils/functions.dart';
import 'package:location/location.dart' as loc;

class MainRepo extends BaseRepo {
  bool isIdentifyingUser = false;

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

  Future<void> checkIn() async {}

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
