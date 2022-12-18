class Office {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final double geoRadius;

  Office({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.geoRadius,
  });

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      id: json["id"],
      name: json["name"],
      latitude: double.parse(json["latitude"]),
      longitude: double.parse(json["longitude"]),
      geoRadius: double.parse(json["geo_radius"]),
    );
  }

  static List<Office> parseOfficesFromJson(List<dynamic> json) {
    final List<Office> offices = [];
    for (var officeJson in json) {
      offices.add(Office.fromJson(officeJson));
    }
    return offices;
  }
}
