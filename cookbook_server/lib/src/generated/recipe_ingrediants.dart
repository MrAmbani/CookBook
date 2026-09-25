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

abstract class RecipeIngredient
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  RecipeIngredient._({
    this.id,
    required this.recipeId,
    required this.ingredientId,
    required this.quantity,
    this.unit,
    required this.isOptional,
  });

  factory RecipeIngredient({
    int? id,
    required int recipeId,
    required int ingredientId,
    required String quantity,
    String? unit,
    required bool isOptional,
  }) = _RecipeIngredientImpl;

  factory RecipeIngredient.fromJson(Map<String, dynamic> jsonSerialization) {
    return RecipeIngredient(
      id: jsonSerialization['id'] as int?,
      recipeId: jsonSerialization['recipeId'] as int,
      ingredientId: jsonSerialization['ingredientId'] as int,
      quantity: jsonSerialization['quantity'] as String,
      unit: jsonSerialization['unit'] as String?,
      isOptional: _is.BoolJsonExtension.fromJson(
        jsonSerialization['isOptional'],
      ),
    );
  }

  static final t = RecipeIngredientTable();

  static const db = RecipeIngredientRepository._();

  @override
  int? id;

  int recipeId;

  int ingredientId;

  String quantity;

  String? unit;

  bool isOptional;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [RecipeIngredient]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RecipeIngredient copyWith({
    int? id,
    int? recipeId,
    int? ingredientId,
    String? quantity,
    String? unit,
    bool? isOptional,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RecipeIngredient',
      if (id != null) 'id': id,
      'recipeId': recipeId,
      'ingredientId': ingredientId,
      'quantity': quantity,
      if (unit != null) 'unit': unit,
      'isOptional': isOptional,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RecipeIngredient',
      if (id != null) 'id': id,
      'recipeId': recipeId,
      'ingredientId': ingredientId,
      'quantity': quantity,
      if (unit != null) 'unit': unit,
      'isOptional': isOptional,
    };
  }

  static RecipeIngredientInclude include() {
    return RecipeIngredientInclude._();
  }

  static RecipeIngredientIncludeList includeList({
    _is.WhereExpressionBuilder<RecipeIngredientTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RecipeIngredientTable>? orderBy,
    _is.OrderByListBuilder<RecipeIngredientTable>? orderByList,
    RecipeIngredientInclude? include,
  }) {
    return RecipeIngredientIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RecipeIngredient.t),
      orderByList: orderByList?.call(RecipeIngredient.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RecipeIngredientImpl extends RecipeIngredient {
  _RecipeIngredientImpl({
    int? id,
    required int recipeId,
    required int ingredientId,
    required String quantity,
    String? unit,
    required bool isOptional,
  }) : super._(
         id: id,
         recipeId: recipeId,
         ingredientId: ingredientId,
         quantity: quantity,
         unit: unit,
         isOptional: isOptional,
       );

  /// Returns a shallow copy of this [RecipeIngredient]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RecipeIngredient copyWith({
    Object? id = _Undefined,
    int? recipeId,
    int? ingredientId,
    String? quantity,
    Object? unit = _Undefined,
    bool? isOptional,
  }) {
    return RecipeIngredient(
      id: id is int? ? id : this.id,
      recipeId: recipeId ?? this.recipeId,
      ingredientId: ingredientId ?? this.ingredientId,
      quantity: quantity ?? this.quantity,
      unit: unit is String? ? unit : this.unit,
      isOptional: isOptional ?? this.isOptional,
    );
  }
}

class RecipeIngredientUpdateTable
    extends _is.UpdateTable<RecipeIngredientTable> {
  RecipeIngredientUpdateTable(super.table);

  _is.ColumnValue<int, int> recipeId(int value) => _is.ColumnValue(
    table.recipeId,
    value,
  );

  _is.ColumnValue<int, int> ingredientId(int value) => _is.ColumnValue(
    table.ingredientId,
    value,
  );

  _is.ColumnValue<String, String> quantity(String value) => _is.ColumnValue(
    table.quantity,
    value,
  );

  _is.ColumnValue<String, String> unit(String? value) => _is.ColumnValue(
    table.unit,
    value,
  );

  _is.ColumnValue<bool, bool> isOptional(bool value) => _is.ColumnValue(
    table.isOptional,
    value,
  );
}

class RecipeIngredientTable extends _is.Table<int?> {
  RecipeIngredientTable({super.tableRelation})
    : super(tableName: 'recipe_ingredient') {
    updateTable = RecipeIngredientUpdateTable(this);
    recipeId = _is.ColumnInt(
      'recipeId',
      this,
    );
    ingredientId = _is.ColumnInt(
      'ingredientId',
      this,
    );
    quantity = _is.ColumnString(
      'quantity',
      this,
    );
    unit = _is.ColumnString(
      'unit',
      this,
    );
    isOptional = _is.ColumnBool(
      'isOptional',
      this,
    );
  }

  late final RecipeIngredientUpdateTable updateTable;

  late final _is.ColumnInt recipeId;

  late final _is.ColumnInt ingredientId;

  late final _is.ColumnString quantity;

  late final _is.ColumnString unit;

  late final _is.ColumnBool isOptional;

  @override
  List<_is.Column> get columns => [
    id,
    recipeId,
    ingredientId,
    quantity,
    unit,
    isOptional,
  ];
}

class RecipeIngredientInclude extends _is.IncludeObject {
  RecipeIngredientInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => RecipeIngredient.t;
}

