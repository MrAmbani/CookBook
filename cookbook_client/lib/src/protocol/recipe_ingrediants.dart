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

abstract class RecipeIngredient
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
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
      isOptional: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isOptional'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int recipeId;

  int ingredientId;

  String quantity;

  String? unit;

  bool isOptional;

  /// Returns a shallow copy of this [RecipeIngredient]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
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

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
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
  @_isc.useResult
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
