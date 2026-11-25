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

abstract class NewRecipeIngredient
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  NewRecipeIngredient._({
    required this.name,
    required this.quantity,
    this.unit,
    required this.isOptional,
  });

  factory NewRecipeIngredient({
    required String name,
    required String quantity,
    String? unit,
    required bool isOptional,
  }) = _NewRecipeIngredientImpl;

  factory NewRecipeIngredient.fromJson(Map<String, dynamic> jsonSerialization) {
    return NewRecipeIngredient(
      name: jsonSerialization['name'] as String,
      quantity: jsonSerialization['quantity'] as String,
      unit: jsonSerialization['unit'] as String?,
      isOptional: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isOptional'],
      ),
    );
  }

  String name;

  String quantity;

  String? unit;

  bool isOptional;

  /// Returns a shallow copy of this [NewRecipeIngredient]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  NewRecipeIngredient copyWith({
    String? name,
    String? quantity,
    String? unit,
    bool? isOptional,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NewRecipeIngredient',
      'name': name,
      'quantity': quantity,
      if (unit != null) 'unit': unit,
      'isOptional': isOptional,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'NewRecipeIngredient',
      'name': name,
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

class _NewRecipeIngredientImpl extends NewRecipeIngredient {
  _NewRecipeIngredientImpl({
    required String name,
    required String quantity,
    String? unit,
    required bool isOptional,
  }) : super._(
         name: name,
         quantity: quantity,
         unit: unit,
         isOptional: isOptional,
       );

  /// Returns a shallow copy of this [NewRecipeIngredient]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  NewRecipeIngredient copyWith({
    String? name,
    String? quantity,
    Object? unit = _Undefined,
    bool? isOptional,
  }) {
    return NewRecipeIngredient(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      unit: unit is String? ? unit : this.unit,
      isOptional: isOptional ?? this.isOptional,
    );
  }
}
