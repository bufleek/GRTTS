class TimeLog {
  final int id;
  final String date;
  final String? timeIn;
  final String? timeOut;

  double get hoursIn => _getHoursIn();

  TimeLog({
    required this.id,
    required this.date,
    required this.timeIn,
    required this.timeOut,
  });

  factory TimeLog.fromJson(Map<String, dynamic> json) {
    return TimeLog(
      id: json["id"],
      date: json["date"],
      timeIn: json["time_in"],
      timeOut: json["time_out"],
    );
  }

  static List<TimeLog> parseFromTimeLogList(List<dynamic> json) {
    final List<TimeLog> timeLogs = [];
    for (var timeLogJson in json) {
      timeLogs.add(TimeLog.fromJson(timeLogJson));
    }
    return timeLogs;
  }

  double _getHoursIn() {
    final startTime = DateTime.parse(timeIn!);
    final endTime = timeOut == null ? DateTime.now() : DateTime.parse(timeOut!);
    final duration = endTime.difference(startTime);
    double hours = duration.inSeconds / 3600.0;
    return hours;
  }
}
