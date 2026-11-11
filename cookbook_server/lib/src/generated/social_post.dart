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

abstract class SocialPost
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = SocialPostTable();

  static const db = SocialPostRepository._();

  @override
  int? id;

  String userId;

  String authorName;

  int? recipeId;

  String caption;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [SocialPost]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static SocialPostInclude include() {
    return SocialPostInclude._();
  }

  static SocialPostIncludeList includeList({
    _is.WhereExpressionBuilder<SocialPostTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SocialPostTable>? orderBy,
    _is.OrderByListBuilder<SocialPostTable>? orderByList,
    SocialPostInclude? include,
  }) {
    return SocialPostIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SocialPost.t),
      orderByList: orderByList?.call(SocialPost.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class SocialPostUpdateTable extends _is.UpdateTable<SocialPostTable> {
  SocialPostUpdateTable(super.table);

  _is.ColumnValue<String, String> userId(String value) => _is.ColumnValue(
    table.userId,
    value,
  );

  _is.ColumnValue<String, String> authorName(String value) => _is.ColumnValue(
    table.authorName,
    value,
  );

  _is.ColumnValue<int, int> recipeId(int? value) => _is.ColumnValue(
    table.recipeId,
    value,
  );

  _is.ColumnValue<String, String> caption(String value) => _is.ColumnValue(
    table.caption,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class SocialPostTable extends _is.Table<int?> {
  SocialPostTable({super.tableRelation}) : super(tableName: 'social_post') {
    updateTable = SocialPostUpdateTable(this);
    userId = _is.ColumnString(
      'userId',
      this,
    );
    authorName = _is.ColumnString(
      'authorName',
      this,
    );
    recipeId = _is.ColumnInt(
      'recipeId',
      this,
    );
    caption = _is.ColumnString(
      'caption',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final SocialPostUpdateTable updateTable;

  late final _is.ColumnString userId;

  late final _is.ColumnString authorName;

  late final _is.ColumnInt recipeId;

  late final _is.ColumnString caption;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    authorName,
    recipeId,
    caption,
    createdAt,
  ];
}

class SocialPostInclude extends _is.IncludeObject {
  SocialPostInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => SocialPost.t;
}

class SocialPostIncludeList extends _is.IncludeList {
  SocialPostIncludeList._({
    _is.WhereExpressionBuilder<SocialPostTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SocialPost.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => SocialPost.t;
}

class SocialPostRepository {
  const SocialPostRepository._();

  /// Returns a list of [SocialPost]s matching the given query parameters.
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
  Future<List<SocialPost>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SocialPostTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SocialPostTable>? orderBy,
    _is.OrderByListBuilder<SocialPostTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SocialPost>(
      where: where?.call(SocialPost.t),
      orderBy: orderBy?.call(SocialPost.t),
      orderByList: orderByList?.call(SocialPost.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SocialPost] matching the given query parameters.
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
  Future<SocialPost?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SocialPostTable>? where,
    int? offset,
    _is.OrderByBuilder<SocialPostTable>? orderBy,
    _is.OrderByListBuilder<SocialPostTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SocialPost>(
      where: where?.call(SocialPost.t),
      orderBy: orderBy?.call(SocialPost.t),
      orderByList: orderByList?.call(SocialPost.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SocialPost] by its [id] or null if no such row exists.
  Future<SocialPost?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SocialPost>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SocialPost]s in the list and returns the inserted rows.
  ///
  /// The returned [SocialPost]s will have their `id` fields set.
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
  Future<List<SocialPost>> insert(
    _is.DatabaseSession session,
    List<SocialPost> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<SocialPost>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [SocialPost] and returns the inserted row.
  ///
  /// The returned [SocialPost] will have its `id` field set.
  Future<SocialPost> insertRow(
    _is.DatabaseSession session,
    SocialPost row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<SocialPost>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [SocialPost]s in the list and returns the resulting rows.
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
  /// The returned [SocialPost]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SocialPost>> upsert(
    _is.DatabaseSession session,
    List<SocialPost> rows, {
    required _is.ColumnSelections<SocialPostTable> conflictColumns,
    _is.ColumnSelections<SocialPostTable>? updateColumns,
    _is.WhereExpressionBuilder<SocialPostTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<SocialPost>(
      rows,
      conflictColumns: conflictColumns(SocialPost.t),
      updateColumns: updateColumns?.call(SocialPost.t),
      updateWhere: updateWhere?.call(SocialPost.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [SocialPost] and returns the resulting row.
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
  /// The returned [SocialPost] will have its `id` field set.
  Future<SocialPost?> upsertRow(
    _is.DatabaseSession session,
    SocialPost row, {
    required _is.ColumnSelections<SocialPostTable> conflictColumns,
    _is.ColumnSelections<SocialPostTable>? updateColumns,
    _is.WhereExpressionBuilder<SocialPostTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<SocialPost>(
      row,
      conflictColumns: conflictColumns(SocialPost.t),
      updateColumns: updateColumns?.call(SocialPost.t),
      updateWhere: updateWhere?.call(SocialPost.t),
      transaction: transaction,
    );
  }

  /// Updates all [SocialPost]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SocialPost>> update(
    _is.DatabaseSession session,
    List<SocialPost> rows, {
    _is.ColumnSelections<SocialPostTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<SocialPost>(
      rows,
      columns: columns?.call(SocialPost.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [SocialPost]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SocialPost> updateRow(
    _is.DatabaseSession session,
    SocialPost row, {
    _is.ColumnSelections<SocialPostTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<SocialPost>(
      row,
      columns: columns?.call(SocialPost.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SocialPost] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SocialPost?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<SocialPostUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<SocialPost>(
      id,
      columnValues: columnValues(SocialPost.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SocialPost]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SocialPost>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<SocialPostUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<SocialPostTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SocialPostTable>? orderBy,
    _is.OrderByListBuilder<SocialPostTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<SocialPost>(
      columnValues: columnValues(SocialPost.t.updateTable),
      where: where(SocialPost.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SocialPost.t),
      orderByList: orderByList?.call(SocialPost.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [SocialPost]s in the list and returns the deleted rows.
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
  Future<List<SocialPost>> delete(
    _is.DatabaseSession session,
    List<SocialPost> rows, {
    _is.OrderByBuilder<SocialPostTable>? orderBy,
    _is.OrderByListBuilder<SocialPostTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<SocialPost>(
      rows,
      orderBy: orderBy?.call(SocialPost.t),
      orderByList: orderByList?.call(SocialPost.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [SocialPost].
  Future<SocialPost> deleteRow(
    _is.DatabaseSession session,
    SocialPost row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SocialPost>(
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
  Future<List<SocialPost>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SocialPostTable> where,
    _is.OrderByBuilder<SocialPostTable>? orderBy,
    _is.OrderByListBuilder<SocialPostTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<SocialPost>(
      where: where(SocialPost.t),
      orderBy: orderBy?.call(SocialPost.t),
      orderByList: orderByList?.call(SocialPost.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SocialPostTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<SocialPost>(
      where: where?.call(SocialPost.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SocialPost] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SocialPostTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SocialPost>(
      where: where(SocialPost.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
