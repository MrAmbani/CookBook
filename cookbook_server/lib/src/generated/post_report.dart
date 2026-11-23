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
import 'package:serverpod/serverpod.dart' as _is;

abstract class PostReport
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      reviewedBy: jsonSerialization['reviewedBy'] as String?,
      reviewedAt: jsonSerialization['reviewedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['reviewedAt']),
    );
  }

  static final t = PostReportTable();

  static const db = PostReportRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [PostReport]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static PostReportInclude include() {
    return PostReportInclude._();
  }

  static PostReportIncludeList includeList({
    _is.WhereExpressionBuilder<PostReportTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PostReportTable>? orderBy,
    _is.OrderByListBuilder<PostReportTable>? orderByList,
    PostReportInclude? include,
  }) {
    return PostReportIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostReport.t),
      orderByList: orderByList?.call(PostReport.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class PostReportUpdateTable extends _is.UpdateTable<PostReportTable> {
  PostReportUpdateTable(super.table);

  _is.ColumnValue<int, int> postId(int value) => _is.ColumnValue(
    table.postId,
    value,
  );

  _is.ColumnValue<String, String> postAuthorId(String value) => _is.ColumnValue(
    table.postAuthorId,
    value,
  );

  _is.ColumnValue<String, String> postAuthorName(String value) =>
      _is.ColumnValue(
        table.postAuthorName,
        value,
      );

  _is.ColumnValue<String, String> postCaption(String value) => _is.ColumnValue(
    table.postCaption,
    value,
  );

  _is.ColumnValue<String, String> reporterId(String value) => _is.ColumnValue(
    table.reporterId,
    value,
  );

  _is.ColumnValue<String, String> reason(String value) => _is.ColumnValue(
    table.reason,
    value,
  );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<String, String> reviewedBy(String? value) => _is.ColumnValue(
    table.reviewedBy,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> reviewedAt(DateTime? value) =>
      _is.ColumnValue(
        table.reviewedAt,
        value,
      );
}

class PostReportTable extends _is.Table<int?> {
  PostReportTable({super.tableRelation}) : super(tableName: 'post_report') {
    updateTable = PostReportUpdateTable(this);
    postId = _is.ColumnInt(
      'postId',
      this,
    );
    postAuthorId = _is.ColumnString(
      'postAuthorId',
      this,
    );
    postAuthorName = _is.ColumnString(
      'postAuthorName',
      this,
    );
    postCaption = _is.ColumnString(
      'postCaption',
      this,
    );
    reporterId = _is.ColumnString(
      'reporterId',
      this,
    );
    reason = _is.ColumnString(
      'reason',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
    reviewedBy = _is.ColumnString(
      'reviewedBy',
      this,
    );
    reviewedAt = _is.ColumnDateTime(
      'reviewedAt',
      this,
    );
  }

  late final PostReportUpdateTable updateTable;

  late final _is.ColumnInt postId;

  late final _is.ColumnString postAuthorId;

  late final _is.ColumnString postAuthorName;

  late final _is.ColumnString postCaption;

  late final _is.ColumnString reporterId;

  late final _is.ColumnString reason;

  late final _is.ColumnString status;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnString reviewedBy;

  late final _is.ColumnDateTime reviewedAt;

  @override
  List<_is.Column> get columns => [
    id,
    postId,
    postAuthorId,
    postAuthorName,
    postCaption,
    reporterId,
    reason,
    status,
    createdAt,
    reviewedBy,
    reviewedAt,
  ];
}

class PostReportInclude extends _is.IncludeObject {
  PostReportInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => PostReport.t;
}

class PostReportIncludeList extends _is.IncludeList {
  PostReportIncludeList._({
    _is.WhereExpressionBuilder<PostReportTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostReport.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => PostReport.t;
}

class PostReportRepository {
  const PostReportRepository._();

  /// Returns a list of [PostReport]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<PostReport>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PostReportTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PostReportTable>? orderBy,
    _is.OrderByListBuilder<PostReportTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<PostReport>(
      where: where?.call(PostReport.t),
      orderBy: orderBy?.call(PostReport.t),
      orderByList: orderByList?.call(PostReport.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [PostReport] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<PostReport?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PostReportTable>? where,
    int? offset,
    _is.OrderByBuilder<PostReportTable>? orderBy,
    _is.OrderByListBuilder<PostReportTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<PostReport>(
      where: where?.call(PostReport.t),
      orderBy: orderBy?.call(PostReport.t),
      orderByList: orderByList?.call(PostReport.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [PostReport] by its [id] or null if no such row exists.
  Future<PostReport?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<PostReport>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [PostReport]s in the list and returns the inserted rows.
  ///
  /// The returned [PostReport]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PostReport>> insert(
    _is.DatabaseSession session,
    List<PostReport> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<PostReport>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [PostReport] and returns the inserted row.
  ///
  /// The returned [PostReport] will have its `id` field set.
  Future<PostReport> insertRow(
    _is.DatabaseSession session,
    PostReport row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostReport>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [PostReport]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [PostReport]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PostReport>> upsert(
    _is.DatabaseSession session,
    List<PostReport> rows, {
    required _is.ColumnSelections<PostReportTable> conflictColumns,
    _is.ColumnSelections<PostReportTable>? updateColumns,
    _is.WhereExpressionBuilder<PostReportTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<PostReport>(
      rows,
      conflictColumns: conflictColumns(PostReport.t),
      updateColumns: updateColumns?.call(PostReport.t),
      updateWhere: updateWhere?.call(PostReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [PostReport] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [PostReport] will have its `id` field set.
  Future<PostReport?> upsertRow(
    _is.DatabaseSession session,
    PostReport row, {
    required _is.ColumnSelections<PostReportTable> conflictColumns,
    _is.ColumnSelections<PostReportTable>? updateColumns,
    _is.WhereExpressionBuilder<PostReportTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<PostReport>(
      row,
      conflictColumns: conflictColumns(PostReport.t),
      updateColumns: updateColumns?.call(PostReport.t),
      updateWhere: updateWhere?.call(PostReport.t),
      transaction: transaction,
    );
  }

  /// Updates all [PostReport]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PostReport>> update(
    _is.DatabaseSession session,
    List<PostReport> rows, {
    _is.ColumnSelections<PostReportTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<PostReport>(
      rows,
      columns: columns?.call(PostReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [PostReport]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PostReport> updateRow(
    _is.DatabaseSession session,
    PostReport row, {
    _is.ColumnSelections<PostReportTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostReport>(
      row,
      columns: columns?.call(PostReport.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostReport] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PostReport?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<PostReportUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<PostReport>(
      id,
      columnValues: columnValues(PostReport.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PostReport]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PostReport>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<PostReportUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<PostReportTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PostReportTable>? orderBy,
    _is.OrderByListBuilder<PostReportTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<PostReport>(
      columnValues: columnValues(PostReport.t.updateTable),
      where: where(PostReport.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostReport.t),
      orderByList: orderByList?.call(PostReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [PostReport]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PostReport>> delete(
    _is.DatabaseSession session,
    List<PostReport> rows, {
    _is.OrderByBuilder<PostReportTable>? orderBy,
    _is.OrderByListBuilder<PostReportTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<PostReport>(
      rows,
      orderBy: orderBy?.call(PostReport.t),
      orderByList: orderByList?.call(PostReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [PostReport].
  Future<PostReport> deleteRow(
    _is.DatabaseSession session,
    PostReport row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostReport>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PostReport>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<PostReportTable> where,
    _is.OrderByBuilder<PostReportTable>? orderBy,
    _is.OrderByListBuilder<PostReportTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<PostReport>(
      where: where(PostReport.t),
      orderBy: orderBy?.call(PostReport.t),
      orderByList: orderByList?.call(PostReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PostReportTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<PostReport>(
      where: where?.call(PostReport.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [PostReport] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<PostReportTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<PostReport>(
      where: where(PostReport.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
