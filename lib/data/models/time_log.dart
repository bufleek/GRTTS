class TimeLog {
  final int id;
  final String date;
  final String? timeIn;
  final String? timeOut;

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
}
