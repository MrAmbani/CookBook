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
import 'package:cookbook_client/src/protocol/protocol.dart' as _i4jo8f4z;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'recipe.dart' as _ixmlxsuh;
import 'recipe_ingredient_details.dart' as _inpog33j;

abstract class RecipeDetails
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RecipeDetails._({
    required this.recipe,
    required this.ingredients,
  });

  factory RecipeDetails({
    required _ixmlxsuh.Recipe recipe,
    required List<_inpog33j.RecipeIngredientDetail> ingredients,
  }) = _RecipeDetailsImpl;

  factory RecipeDetails.fromJson(Map<String, dynamic> jsonSerialization) {
    return RecipeDetails(
      recipe: _i4jo8f4z.Protocol().deserialize<_ixmlxsuh.Recipe>(
        jsonSerialization['recipe'],
      ),
      ingredients: _i4jo8f4z.Protocol()
          .deserialize<List<_inpog33j.RecipeIngredientDetail>>(
            jsonSerialization['ingredients'],
          ),
    );
  }

  _ixmlxsuh.Recipe recipe;

  List<_inpog33j.RecipeIngredientDetail> ingredients;

  /// Returns a shallow copy of this [RecipeDetails]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RecipeDetails copyWith({
    _ixmlxsuh.Recipe? recipe,
    List<_inpog33j.RecipeIngredientDetail>? ingredients,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RecipeDetails',
      'recipe': recipe.toJson(),
      'ingredients': ingredients.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RecipeDetails',
      'recipe': recipe.toJsonForProtocol(),
      'ingredients': ingredients.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _RecipeDetailsImpl extends RecipeDetails {
  _RecipeDetailsImpl({
    required _ixmlxsuh.Recipe recipe,
    required List<_inpog33j.RecipeIngredientDetail> ingredients,
  }) : super._(
         recipe: recipe,
         ingredients: ingredients,
       );

  /// Returns a shallow copy of this [RecipeDetails]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RecipeDetails copyWith({
    _ixmlxsuh.Recipe? recipe,
    List<_inpog33j.RecipeIngredientDetail>? ingredients,
  }) {
    return RecipeDetails(
      recipe: recipe ?? this.recipe.copyWith(),
      ingredients:
          ingredients ?? this.ingredients.map((e0) => e0.copyWith()).toList(),
    );
  }
}
