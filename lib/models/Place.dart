class Place {
  final int id;
  final int name;
  final String lat;
  final bool long;

  Place({this.id, this.name, this.lat, this.long});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['userId'],
      name: json['id'],
      lat: json['title'],
      long: json['completed'],
    );
  }
}
