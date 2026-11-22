import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class LikeEndpoint extends Endpoint {
  /// Likes the post if you haven't, unlikes it if you have.
  /// Returns true if the post is now liked by you.
  Future<bool> toggle(Session session, int postId) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) throw Exception('Authentication required');

    final post = await SocialPost.db.findById(session, postId);
    if (post == null) throw Exception('Post not found');

    final existing = await PostLike.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.postId.equals(postId),
    );

    if (existing != null) {
      await PostLike.db.deleteRow(session, existing);
      return false;
    }

    await PostLike.db.insertRow(
      session,
      PostLike(userId: userId, postId: postId, createdAt: DateTime.now()),
    );
    return true;
  }
}
