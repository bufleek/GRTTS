class User {
  final int id;
  final String employeeId;
  final String firstName;
  final String lastName;
  final bool isClockedIn;

  User({
    required this.id,
    required this.employeeId,
    required this.firstName,
    required this.lastName,
    required this.isClockedIn,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      employeeId: json["employee_id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      isClockedIn: json["is_clocked_in"],
    );
  }
}
