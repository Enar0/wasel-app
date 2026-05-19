class UserModel {
  final String uid;
  final String phoneNumber;
  final String fullName;
  final String userType; // 'rider' or 'driver'
  final DateTime createdAt;
  final String language;

  UserModel({
    required this.uid,
    required this.phoneNumber,
    required this.fullName,
    required this.userType,
    required this.createdAt,
    required this.language,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'phoneNumber': phoneNumber,
      'fullName': fullName,
      'userType': userType,
      'createdAt': createdAt.toIso8601String(),
      'language': language,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      fullName: map['fullName'] ?? '',
      userType: map['userType'] ?? 'rider',
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
      language: map['language'] ?? 'ar',
    );
  }
}
