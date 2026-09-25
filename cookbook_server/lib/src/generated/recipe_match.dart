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
import 'package:cookbook_server/src/generated/protocol.dart' as _ivc3tylf;
import 'package:serverpod/serverpod.dart' as _is;
import 'recipe.dart' as _ixmlxsuh;

abstract class RecipeMatch
    implements _is.SerializableModel, _is.ProtocolSerialization {
  RecipeMatch._({
    required this.recipe,
    required this.score,
    required this.missingIngredients,
  });

  factory RecipeMatch({
    required _ixmlxsuh.Recipe recipe,
    required double score,
    required List<String> missingIngredients,
  }) = _RecipeMatchImpl;

  factory RecipeMatch.fromJson(Map<String, dynamic> jsonSerialization) {
    return RecipeMatch(
      recipe: _ivc3tylf.Protocol().deserialize<_ixmlxsuh.Recipe>(
        jsonSerialization['recipe'],
      ),
      score: (jsonSerialization['score'] as num).toDouble(),
      missingIngredients: _ivc3tylf.Protocol().deserialize<List<String>>(
        jsonSerialization['missingIngredients'],
      ),
    );
  }

  _ixmlxsuh.Recipe recipe;

  double score;

  List<String> missingIngredients;

  /// Returns a shallow copy of this [RecipeMatch]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RecipeMatch copyWith({
    _ixmlxsuh.Recipe? recipe,
    double? score,
    List<String>? missingIngredients,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RecipeMatch',
      'recipe': recipe.toJson(),
      'score': score,
      'missingIngredients': missingIngredients.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RecipeMatch',
      'recipe': recipe.toJsonForProtocol(),
      'score': score,
      'missingIngredients': missingIngredients.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _RecipeMatchImpl extends RecipeMatch {
  _RecipeMatchImpl({
    required _ixmlxsuh.Recipe recipe,
    required double score,
    required List<String> missingIngredients,
  }) : super._(
         recipe: recipe,
         score: score,
         missingIngredients: missingIngredients,
       );

  /// Returns a shallow copy of this [RecipeMatch]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RecipeMatch copyWith({
    _ixmlxsuh.Recipe? recipe,
    double? score,
    List<String>? missingIngredients,
  }) {
    return RecipeMatch(
      recipe: recipe ?? this.recipe.copyWith(),
      score: score ?? this.score,
      missingIngredients:
          missingIngredients ??
          this.missingIngredients.map((e0) => e0).toList(),
    );
  }
}
