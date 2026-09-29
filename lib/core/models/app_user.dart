class AppUser {
  final String id;
  final String? email;
  final String? name;
  final int? age;
  final String? bio;
  final String? lookingFor;
  final String? mode;
  final bool verified;
  final List<String> photos;

  const AppUser({
    required this.id,
    this.email,
    this.name,
    this.age,
    this.bio,
    this.lookingFor,
    this.mode,
    this.verified = false,
    this.photos = const [],
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      age: json['age'] as int?,
      bio: json['bio'] as String?,
      lookingFor: json['looking_for'] as String?,
      mode: json['mode'] as String?,
      verified: json['verified'] as bool? ?? false,
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'age': age,
      'bio': bio,
      'looking_for': lookingFor,
      'mode': mode,
      'verified': verified,
      'photos': photos,
    };
  }
}