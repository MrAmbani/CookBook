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
import 'package:cookbook_client/src/protocol/feed_item.dart' as _ifq0pwto;
import 'package:cookbook_client/src/protocol/post_comment.dart' as _itl7hg3m;
import 'package:cookbook_client/src/protocol/recipe.dart' as _ipe9xyte;
import 'package:cookbook_client/src/protocol/recipe_match.dart' as _ix9qtf7i;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'feed_item.dart' as _ionihcdq;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'ingrediants.dart' as _i9otnek0;
import 'normalized_ingredients.dart' as _imncc5ah;
import 'post_comment.dart' as _imkhylta;
import 'post_like.dart' as _i2v49lle;
import 'recipe.dart' as _ixmlxsuh;
import 'recipe_details.dart' as _isbyitoy;
import 'recipe_ingrediants.dart' as _i2urvore;
import 'recipe_ingredient_details.dart' as _inpog33j;
import 'recipe_match.dart' as _ijym6e17;
import 'saved_recipe.dart' as _igrf4bz7;
import 'social_post.dart' as _ixq4a7a9;
import 'user_follow.dart' as _irjv1u4s;
import 'user_profile.dart' as _ir2mn8w1;
import 'user_summary.dart' as _izljl0an;
export 'feed_item.dart';
export 'greetings/greeting.dart';
export 'ingrediants.dart';
export 'normalized_ingredients.dart';
export 'post_comment.dart';
export 'post_like.dart';
export 'recipe.dart';
export 'recipe_details.dart';
export 'recipe_ingrediants.dart';
export 'recipe_ingredient_details.dart';
export 'recipe_match.dart';
export 'saved_recipe.dart';
export 'social_post.dart';
export 'user_follow.dart';
export 'user_profile.dart';
export 'user_summary.dart';
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

    if (t == _ionihcdq.FeedItem) {
      return _ionihcdq.FeedItem.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _i9otnek0.Ingredient) {
      return _i9otnek0.Ingredient.fromJson(data) as T;
    }
    if (t == _imncc5ah.NormalizedIngredients) {
      return _imncc5ah.NormalizedIngredients.fromJson(data) as T;
    }
    if (t == _imkhylta.PostComment) {
      return _imkhylta.PostComment.fromJson(data) as T;
    }
    if (t == _i2v49lle.PostLike) {
      return _i2v49lle.PostLike.fromJson(data) as T;
    }
    if (t == _ixmlxsuh.Recipe) {
      return _ixmlxsuh.Recipe.fromJson(data) as T;
    }
    if (t == _isbyitoy.RecipeDetails) {
      return _isbyitoy.RecipeDetails.fromJson(data) as T;
    }
    if (t == _i2urvore.RecipeIngredient) {
      return _i2urvore.RecipeIngredient.fromJson(data) as T;
    }
    if (t == _inpog33j.RecipeIngredientDetail) {
      return _inpog33j.RecipeIngredientDetail.fromJson(data) as T;
    }
    if (t == _ijym6e17.RecipeMatch) {
      return _ijym6e17.RecipeMatch.fromJson(data) as T;
    }
    if (t == _igrf4bz7.SavedRecipe) {
      return _igrf4bz7.SavedRecipe.fromJson(data) as T;
    }
    if (t == _ixq4a7a9.SocialPost) {
      return _ixq4a7a9.SocialPost.fromJson(data) as T;
    }
    if (t == _irjv1u4s.UserFollow) {
      return _irjv1u4s.UserFollow.fromJson(data) as T;
    }
    if (t == _ir2mn8w1.UserProfile) {
      return _ir2mn8w1.UserProfile.fromJson(data) as T;
    }
    if (t == _izljl0an.UserSummary) {
      return _izljl0an.UserSummary.fromJson(data) as T;
    }
    if (t == _isc.getType<_ionihcdq.FeedItem?>()) {
      return (data != null ? _ionihcdq.FeedItem.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i9otnek0.Ingredient?>()) {
      return (data != null ? _i9otnek0.Ingredient.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_imncc5ah.NormalizedIngredients?>()) {
      return (data != null
              ? _imncc5ah.NormalizedIngredients.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_imkhylta.PostComment?>()) {
      return (data != null ? _imkhylta.PostComment.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i2v49lle.PostLike?>()) {
      return (data != null ? _i2v49lle.PostLike.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ixmlxsuh.Recipe?>()) {
      return (data != null ? _ixmlxsuh.Recipe.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_isbyitoy.RecipeDetails?>()) {
      return (data != null ? _isbyitoy.RecipeDetails.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i2urvore.RecipeIngredient?>()) {
      return (data != null ? _i2urvore.RecipeIngredient.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_inpog33j.RecipeIngredientDetail?>()) {
      return (data != null
              ? _inpog33j.RecipeIngredientDetail.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_ijym6e17.RecipeMatch?>()) {
      return (data != null ? _ijym6e17.RecipeMatch.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_igrf4bz7.SavedRecipe?>()) {
      return (data != null ? _igrf4bz7.SavedRecipe.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ixq4a7a9.SocialPost?>()) {
      return (data != null ? _ixq4a7a9.SocialPost.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_irjv1u4s.UserFollow?>()) {
      return (data != null ? _irjv1u4s.UserFollow.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ir2mn8w1.UserProfile?>()) {
      return (data != null ? _ir2mn8w1.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_izljl0an.UserSummary?>()) {
      return (data != null ? _izljl0an.UserSummary.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_inpog33j.RecipeIngredientDetail>) {
      return (data as List)
              .map((e) => deserialize<_inpog33j.RecipeIngredientDetail>(e))
              .toList()
          as T;
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
    if (t == List<_ipe9xyte.Recipe>) {
      return (data as List)
              .map((e) => deserialize<_ipe9xyte.Recipe>(e))
              .toList()
          as T;
    }
    if (t == List<_itl7hg3m.PostComment>) {
      return (data as List)
              .map((e) => deserialize<_itl7hg3m.PostComment>(e))
              .toList()
          as T;
    }
    if (t == List<_ifq0pwto.FeedItem>) {
      return (data as List)
              .map((e) => deserialize<_ifq0pwto.FeedItem>(e))
              .toList()
          as T;
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
      _ionihcdq.FeedItem => 'FeedItem',
      _izw8z7ou.Greeting => 'Greeting',
      _i9otnek0.Ingredient => 'Ingredient',
      _imncc5ah.NormalizedIngredients => 'NormalizedIngredients',
      _imkhylta.PostComment => 'PostComment',
      _i2v49lle.PostLike => 'PostLike',
      _ixmlxsuh.Recipe => 'Recipe',
      _isbyitoy.RecipeDetails => 'RecipeDetails',
      _i2urvore.RecipeIngredient => 'RecipeIngredient',
      _inpog33j.RecipeIngredientDetail => 'RecipeIngredientDetail',
      _ijym6e17.RecipeMatch => 'RecipeMatch',
      _igrf4bz7.SavedRecipe => 'SavedRecipe',
      _ixq4a7a9.SocialPost => 'SocialPost',
      _irjv1u4s.UserFollow => 'UserFollow',
      _ir2mn8w1.UserProfile => 'UserProfile',
      _izljl0an.UserSummary => 'UserSummary',
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
      case _ionihcdq.FeedItem():
        return 'FeedItem';
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _i9otnek0.Ingredient():
        return 'Ingredient';
      case _imncc5ah.NormalizedIngredients():
        return 'NormalizedIngredients';
      case _imkhylta.PostComment():
        return 'PostComment';
      case _i2v49lle.PostLike():
        return 'PostLike';
      case _ixmlxsuh.Recipe():
        return 'Recipe';
      case _isbyitoy.RecipeDetails():
        return 'RecipeDetails';
      case _i2urvore.RecipeIngredient():
        return 'RecipeIngredient';
      case _inpog33j.RecipeIngredientDetail():
        return 'RecipeIngredientDetail';
      case _ijym6e17.RecipeMatch():
        return 'RecipeMatch';
      case _igrf4bz7.SavedRecipe():
        return 'SavedRecipe';
      case _ixq4a7a9.SocialPost():
        return 'SocialPost';
      case _irjv1u4s.UserFollow():
        return 'UserFollow';
      case _ir2mn8w1.UserProfile():
        return 'UserProfile';
      case _izljl0an.UserSummary():
        return 'UserSummary';
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
    if (dataClassName == 'FeedItem') {
      return deserialize<_ionihcdq.FeedItem>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'Ingredient') {
      return deserialize<_i9otnek0.Ingredient>(data['data']);
    }
    if (dataClassName == 'NormalizedIngredients') {
      return deserialize<_imncc5ah.NormalizedIngredients>(data['data']);
    }
    if (dataClassName == 'PostComment') {
      return deserialize<_imkhylta.PostComment>(data['data']);
    }
    if (dataClassName == 'PostLike') {
      return deserialize<_i2v49lle.PostLike>(data['data']);
    }
    if (dataClassName == 'Recipe') {
      return deserialize<_ixmlxsuh.Recipe>(data['data']);
    }
    if (dataClassName == 'RecipeDetails') {
      return deserialize<_isbyitoy.RecipeDetails>(data['data']);
    }
    if (dataClassName == 'RecipeIngredient') {
      return deserialize<_i2urvore.RecipeIngredient>(data['data']);
    }
    if (dataClassName == 'RecipeIngredientDetail') {
      return deserialize<_inpog33j.RecipeIngredientDetail>(data['data']);
    }
    if (dataClassName == 'RecipeMatch') {
      return deserialize<_ijym6e17.RecipeMatch>(data['data']);
    }
    if (dataClassName == 'SavedRecipe') {
      return deserialize<_igrf4bz7.SavedRecipe>(data['data']);
    }
    if (dataClassName == 'SocialPost') {
      return deserialize<_ixq4a7a9.SocialPost>(data['data']);
    }
    if (dataClassName == 'UserFollow') {
      return deserialize<_irjv1u4s.UserFollow>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_ir2mn8w1.UserProfile>(data['data']);
    }
    if (dataClassName == 'UserSummary') {
      return deserialize<_izljl0an.UserSummary>(data['data']);
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
