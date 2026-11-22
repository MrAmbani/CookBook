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

abstract class UserFollow
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  UserFollow._({
    this.id,
    required this.followerId,
    required this.followingId,
    required this.createdAt,
  });

  factory UserFollow({
    int? id,
    required String followerId,
    required String followingId,
    required DateTime createdAt,
  }) = _UserFollowImpl;

  factory UserFollow.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserFollow(
      id: jsonSerialization['id'] as int?,
      followerId: jsonSerialization['followerId'] as String,
      followingId: jsonSerialization['followingId'] as String,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = UserFollowTable();

  static const db = UserFollowRepository._();

  @override
  int? id;

  String followerId;

  String followingId;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserFollow]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  UserFollow copyWith({
    int? id,
    String? followerId,
    String? followingId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserFollow',
      if (id != null) 'id': id,
      'followerId': followerId,
      'followingId': followingId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserFollow',
      if (id != null) 'id': id,
      'followerId': followerId,
      'followingId': followingId,
      'createdAt': createdAt.toJson(),
    };
  }

  static UserFollowInclude include() {
    return UserFollowInclude._();
  }

  static UserFollowIncludeList includeList({
    _is.WhereExpressionBuilder<UserFollowTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<UserFollowTable>? orderBy,
    _is.OrderByListBuilder<UserFollowTable>? orderByList,
    UserFollowInclude? include,
  }) {
    return UserFollowIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserFollow.t),
      orderByList: orderByList?.call(UserFollow.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserFollowImpl extends UserFollow {
  _UserFollowImpl({
    int? id,
    required String followerId,
    required String followingId,
    required DateTime createdAt,
  }) : super._(
         id: id,
         followerId: followerId,
         followingId: followingId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [UserFollow]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  UserFollow copyWith({
    Object? id = _Undefined,
    String? followerId,
    String? followingId,
    DateTime? createdAt,
  }) {
    return UserFollow(
      id: id is int? ? id : this.id,
      followerId: followerId ?? this.followerId,
      followingId: followingId ?? this.followingId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class UserFollowUpdateTable extends _is.UpdateTable<UserFollowTable> {
  UserFollowUpdateTable(super.table);

  _is.ColumnValue<String, String> followerId(String value) => _is.ColumnValue(
    table.followerId,
    value,
  );

  _is.ColumnValue<String, String> followingId(String value) => _is.ColumnValue(
    table.followingId,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class UserFollowTable extends _is.Table<int?> {
  UserFollowTable({super.tableRelation}) : super(tableName: 'user_follow') {
    updateTable = UserFollowUpdateTable(this);
    followerId = _is.ColumnString(
      'followerId',
      this,
    );
    followingId = _is.ColumnString(
      'followingId',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final UserFollowUpdateTable updateTable;

  late final _is.ColumnString followerId;

  late final _is.ColumnString followingId;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    followerId,
    followingId,
    createdAt,
  ];
}

class UserFollowInclude extends _is.IncludeObject {
  UserFollowInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => UserFollow.t;
}

class UserFollowIncludeList extends _is.IncludeList {
  UserFollowIncludeList._({
    _is.WhereExpressionBuilder<UserFollowTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserFollow.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => UserFollow.t;
}

class UserFollowRepository {
  const UserFollowRepository._();

  /// Returns a list of [UserFollow]s matching the given query parameters.
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
  Future<List<UserFollow>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<UserFollowTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<UserFollowTable>? orderBy,
    _is.OrderByListBuilder<UserFollowTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<UserFollow>(
      where: where?.call(UserFollow.t),
      orderBy: orderBy?.call(UserFollow.t),
      orderByList: orderByList?.call(UserFollow.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [UserFollow] matching the given query parameters.
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
  Future<UserFollow?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<UserFollowTable>? where,
    int? offset,
    _is.OrderByBuilder<UserFollowTable>? orderBy,
    _is.OrderByListBuilder<UserFollowTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<UserFollow>(
      where: where?.call(UserFollow.t),
      orderBy: orderBy?.call(UserFollow.t),
      orderByList: orderByList?.call(UserFollow.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [UserFollow] by its [id] or null if no such row exists.
  Future<UserFollow?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<UserFollow>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [UserFollow]s in the list and returns the inserted rows.
  ///
  /// The returned [UserFollow]s will have their `id` fields set.
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
  Future<List<UserFollow>> insert(
    _is.DatabaseSession session,
    List<UserFollow> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<UserFollow>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [UserFollow] and returns the inserted row.
  ///
  /// The returned [UserFollow] will have its `id` field set.
  Future<UserFollow> insertRow(
    _is.DatabaseSession session,
    UserFollow row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserFollow>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [UserFollow]s in the list and returns the resulting rows.
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
  /// The returned [UserFollow]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserFollow>> upsert(
    _is.DatabaseSession session,
    List<UserFollow> rows, {
    required _is.ColumnSelections<UserFollowTable> conflictColumns,
    _is.ColumnSelections<UserFollowTable>? updateColumns,
    _is.WhereExpressionBuilder<UserFollowTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<UserFollow>(
      rows,
      conflictColumns: conflictColumns(UserFollow.t),
      updateColumns: updateColumns?.call(UserFollow.t),
      updateWhere: updateWhere?.call(UserFollow.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [UserFollow] and returns the resulting row.
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
  /// The returned [UserFollow] will have its `id` field set.
  Future<UserFollow?> upsertRow(
    _is.DatabaseSession session,
    UserFollow row, {
    required _is.ColumnSelections<UserFollowTable> conflictColumns,
    _is.ColumnSelections<UserFollowTable>? updateColumns,
    _is.WhereExpressionBuilder<UserFollowTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<UserFollow>(
      row,
      conflictColumns: conflictColumns(UserFollow.t),
      updateColumns: updateColumns?.call(UserFollow.t),
      updateWhere: updateWhere?.call(UserFollow.t),
      transaction: transaction,
    );
  }

  /// Updates all [UserFollow]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserFollow>> update(
    _is.DatabaseSession session,
    List<UserFollow> rows, {
    _is.ColumnSelections<UserFollowTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<UserFollow>(
      rows,
      columns: columns?.call(UserFollow.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [UserFollow]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserFollow> updateRow(
    _is.DatabaseSession session,
    UserFollow row, {
    _is.ColumnSelections<UserFollowTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserFollow>(
      row,
      columns: columns?.call(UserFollow.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserFollow] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserFollow?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<UserFollowUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<UserFollow>(
      id,
      columnValues: columnValues(UserFollow.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserFollow]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserFollow>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<UserFollowUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<UserFollowTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<UserFollowTable>? orderBy,
    _is.OrderByListBuilder<UserFollowTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<UserFollow>(
      columnValues: columnValues(UserFollow.t.updateTable),
      where: where(UserFollow.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserFollow.t),
      orderByList: orderByList?.call(UserFollow.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [UserFollow]s in the list and returns the deleted rows.
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
  Future<List<UserFollow>> delete(
    _is.DatabaseSession session,
    List<UserFollow> rows, {
    _is.OrderByBuilder<UserFollowTable>? orderBy,
    _is.OrderByListBuilder<UserFollowTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<UserFollow>(
      rows,
      orderBy: orderBy?.call(UserFollow.t),
      orderByList: orderByList?.call(UserFollow.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [UserFollow].
  Future<UserFollow> deleteRow(
    _is.DatabaseSession session,
    UserFollow row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserFollow>(
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
  Future<List<UserFollow>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<UserFollowTable> where,
    _is.OrderByBuilder<UserFollowTable>? orderBy,
    _is.OrderByListBuilder<UserFollowTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<UserFollow>(
      where: where(UserFollow.t),
      orderBy: orderBy?.call(UserFollow.t),
      orderByList: orderByList?.call(UserFollow.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<UserFollowTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<UserFollow>(
      where: where?.call(UserFollow.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [UserFollow] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<UserFollowTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<UserFollow>(
      where: where(UserFollow.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
