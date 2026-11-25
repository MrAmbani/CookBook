import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import 'auth_helpers.dart';

class AdminEndpoint extends Endpoint {
  /// Admin only. Everyone who has a profile, ordered by name.
  Future<List<UserProfile>> listUsers(Session session) async {
    await AuthHelpers.requireRole(session, 'admin');
    return await UserProfile.db.find(
      session,
      orderBy: (t) => t.name,
      limit: 100,
    );
  }

  /// Admin only. Changes another user's role.
  Future<UserProfile> setUserRole(
    Session session, {
    required String targetUserId,
    required String newRole,
  }) async {
    await AuthHelpers.requireRole(session, 'admin');
    final me = session.authenticated!.userIdentifier;

    if (targetUserId == me) {
      throw Exception('You cannot change your own role');
    }
    if (!['user', 'chef', 'admin'].contains(newRole)) {
      throw Exception('Invalid role: $newRole');
    }

    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(targetUserId),
    );
    if (profile == null) throw Exception('User profile not found');

    profile.role = newRole;
    return await UserProfile.db.updateRow(session, profile);
  }
}
