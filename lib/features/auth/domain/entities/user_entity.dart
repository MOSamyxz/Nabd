class UserEntity {
  final String id;
  final String email;
  final String username;
  final String fullName;
  final String? bio;
  final String? avatarUrl;
  final DateTime? birthDate;
  final DateTime joinedAt;
  final Map<String, String>? socialLinks;

  const UserEntity({
    required this.id,
    required this.email,
    required this.username,
    required this.fullName ,
    this.bio,
    this.avatarUrl,
    this.birthDate,
    required this.joinedAt,
    this.socialLinks,
  });
}
