import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class FollowEndpoint extends Endpoint {
  /// Public info about a user plus follower counts. Guests can read it.
  Future<UserSummary> getUserSummary(Session session, String userId) async {
    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
    if (profile == null) throw Exception('User not found');

    final me = session.authenticated?.userIdentifier;

    final followers = await UserFollow.db.count(
      session,
      where: (t) => t.followingId.equals(userId),
    );
    final following = await UserFollow.db.count(
      session,
      where: (t) => t.followerId.equals(userId),
    );

    var followedByMe = false;
    if (me != null && me != userId) {
      final existing = await UserFollow.db.findFirstRow(
        session,
        where: (t) => t.followerId.equals(me) & t.followingId.equals(userId),
      );
      followedByMe = existing != null;
    }

    return UserSummary(
      userId: userId,
      name: profile.name,
      bio: profile.bio,
      role: profile.role,
      followerCount: followers,
      followingCount: following,
      followedByMe: followedByMe,
      isMe: me == userId,
    );
  }

  /// Follows the user if you don't, unfollows if you do.
  /// Returns true if you are now following them.
  Future<bool> toggle(Session session, String targetUserId) async {
    final me = session.authenticated?.userIdentifier;
    if (me == null) throw Exception('Authentication required');
    if (me == targetUserId) throw Exception('You cannot follow yourself');

    final target = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(targetUserId),
    );
    if (target == null) throw Exception('User not found');

    final existing = await UserFollow.db.findFirstRow(
      session,
      where: (t) =>
          t.followerId.equals(me) & t.followingId.equals(targetUserId),
    );

    if (existing != null) {
      await UserFollow.db.deleteRow(session, existing);
      return false;
    }

    await UserFollow.db.insertRow(
      session,
      UserFollow(
        followerId: me,
        followingId: targetUserId,
        createdAt: DateTime.now(),
      ),
    );
    return true;
  }
}
