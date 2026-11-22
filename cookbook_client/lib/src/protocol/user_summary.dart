/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class UserSummary
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  UserSummary._({
    required this.userId,
    required this.name,
    this.bio,
    required this.role,
    required this.followerCount,
    required this.followingCount,
    required this.followedByMe,
    required this.isMe,
  });

  factory UserSummary({
    required String userId,
    required String name,
    String? bio,
    required String role,
    required int followerCount,
    required int followingCount,
    required bool followedByMe,
    required bool isMe,
  }) = _UserSummaryImpl;

  factory UserSummary.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserSummary(
      userId: jsonSerialization['userId'] as String,
      name: jsonSerialization['name'] as String,
      bio: jsonSerialization['bio'] as String?,
      role: jsonSerialization['role'] as String,
      followerCount: jsonSerialization['followerCount'] as int,
      followingCount: jsonSerialization['followingCount'] as int,
      followedByMe: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['followedByMe'],
      ),
      isMe: _isc.BoolJsonExtension.fromJson(jsonSerialization['isMe']),
    );
  }

  String userId;

  String name;

  String? bio;

  String role;

  int followerCount;

  int followingCount;

  bool followedByMe;

  bool isMe;

  /// Returns a shallow copy of this [UserSummary]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  UserSummary copyWith({
    String? userId,
    String? name,
    String? bio,
    String? role,
    int? followerCount,
    int? followingCount,
    bool? followedByMe,
    bool? isMe,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserSummary',
      'userId': userId,
      'name': name,
      if (bio != null) 'bio': bio,
      'role': role,
      'followerCount': followerCount,
      'followingCount': followingCount,
      'followedByMe': followedByMe,
      'isMe': isMe,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserSummary',
      'userId': userId,
      'name': name,
      if (bio != null) 'bio': bio,
      'role': role,
      'followerCount': followerCount,
      'followingCount': followingCount,
      'followedByMe': followedByMe,
      'isMe': isMe,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserSummaryImpl extends UserSummary {
  _UserSummaryImpl({
    required String userId,
    required String name,
    String? bio,
    required String role,
    required int followerCount,
    required int followingCount,
    required bool followedByMe,
    required bool isMe,
  }) : super._(
         userId: userId,
         name: name,
         bio: bio,
         role: role,
         followerCount: followerCount,
         followingCount: followingCount,
         followedByMe: followedByMe,
         isMe: isMe,
       );

  /// Returns a shallow copy of this [UserSummary]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  UserSummary copyWith({
    String? userId,
    String? name,
    Object? bio = _Undefined,
    String? role,
    int? followerCount,
    int? followingCount,
    bool? followedByMe,
    bool? isMe,
  }) {
    return UserSummary(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      bio: bio is String? ? bio : this.bio,
      role: role ?? this.role,
      followerCount: followerCount ?? this.followerCount,
      followingCount: followingCount ?? this.followingCount,
      followedByMe: followedByMe ?? this.followedByMe,
      isMe: isMe ?? this.isMe,
    );
  }
}
