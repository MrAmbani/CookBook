import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class SavedRecipeEndpoint extends Endpoint {
  Future<void> save(Session session, int recipeId) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) throw Exception('Authentication required');

    final existing = await SavedRecipe.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.recipeId.equals(recipeId),
    );
    if (existing != null) return; // already saved, nothing to do

    await SavedRecipe.db.insertRow(
      session,
      SavedRecipe(
        userId: userId,
        recipeId: recipeId,
        savedAt: DateTime.now(),
      ),
    );
  }

  Future<void> unsave(Session session, int recipeId) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) throw Exception('Authentication required');

    final existing = await SavedRecipe.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.recipeId.equals(recipeId),
    );
    if (existing != null) {
      await SavedRecipe.db.deleteRow(session, existing);
    }
  }

  Future<List<Recipe>> getSaved(Session session) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) throw Exception('Authentication required');

    final saved = await SavedRecipe.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );
    final recipeIds = saved.map((s) => s.recipeId).toList();
    if (recipeIds.isEmpty) return [];

    return await Recipe.db.find(
      session,
      where: (t) => t.id.inSet(recipeIds.toSet()),
    );
  }

  Future<bool> isSaved(Session session, int recipeId) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) return false;

    final existing = await SavedRecipe.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.recipeId.equals(recipeId),
    );
    return existing != null;
  }
}