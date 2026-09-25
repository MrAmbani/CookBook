/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cookbook_client/src/protocol/recipe_match.dart' as _ix9qtf7i;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'ingrediants.dart' as _i9otnek0;
import 'recipe.dart' as _ixmlxsuh;
import 'recipe_ingrediants.dart' as _i2urvore;
import 'recipe_match.dart' as _ijym6e17;
import 'user_profile.dart' as _ir2mn8w1;
export 'greetings/greeting.dart';
export 'ingrediants.dart';
export 'recipe.dart';
export 'recipe_ingrediants.dart';
export 'recipe_match.dart';
export 'user_profile.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _i9otnek0.Ingredient) {
      return _i9otnek0.Ingredient.fromJson(data) as T;
    }
    if (t == _ixmlxsuh.Recipe) {
      return _ixmlxsuh.Recipe.fromJson(data) as T;
    }
    if (t == _i2urvore.RecipeIngredient) {
      return _i2urvore.RecipeIngredient.fromJson(data) as T;
    }
    if (t == _ijym6e17.RecipeMatch) {
      return _ijym6e17.RecipeMatch.fromJson(data) as T;
    }
    if (t == _ir2mn8w1.UserProfile) {
      return _ir2mn8w1.UserProfile.fromJson(data) as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i9otnek0.Ingredient?>()) {
      return (data != null ? _i9otnek0.Ingredient.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ixmlxsuh.Recipe?>()) {
      return (data != null ? _ixmlxsuh.Recipe.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i2urvore.RecipeIngredient?>()) {
      return (data != null ? _i2urvore.RecipeIngredient.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ijym6e17.RecipeMatch?>()) {
      return (data != null ? _ijym6e17.RecipeMatch.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ir2mn8w1.UserProfile?>()) {
      return (data != null ? _ir2mn8w1.UserProfile.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_ix9qtf7i.RecipeMatch>) {
      return (data as List)
              .map((e) => deserialize<_ix9qtf7i.RecipeMatch>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    try {
      return _iaic.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacc.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _izw8z7ou.Greeting => 'Greeting',
      _i9otnek0.Ingredient => 'Ingredient',
      _ixmlxsuh.Recipe => 'Recipe',
      _i2urvore.RecipeIngredient => 'RecipeIngredient',
      _ijym6e17.RecipeMatch => 'RecipeMatch',
      _ir2mn8w1.UserProfile => 'UserProfile',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('cookbook.', '');
    }

    switch (data) {
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _i9otnek0.Ingredient():
        return 'Ingredient';
      case _ixmlxsuh.Recipe():
        return 'Recipe';
      case _i2urvore.RecipeIngredient():
        return 'RecipeIngredient';
      case _ijym6e17.RecipeMatch():
        return 'RecipeMatch';
      case _ir2mn8w1.UserProfile():
        return 'UserProfile';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'Ingredient') {
      return deserialize<_i9otnek0.Ingredient>(data['data']);
    }
    if (dataClassName == 'Recipe') {
      return deserialize<_ixmlxsuh.Recipe>(data['data']);
    }
    if (dataClassName == 'RecipeIngredient') {
      return deserialize<_i2urvore.RecipeIngredient>(data['data']);
    }
    if (dataClassName == 'RecipeMatch') {
      return deserialize<_ijym6e17.RecipeMatch>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_ir2mn8w1.UserProfile>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iaic.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacc.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('cookbook', this);
    _iacc.Protocol().registerHostProtocol('cookbook', this);
  }

  @override
  String getModuleName() => 'cookbook';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
