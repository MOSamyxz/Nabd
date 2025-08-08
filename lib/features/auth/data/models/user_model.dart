import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class UserModel{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String email;
  @JsonKey(name: 'user_name')
  @HiveField(2)
  final String userName;
  @JsonKey(name: 'full_name')
  @HiveField(3)
  final String fullName;
  @JsonKey(name: 'avatar_url')
  @HiveField(4)
  final String? profileImageUrl;
  @HiveField(5)
  final String? bio;
  @JsonKey(name: 'is_verified')
  @HiveField(6)
  final bool isVerified;
  @JsonKey(name: 'is_private')
  @HiveField(7)
  final bool isPrivate;
  @JsonKey(name: 'created_at')
  @HiveField(8)
  final DateTime createdAt;
  @HiveField(9)
  final int points;
// Constructor
  UserModel({
    required this.id,
    required this.email,
    required this.userName,
    required this.fullName,
    this.profileImageUrl,
    this.bio,
    required this.isVerified,
    required this.isPrivate,
    required this.createdAt,
    required this.points,
  });
// Factory methods for JSON serialization
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
 // Method to convert the model to JSON
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
