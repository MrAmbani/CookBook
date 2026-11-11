import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class PostEndpoint extends Endpoint {
  /// Newest posts first. Anyone, including guests, can read the feed.
  Future<List<SocialPost>> getFeed(
    Session session, {
    required int offset,
    required int limit,
  }) async {
    return await SocialPost.db.find(
      session,
      orderBy: (t) => t.createdAt.desc(),
      offset: offset,
      limit: limit,
    );
  }

  Future<SocialPost> createPost(
    Session session, {
    required String caption,
    int? recipeId,
  }) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) throw Exception('Authentication required');

    final text = caption.trim();
    if (text.isEmpty) throw Exception('Caption cannot be empty');
    if (text.length > 500) throw Exception('Caption too long (max 500)');

    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    return await SocialPost.db.insertRow(
      session,
      SocialPost(
        userId: userId,
        authorName: profile?.name ?? 'Unknown',
        recipeId: recipeId,
        caption: text,
        createdAt: DateTime.now(),
      ),
    );
  }

  /// Owner or admin only. The check happens here on the server, so hiding
  /// the button in Flutter is just a convenience.
  Future<void> deletePost(Session session, int postId) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) throw Exception('Authentication required');

    final post = await SocialPost.db.findById(session, postId);
    if (post == null) return;

    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
    final isAdmin = profile?.role == 'admin';

    if (post.userId != userId && !isAdmin) {
      throw Exception('Not allowed to delete this post');
    }
    await SocialPost.db.deleteRow(session, post);
  }
}
