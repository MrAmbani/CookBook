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

abstract class PostReport
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  PostReport._({
    this.id,
    required this.postId,
    required this.postAuthorId,
    required this.postAuthorName,
    required this.postCaption,
    required this.reporterId,
    required this.reason,
    required this.status,
    required this.createdAt,
    this.reviewedBy,
    this.reviewedAt,
  });

  factory PostReport({
    int? id,
    required int postId,
    required String postAuthorId,
    required String postAuthorName,
    required String postCaption,
    required String reporterId,
    required String reason,
    required String status,
    required DateTime createdAt,
    String? reviewedBy,
    DateTime? reviewedAt,
  }) = _PostReportImpl;

  factory PostReport.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostReport(
      id: jsonSerialization['id'] as int?,
      postId: jsonSerialization['postId'] as int,
      postAuthorId: jsonSerialization['postAuthorId'] as String,
      postAuthorName: jsonSerialization['postAuthorName'] as String,
      postCaption: jsonSerialization['postCaption'] as String,
      reporterId: jsonSerialization['reporterId'] as String,
      reason: jsonSerialization['reason'] as String,
      status: jsonSerialization['status'] as String,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      reviewedBy: jsonSerialization['reviewedBy'] as String?,
      reviewedAt: jsonSerialization['reviewedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['reviewedAt'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int postId;

  String postAuthorId;

  String postAuthorName;

  String postCaption;

  String reporterId;

  String reason;

  String status;

  DateTime createdAt;

  String? reviewedBy;

  DateTime? reviewedAt;

  /// Returns a shallow copy of this [PostReport]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  PostReport copyWith({
    int? id,
    int? postId,
    String? postAuthorId,
    String? postAuthorName,
    String? postCaption,
    String? reporterId,
    String? reason,
    String? status,
    DateTime? createdAt,
    String? reviewedBy,
    DateTime? reviewedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PostReport',
      if (id != null) 'id': id,
      'postId': postId,
      'postAuthorId': postAuthorId,
      'postAuthorName': postAuthorName,
      'postCaption': postCaption,
      'reporterId': reporterId,
      'reason': reason,
      'status': status,
      'createdAt': createdAt.toJson(),
      if (reviewedBy != null) 'reviewedBy': reviewedBy,
      if (reviewedAt != null) 'reviewedAt': reviewedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PostReport',
      if (id != null) 'id': id,
      'postId': postId,
      'postAuthorId': postAuthorId,
      'postAuthorName': postAuthorName,
      'postCaption': postCaption,
      'reporterId': reporterId,
      'reason': reason,
      'status': status,
      'createdAt': createdAt.toJson(),
      if (reviewedBy != null) 'reviewedBy': reviewedBy,
      if (reviewedAt != null) 'reviewedAt': reviewedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostReportImpl extends PostReport {
  _PostReportImpl({
    int? id,
    required int postId,
    required String postAuthorId,
    required String postAuthorName,
    required String postCaption,
    required String reporterId,
    required String reason,
    required String status,
    required DateTime createdAt,
    String? reviewedBy,
    DateTime? reviewedAt,
  }) : super._(
         id: id,
         postId: postId,
         postAuthorId: postAuthorId,
         postAuthorName: postAuthorName,
         postCaption: postCaption,
         reporterId: reporterId,
         reason: reason,
         status: status,
         createdAt: createdAt,
         reviewedBy: reviewedBy,
         reviewedAt: reviewedAt,
       );

  /// Returns a shallow copy of this [PostReport]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  PostReport copyWith({
    Object? id = _Undefined,
    int? postId,
    String? postAuthorId,
    String? postAuthorName,
    String? postCaption,
    String? reporterId,
    String? reason,
    String? status,
    DateTime? createdAt,
    Object? reviewedBy = _Undefined,
    Object? reviewedAt = _Undefined,
  }) {
    return PostReport(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      postAuthorId: postAuthorId ?? this.postAuthorId,
      postAuthorName: postAuthorName ?? this.postAuthorName,
      postCaption: postCaption ?? this.postCaption,
      reporterId: reporterId ?? this.reporterId,
      reason: reason ?? this.reason,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      reviewedBy: reviewedBy is String? ? reviewedBy : this.reviewedBy,
      reviewedAt: reviewedAt is DateTime? ? reviewedAt : this.reviewedAt,
    );
  }
}
