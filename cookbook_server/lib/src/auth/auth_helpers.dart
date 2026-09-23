import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class AuthHelpers {
  /// Throws if the current session isn't logged in, or doesn't have
  /// [requiredRole]. Call this at the top of any endpoint method that
  /// needs restricting.
  static Future<void> requireRole(Session session, String requiredRole) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) {
      throw Exception('Authentication required');
    }

    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (profile == null || profile.role != requiredRole) {
      throw Exception('Forbidden: $requiredRole role required');
    }
  }
}
