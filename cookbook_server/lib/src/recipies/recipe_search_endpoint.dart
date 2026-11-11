import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class RecipeSearchEndpoint extends Endpoint {
  /// Case-insensitive search on recipe title.
  Future<List<Recipe>> search(Session session, String query) async {
    final q = query.trim();
    if (q.isEmpty) return [];
    return await Recipe.db.find(
      session,
      where: (t) => t.title.ilike('%$q%'),
      orderBy: (t) => t.title,
      limit: 30,
    );
  }
}
