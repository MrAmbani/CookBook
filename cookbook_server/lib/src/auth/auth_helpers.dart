import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class AuthHelpers {
  /// Throws unless the caller is logged in and has exactly [requiredRole].
  static Future<void> requireRole(Session session, String requiredRole) async {
    await requireAnyRole(session, [requiredRole]);
  }

  /// Throws unless the caller is logged in and has one of [roles].
  /// Returns the caller's profile so endpoints don't look it up again.
  static Future<UserProfile> requireAnyRole(
    Session session,
    List<String> roles,
  ) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) {
      throw Exception('Authentication required');
    }

    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (profile == null || !roles.contains(profile.role)) {
      throw Exception('Forbidden: ${roles.join(' or ')} role required');
    }
    return profile;
  }
}
