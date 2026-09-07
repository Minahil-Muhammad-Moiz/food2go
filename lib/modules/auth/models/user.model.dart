/// User Model - Represents an application user
///
/// WHY: We need a structured way to handle user data
/// This model ensures consistency across the app
class User {
  // Properties - Characteristics of a user
  final String id;
  final String name;
  final String email;
  final String username;
  final int? age; // ? = nullable (can be null)
  final String? country;
  final String? profileImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  // Constructor - How to create a User
  // Required parameters must be provided
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    this.age,
    this.country,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
  });

  // 1. FROM JSON - Convert API response to User
  // Why: API sends JSON, we need User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      age: json['age'] as int?,
      country: json['country'] as String?,
      profileImage: json['profileImage'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'].toString())
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'].toString())
          : null,
    );
  }

  // 2. TO JSON - Convert User to Map for API
  // Why: When sending user data to API
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'age': age,
      'country': country,
      'profileImage': profileImage,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  // 3. COPY WITH - Update user with new values
  // Why: User objects are immutable (can't change)
  // We create a new copy with updated fields
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? username,
    int? age,
    String? country,
    String? profileImage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      username: username ?? this.username,
      age: age ?? this.age,
      country: country ?? this.country,
      profileImage: profileImage ?? this.profileImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // 4. Empty User - For initial state
  static User empty() => const User(
        id: '',
        name: '',
        email: '',
        username: '',
      );
}