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
import 'social_post.dart' as _ixq4a7a9;

abstract class FeedItem
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  FeedItem._({
    required this.post,
    required this.likeCount,
    required this.likedByMe,
  });

  factory FeedItem({
    required _ixq4a7a9.SocialPost post,
    required int likeCount,
    required bool likedByMe,
  }) = _FeedItemImpl;

  factory FeedItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return FeedItem(
      post: _i4jo8f4z.Protocol().deserialize<_ixq4a7a9.SocialPost>(
        jsonSerialization['post'],
      ),
      likeCount: jsonSerialization['likeCount'] as int,
      likedByMe: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['likedByMe'],
      ),
    );
  }

  _ixq4a7a9.SocialPost post;

  int likeCount;

  bool likedByMe;

  /// Returns a shallow copy of this [FeedItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  FeedItem copyWith({
    _ixq4a7a9.SocialPost? post,
    int? likeCount,
    bool? likedByMe,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FeedItem',
      'post': post.toJson(),
      'likeCount': likeCount,
      'likedByMe': likedByMe,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FeedItem',
      'post': post.toJsonForProtocol(),
      'likeCount': likeCount,
      'likedByMe': likedByMe,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _FeedItemImpl extends FeedItem {
  _FeedItemImpl({
    required _ixq4a7a9.SocialPost post,
    required int likeCount,
    required bool likedByMe,
  }) : super._(
         post: post,
         likeCount: likeCount,
         likedByMe: likedByMe,
       );

  /// Returns a shallow copy of this [FeedItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  FeedItem copyWith({
    _ixq4a7a9.SocialPost? post,
    int? likeCount,
    bool? likedByMe,
  }) {
    return FeedItem(
      post: post ?? this.post.copyWith(),
      likeCount: likeCount ?? this.likeCount,
      likedByMe: likedByMe ?? this.likedByMe,
    );
  }
}
