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

abstract class SavedRecipe
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  SavedRecipe._({
    this.id,
    required this.userId,
    required this.recipeId,
    required this.savedAt,
  });

  factory SavedRecipe({
    int? id,
    required String userId,
    required int recipeId,
    required DateTime savedAt,
  }) = _SavedRecipeImpl;

  factory SavedRecipe.fromJson(Map<String, dynamic> jsonSerialization) {
    return SavedRecipe(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      recipeId: jsonSerialization['recipeId'] as int,
      savedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['savedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String userId;

  int recipeId;

  DateTime savedAt;

  /// Returns a shallow copy of this [SavedRecipe]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  SavedRecipe copyWith({
    int? id,
    String? userId,
    int? recipeId,
    DateTime? savedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SavedRecipe',
      if (id != null) 'id': id,
      'userId': userId,
      'recipeId': recipeId,
      'savedAt': savedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SavedRecipe',
      if (id != null) 'id': id,
      'userId': userId,
      'recipeId': recipeId,
      'savedAt': savedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SavedRecipeImpl extends SavedRecipe {
  _SavedRecipeImpl({
    int? id,
    required String userId,
    required int recipeId,
    required DateTime savedAt,
  }) : super._(
         id: id,
         userId: userId,
         recipeId: recipeId,
         savedAt: savedAt,
       );

  /// Returns a shallow copy of this [SavedRecipe]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  SavedRecipe copyWith({
    Object? id = _Undefined,
    String? userId,
    int? recipeId,
    DateTime? savedAt,
  }) {
    return SavedRecipe(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      recipeId: recipeId ?? this.recipeId,
      savedAt: savedAt ?? this.savedAt,
    );
  }
}
