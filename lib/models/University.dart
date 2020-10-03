class University {
  int id;
  final String name;
  final String description;
  final String country;
  final String city;
  final String faculties;
  final String contactInfo;
  final double rate;
  final String state;
  final String certifications;
  final String extraInfo;
  final String imgUrl;

  University(
      {this.id,
      this.name,
      this.description,
      this.country,
      this.city,
      this.faculties,
      this.contactInfo,
      this.rate,
      this.state,
      this.certifications,
      this.extraInfo,
      this.imgUrl});

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      // geometry: Geometry.fromJson(json['geometry']),
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      country: json['country'] ?? '',
      city: json['city'] ?? '',
      faculties: json['faculties'] ?? '',
      contactInfo: json['contactInfo'] ?? '',
      rate: json['rate'] != null ? json['rate'].toDouble() : 0.0,
      state: json['state'] ?? '',
      certifications: json['certifications'] ?? '',
      extraInfo: json['extraInfo'] ?? '',
      imgUrl: json['imageUrl'] ?? '',
    );
  }
}
