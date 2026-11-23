import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../auth/auth_helpers.dart';

class ReportEndpoint extends Endpoint {
  /// Any logged-in user can report someone else's post, once.
  Future<void> reportPost(
    Session session, {
    required int postId,
    required String reason,
  }) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) throw Exception('Authentication required');

    final text = reason.trim();
    if (text.isEmpty) throw Exception('Reason cannot be empty');
    if (text.length > 200) throw Exception('Reason too long (max 200)');

    final post = await SocialPost.db.findById(session, postId);
    if (post == null) throw Exception('Post not found');
    if (post.userId == userId) {
      throw Exception('You cannot report your own post');
    }

    final existing = await PostReport.db.findFirstRow(
      session,
      where: (t) => t.reporterId.equals(userId) & t.postId.equals(postId),
    );
    if (existing != null) throw Exception('You already reported this post');

    await PostReport.db.insertRow(
      session,
      PostReport(
        postId: postId,
        postAuthorId: post.userId,
        postAuthorName: post.authorName,
        postCaption: post.caption,
        reporterId: userId,
        reason: text,
        status: 'pending',
        createdAt: DateTime.now(),
      ),
    );
  }

  /// Admin only. Newest pending reports first.
  Future<List<PostReport>> listPending(Session session) async {
    await AuthHelpers.requireRole(session, 'admin');
    return await PostReport.db.find(
      session,
      where: (t) => t.status.equals('pending'),
      orderBy: (t) => t.createdAt.desc(),
      limit: 50,
    );
  }

  /// Admin only. action is 'dismiss' or 'remove'.
  Future<void> resolve(
    Session session, {
    required int reportId,
    required String action,
  }) async {
    await AuthHelpers.requireRole(session, 'admin');
    final adminId = session.authenticated!.userIdentifier;

    if (action != 'dismiss' && action != 'remove') {
      throw Exception('Invalid action');
    }

    final report = await PostReport.db.findById(session, reportId);
    if (report == null) throw Exception('Report not found');
    if (report.status != 'pending') return; // already handled

    final now = DateTime.now();

    if (action == 'dismiss') {
      report.status = 'dismissed';
      report.reviewedBy = adminId;
      report.reviewedAt = now;
      await PostReport.db.updateRow(session, report);
      return;
    }

    // Remove the post together with its likes and comments.
    final post = await SocialPost.db.findById(session, report.postId);
    if (post != null) {
      await PostLike.db.deleteWhere(
        session,
        where: (t) => t.postId.equals(post.id!),
      );
      await PostComment.db.deleteWhere(
        session,
        where: (t) => t.postId.equals(post.id!),
      );
      await SocialPost.db.deleteRow(session, post);
    }

    // Close every pending report about this post, not just this one.
    final related = await PostReport.db.find(
      session,
      where: (t) => t.postId.equals(report.postId) & t.status.equals('pending'),
    );
    for (final r in related) {
      r.status = 'removed';
      r.reviewedBy = adminId;
      r.reviewedAt = now;
      await PostReport.db.updateRow(session, r);
    }
  }
}
