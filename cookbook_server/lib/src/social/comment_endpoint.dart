import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class CommentEndpoint extends Endpoint {
  /// Oldest first, so conversations read top to bottom.
  /// Anyone, including guests, can read comments.
  Future<List<PostComment>> getComments(Session session, int postId) async {
    return await PostComment.db.find(
      session,
      where: (t) => t.postId.equals(postId),
      orderBy: (t) => t.createdAt,
      limit: 100,
    );
  }

  Future<PostComment> add(
    Session session, {
    required int postId,
    required String text,
  }) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) throw Exception('Authentication required');

    final body = text.trim();
    if (body.isEmpty) throw Exception('Comment cannot be empty');
    if (body.length > 300) throw Exception('Comment too long (max 300)');

    final post = await SocialPost.db.findById(session, postId);
    if (post == null) throw Exception('Post not found');

    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    return await PostComment.db.insertRow(
      session,
      PostComment(
        postId: postId,
        userId: userId,
        authorName: profile?.name ?? 'Unknown',
        text: body,
        createdAt: DateTime.now(),
      ),
    );
  }

  /// Owner or admin only, checked here on the server.
  Future<void> delete(Session session, int commentId) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) throw Exception('Authentication required');

    final comment = await PostComment.db.findById(session, commentId);
    if (comment == null) return;

    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
    final isAdmin = profile?.role == 'admin';

    if (comment.userId != userId && !isAdmin) {
      throw Exception('Not allowed to delete this comment');
    }
    await PostComment.db.deleteRow(session, comment);
  }
}
