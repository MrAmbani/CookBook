import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import 'auth_helpers.dart';

class AdminEndpoint extends Endpoint {
  /// Changes another user's role. Caller must already be an admin.
  Future<UserProfile> setUserRole(
    Session session, {
    required String targetUserId,
    required String newRole,
  }) async {
    await AuthHelpers.requireRole(session, 'admin');

    if (!['user', 'chef', 'admin'].contains(newRole)) {
      throw Exception('Invalid role: $newRole');
    }

    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(targetUserId),
    );
    if (profile == null) {
      throw Exception('User profile not found');
    }

    profile.role = newRole;
    return await UserProfile.db.updateRow(session, profile);
  }
}