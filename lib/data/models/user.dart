import 'package:grtts/data/models/office.dart';
import 'package:grtts/data/models/time_log.dart';

class User {
  final int id;
  final String employeeId;
  final String firstName;
  final String lastName;
  final TimeLog? activeTimeLog;
  final List<Office> offices;
  bool get isClockedIn => activeTimeLog != null;

  User({
    required this.id,
    required this.employeeId,
    required this.firstName,
    required this.lastName,
    required this.activeTimeLog,
    required this.offices,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      employeeId: json["employee_id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      activeTimeLog: json["active_time_log"] == null
          ? null
          : TimeLog.fromJson(json["active_time_log"]),
      offices: Office.parseOfficesFromJson(json["offices"]),
    );
  }
}
