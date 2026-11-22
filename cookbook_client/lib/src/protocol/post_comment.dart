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

abstract class PostComment
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  PostComment._({
    this.id,
    required this.postId,
    required this.userId,
    required this.authorName,
    required this.text,
    required this.createdAt,
  });

  factory PostComment({
    int? id,
    required int postId,
    required String userId,
    required String authorName,
    required String text,
    required DateTime createdAt,
  }) = _PostCommentImpl;

  factory PostComment.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostComment(
      id: jsonSerialization['id'] as int?,
      postId: jsonSerialization['postId'] as int,
      userId: jsonSerialization['userId'] as String,
      authorName: jsonSerialization['authorName'] as String,
      text: jsonSerialization['text'] as String,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int postId;

  String userId;

  String authorName;

  String text;

  DateTime createdAt;

  /// Returns a shallow copy of this [PostComment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  PostComment copyWith({
    int? id,
    int? postId,
    String? userId,
    String? authorName,
    String? text,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PostComment',
      if (id != null) 'id': id,
      'postId': postId,
      'userId': userId,
      'authorName': authorName,
      'text': text,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PostComment',
      if (id != null) 'id': id,
      'postId': postId,
      'userId': userId,
      'authorName': authorName,
      'text': text,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostCommentImpl extends PostComment {
  _PostCommentImpl({
    int? id,
    required int postId,
    required String userId,
    required String authorName,
    required String text,
    required DateTime createdAt,
  }) : super._(
         id: id,
         postId: postId,
         userId: userId,
         authorName: authorName,
         text: text,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [PostComment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  PostComment copyWith({
    Object? id = _Undefined,
    int? postId,
    String? userId,
    String? authorName,
    String? text,
    DateTime? createdAt,
  }) {
    return PostComment(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      authorName: authorName ?? this.authorName,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
