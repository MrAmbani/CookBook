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

abstract class RecipeIngredientDetail
    implements _is.SerializableModel, _is.ProtocolSerialization {
  RecipeIngredientDetail._({
    required this.ingredientName,
    required this.quantity,
    this.unit,
    required this.isOptional,
  });

  factory RecipeIngredientDetail({
    required String ingredientName,
    required String quantity,
    String? unit,
    required bool isOptional,
  }) = _RecipeIngredientDetailImpl;

  factory RecipeIngredientDetail.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RecipeIngredientDetail(
      ingredientName: jsonSerialization['ingredientName'] as String,
      quantity: jsonSerialization['quantity'] as String,
      unit: jsonSerialization['unit'] as String?,
      isOptional: _is.BoolJsonExtension.fromJson(
        jsonSerialization['isOptional'],
      ),
    );
  }

  String ingredientName;

  String quantity;

  String? unit;

  bool isOptional;

  /// Returns a shallow copy of this [RecipeIngredientDetail]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RecipeIngredientDetail copyWith({
    String? ingredientName,
    String? quantity,
    String? unit,
    bool? isOptional,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RecipeIngredientDetail',
      'ingredientName': ingredientName,
      'quantity': quantity,
      if (unit != null) 'unit': unit,
      'isOptional': isOptional,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RecipeIngredientDetail',
      'ingredientName': ingredientName,
      'quantity': quantity,
      if (unit != null) 'unit': unit,
      'isOptional': isOptional,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RecipeIngredientDetailImpl extends RecipeIngredientDetail {
  _RecipeIngredientDetailImpl({
    required String ingredientName,
    required String quantity,
    String? unit,
    required bool isOptional,
  }) : super._(
         ingredientName: ingredientName,
         quantity: quantity,
         unit: unit,
         isOptional: isOptional,
       );

  /// Returns a shallow copy of this [RecipeIngredientDetail]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RecipeIngredientDetail copyWith({
    String? ingredientName,
    String? quantity,
    Object? unit = _Undefined,
    bool? isOptional,
  }) {
    return RecipeIngredientDetail(
      ingredientName: ingredientName ?? this.ingredientName,
      quantity: quantity ?? this.quantity,
      unit: unit is String? ? unit : this.unit,
      isOptional: isOptional ?? this.isOptional,
    );
  }
}
