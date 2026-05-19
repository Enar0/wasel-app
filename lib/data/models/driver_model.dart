class DriverModel {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String photoUrl;
  final double rating;
  final String carModel;
  final String plateNumber;
  final double currentLat;
  final double currentLng;

  DriverModel({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.photoUrl,
    required this.rating,
    required this.carModel,
    required this.plateNumber,
    required this.currentLat,
    required this.currentLng,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'rating': rating,
      'carModel': carModel,
      'plateNumber': plateNumber,
      'currentLat': currentLat,
      'currentLng': currentLng,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    return DriverModel(
      id: map['id'] ?? '',
      fullName: map['fullName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      rating: (map['rating'] ?? 0.0).toDouble(),
      carModel: map['carModel'] ?? '',
      plateNumber: map['plateNumber'] ?? '',
      currentLat: (map['currentLat'] ?? 0.0).toDouble(),
      currentLng: (map['currentLng'] ?? 0.0).toDouble(),
    );
  }
}
