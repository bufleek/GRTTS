import 'package:grtts/data/auth_manager.dart';
import 'package:grtts/data/repos/base_repo.dart';

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
    print("user has been identified");
    isIdentifyingUser = false;
    notifyStateChanged();
  }
}
