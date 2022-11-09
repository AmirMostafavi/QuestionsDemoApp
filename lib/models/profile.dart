import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Profile {
  Profile(this.userId, this.displayName, this.profileImage, this.reputation);

  /// ----- Properties -----

  @HiveField(0)
  @JsonKey(name: 'user_id')
  int? userId;
  @HiveField(1)
  @JsonKey(name: 'display_name')
  String? displayName;
  @HiveField(2)
  @JsonKey(name: 'profile_image')
  String? profileImage;
  @HiveField(3)
  int reputation;

  /// ----- Functions -----

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
