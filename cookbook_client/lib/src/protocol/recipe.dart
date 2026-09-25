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

abstract class Recipe
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Recipe._({
    this.id,
    required this.title,
    required this.description,
    required this.instructions,
    required this.prepTime,
    required this.cookTime,
    required this.servings,
    required this.difficulty,
    this.creatorId,
    required this.isAiGenerated,
  });

  factory Recipe({
    int? id,
    required String title,
    required String description,
    required String instructions,
    required int prepTime,
    required int cookTime,
    required int servings,
    required String difficulty,
    String? creatorId,
    required bool isAiGenerated,
  }) = _RecipeImpl;

  factory Recipe.fromJson(Map<String, dynamic> jsonSerialization) {
    return Recipe(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      instructions: jsonSerialization['instructions'] as String,
      prepTime: jsonSerialization['prepTime'] as int,
      cookTime: jsonSerialization['cookTime'] as int,
      servings: jsonSerialization['servings'] as int,
      difficulty: jsonSerialization['difficulty'] as String,
      creatorId: jsonSerialization['creatorId'] as String?,
      isAiGenerated: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isAiGenerated'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String description;

  String instructions;

  int prepTime;

  int cookTime;

  int servings;

  String difficulty;

  String? creatorId;

  bool isAiGenerated;

  /// Returns a shallow copy of this [Recipe]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Recipe copyWith({
    int? id,
    String? title,
    String? description,
    String? instructions,
    int? prepTime,
    int? cookTime,
    int? servings,
    String? difficulty,
    String? creatorId,
    bool? isAiGenerated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Recipe',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'instructions': instructions,
      'prepTime': prepTime,
      'cookTime': cookTime,
      'servings': servings,
      'difficulty': difficulty,
      if (creatorId != null) 'creatorId': creatorId,
      'isAiGenerated': isAiGenerated,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Recipe',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'instructions': instructions,
      'prepTime': prepTime,
      'cookTime': cookTime,
      'servings': servings,
      'difficulty': difficulty,
      if (creatorId != null) 'creatorId': creatorId,
      'isAiGenerated': isAiGenerated,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RecipeImpl extends Recipe {
  _RecipeImpl({
    int? id,
    required String title,
    required String description,
    required String instructions,
    required int prepTime,
    required int cookTime,
    required int servings,
    required String difficulty,
    String? creatorId,
    required bool isAiGenerated,
  }) : super._(
         id: id,
         title: title,
         description: description,
         instructions: instructions,
         prepTime: prepTime,
         cookTime: cookTime,
         servings: servings,
         difficulty: difficulty,
         creatorId: creatorId,
         isAiGenerated: isAiGenerated,
       );

  /// Returns a shallow copy of this [Recipe]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Recipe copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? instructions,
    int? prepTime,
    int? cookTime,
    int? servings,
    String? difficulty,
    Object? creatorId = _Undefined,
    bool? isAiGenerated,
  }) {
    return Recipe(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      instructions: instructions ?? this.instructions,
      prepTime: prepTime ?? this.prepTime,
      cookTime: cookTime ?? this.cookTime,
      servings: servings ?? this.servings,
      difficulty: difficulty ?? this.difficulty,
      creatorId: creatorId is String? ? creatorId : this.creatorId,
      isAiGenerated: isAiGenerated ?? this.isAiGenerated,
    );
  }
}
