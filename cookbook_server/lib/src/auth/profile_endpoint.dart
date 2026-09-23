import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ProfileEndpoint extends Endpoint {
  /// Returns the logged-in user's profile. Creates a default one
  /// (role: 'user') on first call if none exists yet.
  Future<UserProfile> getProfile(Session session) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) {
      throw Exception('Authentication required');
    }

    var profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    profile ??= await UserProfile.db.insertRow(
      session,
      UserProfile(
        userId: userId,
        name: 'New User',
        role: 'user',
        createdAt: DateTime.now(),
      ),
    );

    return profile;
  }

  /// Updates the caller's own name and bio only. Role and userId can't
  /// be changed here — that's intentional.
  Future<UserProfile> updateProfile(
    Session session, {
    required String name,
    String? bio,
  }) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) {
      throw Exception('Authentication required');
    }

    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
    if (profile == null) {
      throw Exception('Profile not found');
    }

    profile.name = name;
    profile.bio = bio;

    return await UserProfile.db.updateRow(session, profile);
  }
}