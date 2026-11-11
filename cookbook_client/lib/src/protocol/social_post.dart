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

abstract class SocialPost
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  SocialPost._({
    this.id,
    required this.userId,
    required this.authorName,
    this.recipeId,
    required this.caption,
    required this.createdAt,
  });

  factory SocialPost({
    int? id,
    required String userId,
    required String authorName,
    int? recipeId,
    required String caption,
    required DateTime createdAt,
  }) = _SocialPostImpl;

  factory SocialPost.fromJson(Map<String, dynamic> jsonSerialization) {
    return SocialPost(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      authorName: jsonSerialization['authorName'] as String,
      recipeId: jsonSerialization['recipeId'] as int?,
      caption: jsonSerialization['caption'] as String,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String userId;

  String authorName;

  int? recipeId;

  String caption;

  DateTime createdAt;

  /// Returns a shallow copy of this [SocialPost]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  SocialPost copyWith({
    int? id,
    String? userId,
    String? authorName,
    int? recipeId,
    String? caption,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SocialPost',
      if (id != null) 'id': id,
      'userId': userId,
      'authorName': authorName,
      if (recipeId != null) 'recipeId': recipeId,
      'caption': caption,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SocialPost',
      if (id != null) 'id': id,
      'userId': userId,
      'authorName': authorName,
      if (recipeId != null) 'recipeId': recipeId,
      'caption': caption,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SocialPostImpl extends SocialPost {
  _SocialPostImpl({
    int? id,
    required String userId,
    required String authorName,
    int? recipeId,
    required String caption,
    required DateTime createdAt,
  }) : super._(
         id: id,
         userId: userId,
         authorName: authorName,
         recipeId: recipeId,
         caption: caption,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [SocialPost]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  SocialPost copyWith({
    Object? id = _Undefined,
    String? userId,
    String? authorName,
    Object? recipeId = _Undefined,
    String? caption,
    DateTime? createdAt,
  }) {
    return SocialPost(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      authorName: authorName ?? this.authorName,
      recipeId: recipeId is int? ? recipeId : this.recipeId,
      caption: caption ?? this.caption,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
