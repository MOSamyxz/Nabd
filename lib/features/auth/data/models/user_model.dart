import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.username,
    required super.fullName,
    super.bio,
    super.avatarUrl,
    super.birthDate,
    required super.joinedAt,
    super.socialLinks,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      username: map['user_name'],
      fullName: map['full_name'] , 
      bio: map['bio'],
      avatarUrl: map['avatar_url'],
      birthDate: map['birth_date'] != null ? DateTime.parse(map['birth_date']) : null,
      joinedAt: DateTime.parse(map['joined_at']),
      socialLinks: (map['social_links'] as Map?)?.cast<String, String>(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'user_name': username,
      'full_name': fullName,
      'bio': bio,
      'avatar_url': avatarUrl,
      'birth_date': birthDate?.toIso8601String(),
      'joined_at': joinedAt.toIso8601String(),
      'social_links': socialLinks,
    };
  }
}
