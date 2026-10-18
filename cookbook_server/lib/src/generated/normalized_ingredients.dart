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

abstract class NormalizedIngredients
    implements _is.SerializableModel, _is.ProtocolSerialization {
  NormalizedIngredients._({
    required this.recognized,
    required this.unrecognized,
  });

  factory NormalizedIngredients({
    required List<String> recognized,
    required List<String> unrecognized,
  }) = _NormalizedIngredientsImpl;

  factory NormalizedIngredients.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return NormalizedIngredients(
      recognized: _ivc3tylf.Protocol().deserialize<List<String>>(
        jsonSerialization['recognized'],
      ),
      unrecognized: _ivc3tylf.Protocol().deserialize<List<String>>(
        jsonSerialization['unrecognized'],
      ),
    );
  }

  List<String> recognized;

  List<String> unrecognized;

  /// Returns a shallow copy of this [NormalizedIngredients]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  NormalizedIngredients copyWith({
    List<String>? recognized,
    List<String>? unrecognized,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NormalizedIngredients',
      'recognized': recognized.toJson(),
      'unrecognized': unrecognized.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'NormalizedIngredients',
      'recognized': recognized.toJson(),
      'unrecognized': unrecognized.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _NormalizedIngredientsImpl extends NormalizedIngredients {
  _NormalizedIngredientsImpl({
    required List<String> recognized,
    required List<String> unrecognized,
  }) : super._(
         recognized: recognized,
         unrecognized: unrecognized,
       );

  /// Returns a shallow copy of this [NormalizedIngredients]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  NormalizedIngredients copyWith({
    List<String>? recognized,
    List<String>? unrecognized,
  }) {
    return NormalizedIngredients(
      recognized: recognized ?? this.recognized.map((e0) => e0).toList(),
      unrecognized: unrecognized ?? this.unrecognized.map((e0) => e0).toList(),
    );
  }
}