class RecipeIngredientIncludeList extends _is.IncludeList {
  RecipeIngredientIncludeList._({
    _is.WhereExpressionBuilder<RecipeIngredientTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RecipeIngredient.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => RecipeIngredient.t;
}

class RecipeIngredientRepository {
  const RecipeIngredientRepository._();

  /// Returns a list of [RecipeIngredient]s matching the given query parameters.
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
  Future<List<RecipeIngredient>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RecipeIngredientTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RecipeIngredientTable>? orderBy,
    _is.OrderByListBuilder<RecipeIngredientTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RecipeIngredient>(
      where: where?.call(RecipeIngredient.t),
      orderBy: orderBy?.call(RecipeIngredient.t),
      orderByList: orderByList?.call(RecipeIngredient.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RecipeIngredient] matching the given query parameters.
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
  Future<RecipeIngredient?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RecipeIngredientTable>? where,
    int? offset,
    _is.OrderByBuilder<RecipeIngredientTable>? orderBy,
    _is.OrderByListBuilder<RecipeIngredientTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RecipeIngredient>(
      where: where?.call(RecipeIngredient.t),
      orderBy: orderBy?.call(RecipeIngredient.t),
      orderByList: orderByList?.call(RecipeIngredient.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RecipeIngredient] by its [id] or null if no such row exists.
  Future<RecipeIngredient?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RecipeIngredient>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RecipeIngredient]s in the list and returns the inserted rows.
  ///
  /// The returned [RecipeIngredient]s will have their `id` fields set.
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
  Future<List<RecipeIngredient>> insert(
    _is.DatabaseSession session,
    List<RecipeIngredient> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<RecipeIngredient>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [RecipeIngredient] and returns the inserted row.
  ///
  /// The returned [RecipeIngredient] will have its `id` field set.
  Future<RecipeIngredient> insertRow(
    _is.DatabaseSession session,
    RecipeIngredient row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<RecipeIngredient>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [RecipeIngredient]s in the list and returns the resulting rows.
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
  /// The returned [RecipeIngredient]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RecipeIngredient>> upsert(
    _is.DatabaseSession session,
    List<RecipeIngredient> rows, {
    required _is.ColumnSelections<RecipeIngredientTable> conflictColumns,
    _is.ColumnSelections<RecipeIngredientTable>? updateColumns,
    _is.WhereExpressionBuilder<RecipeIngredientTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<RecipeIngredient>(
      rows,
      conflictColumns: conflictColumns(RecipeIngredient.t),
      updateColumns: updateColumns?.call(RecipeIngredient.t),
      updateWhere: updateWhere?.call(RecipeIngredient.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [RecipeIngredient] and returns the resulting row.
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
  /// The returned [RecipeIngredient] will have its `id` field set.
  Future<RecipeIngredient?> upsertRow(
    _is.DatabaseSession session,
    RecipeIngredient row, {
    required _is.ColumnSelections<RecipeIngredientTable> conflictColumns,
    _is.ColumnSelections<RecipeIngredientTable>? updateColumns,
    _is.WhereExpressionBuilder<RecipeIngredientTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<RecipeIngredient>(
      row,
      conflictColumns: conflictColumns(RecipeIngredient.t),
      updateColumns: updateColumns?.call(RecipeIngredient.t),
      updateWhere: updateWhere?.call(RecipeIngredient.t),
      transaction: transaction,
    );
  }

  /// Updates all [RecipeIngredient]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RecipeIngredient>> update(
    _is.DatabaseSession session,
    List<RecipeIngredient> rows, {
    _is.ColumnSelections<RecipeIngredientTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<RecipeIngredient>(
      rows,
      columns: columns?.call(RecipeIngredient.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [RecipeIngredient]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RecipeIngredient> updateRow(
    _is.DatabaseSession session,
    RecipeIngredient row, {
    _is.ColumnSelections<RecipeIngredientTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<RecipeIngredient>(
      row,
      columns: columns?.call(RecipeIngredient.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RecipeIngredient] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RecipeIngredient?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<RecipeIngredientUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<RecipeIngredient>(
      id,
      columnValues: columnValues(RecipeIngredient.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RecipeIngredient]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RecipeIngredient>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<RecipeIngredientUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<RecipeIngredientTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RecipeIngredientTable>? orderBy,
    _is.OrderByListBuilder<RecipeIngredientTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<RecipeIngredient>(
      columnValues: columnValues(RecipeIngredient.t.updateTable),
      where: where(RecipeIngredient.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RecipeIngredient.t),
      orderByList: orderByList?.call(RecipeIngredient.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [RecipeIngredient]s in the list and returns the deleted rows.
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
  Future<List<RecipeIngredient>> delete(
    _is.DatabaseSession session,
    List<RecipeIngredient> rows, {
    _is.OrderByBuilder<RecipeIngredientTable>? orderBy,
    _is.OrderByListBuilder<RecipeIngredientTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<RecipeIngredient>(
      rows,
      orderBy: orderBy?.call(RecipeIngredient.t),
      orderByList: orderByList?.call(RecipeIngredient.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [RecipeIngredient].
  Future<RecipeIngredient> deleteRow(
    _is.DatabaseSession session,
    RecipeIngredient row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RecipeIngredient>(
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
  Future<List<RecipeIngredient>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RecipeIngredientTable> where,
    _is.OrderByBuilder<RecipeIngredientTable>? orderBy,
    _is.OrderByListBuilder<RecipeIngredientTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<RecipeIngredient>(
      where: where(RecipeIngredient.t),
      orderBy: orderBy?.call(RecipeIngredient.t),
      orderByList: orderByList?.call(RecipeIngredient.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RecipeIngredientTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<RecipeIngredient>(
      where: where?.call(RecipeIngredient.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RecipeIngredient] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RecipeIngredientTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RecipeIngredient>(
      where: where(RecipeIngredient.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
