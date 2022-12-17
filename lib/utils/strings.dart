extension GetStringValue on String {
  String get() {
    return _strings[this] ?? this;
  }
}

final _strings = {
  "app_name": "GRTTS",
  "fleek_tech": "Fleek Technologies Ltd",
  "employee_id": "Employee Id",
  "employee_id_hint": "Enter your employee id",
  "continue": "Continue",
  "greetings": "Hello",
};
