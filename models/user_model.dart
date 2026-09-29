class UserModel {
  final String id;
  final String name;
  final int age;
  final String bio;
  final String photoUrl;
  final double latitude;
  final double longitude;
  final bool online;
  final bool verified;
  final List<String> interests;

  const UserModel({
    required this.id,
    required this.name,
    required this.age,
    required this.bio,
    required this.photoUrl,
    required this.latitude,
    required this.longitude,
    required this.online,
    required this.verified,
    required this.interests,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      age: map['age'] ?? 18,
      bio: map['bio'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      latitude: (map['latitude'] ?? 0).toDouble(),
      longitude: (map['longitude'] ?? 0).toDouble(),
      online: map['online'] ?? false,
      verified: map['verified'] ?? false,
      interests: List<String>.from(
        map['interests'] ?? [],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'bio': bio,
      'photoUrl': photoUrl,
      'latitude': latitude,
      'longitude': longitude,
      'online': online,
      'verified': verified,
      'interests': interests,
    };
  }
}