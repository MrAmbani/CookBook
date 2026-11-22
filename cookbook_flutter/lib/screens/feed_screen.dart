import 'package:flutter/material.dart';
import 'package:cookbook_client/cookbook_client.dart';
import '../client.dart';
import 'create_post_screen.dart';
import 'comments_screen.dart';
import 'user_profile_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  static const _pageSize = 20;
  final List<FeedItem> _items = [];
  UserProfile? _me; // null for guests
  bool _loading = true;
  bool _hasMore = false;

  @override
  void initState() {
    super.initState();
    _loadMe();
    _refresh();
  }

  Future<void> _loadMe() async {
    try {
      final me = await client.profile.getProfile();
      if (!mounted) return;
      setState(() => _me = me);
    } catch (_) {
      // Guest: no delete buttons, likes ask to log in.
    }
  }

  Future<void> _refresh() async {
    setState(() => _loading = true);
    try {
      final page = await client.post.getFeed(offset: 0, limit: _pageSize);
      if (!mounted) return;
      setState(() {
        _items
          ..clear()
          ..addAll(page);
        _hasMore = page.length == _pageSize;
      });
    } catch (e) {
      _showError('Could not load feed: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _loadMore() async {
    try {
      final page =
          await client.post.getFeed(offset: _items.length, limit: _pageSize);
      if (!mounted) return;
      setState(() {
        _items.addAll(page);
        _hasMore = page.length == _pageSize;
      });
    } catch (e) {
      _showError('Could not load more: $e');
    }
  }

  Future<void> _toggleLike(FeedItem item) async {
    if (_me == null) {
      _showError('Log in to like posts');
      return;
    }
    try {
      final liked = await client.like.toggle(item.post.id!);
      if (!mounted) return;
      setState(() {
        item.likedByMe = liked;
        item.likeCount += liked ? 1 : -1;
      });
    } catch (e) {
      _showError('Could not update like: $e');
    }
  }

  /// Asks for confirmation first. Returns true only if the user taps Delete.
  Future<bool> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete post?'),
        content: const Text('This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
    return confirmed == true;
  }

  Future<void> _delete(FeedItem item) async {
    final confirmed = await _confirmDelete();
    if (!confirmed) return;

    try {
      await client.post.deletePost(item.post.id!);
      if (!mounted) return;
      setState(() => _items.remove(item));
    } catch (e) {
      _showError('Could not delete: $e');
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  bool _canDelete(SocialPost post) =>
      _me != null && (_me!.userId == post.userId || _me!.role == 'admin');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final posted = await Navigator.push<bool>(
            context,
            MaterialPageRoute(builder: (_) => const CreatePostScreen()),
          );
          if (posted == true) _refresh();
        },
      ),
      body: _loading && _items.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _refresh,
              child: _items.isEmpty
                  ? ListView(
                      children: const [
                        SizedBox(height: 120),
                        Center(child: Text('No posts yet. Be the first!')),
                      ],
                    )
                  : ListView.builder(
                      itemCount: _items.length + (_hasMore ? 1 : 0),
                      itemBuilder: (context, i) {
                        if (i == _items.length) {
                          return TextButton(
                            onPressed: _loadMore,
                            child: const Text('Load more'),
                          );
                        }
                        final item = _items[i];
                        final post = item.post;
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: InkWell(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => UserProfileScreen(
                                                  userId: post.userId),
                                            ),
                                          ),
                                          child: Text(
                                            post.authorName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (_canDelete(post))
                                      IconButton(
                                        icon: const Icon(Icons.delete_outline),
                                        onPressed: () => _delete(item),
                                      ),
                                  ],
                                ),
                                Text(
                                  post.createdAt
                                      .toLocal()
                                      .toString()
                                      .substring(0, 16),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                const SizedBox(height: 8),
                                Text(post.caption),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        item.likedByMe
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: item.likedByMe
                                            ? Colors.red
                                            : null,
                                      ),
                                      onPressed: () => _toggleLike(item),
                                    ),
                                    Text('${item.likeCount}'),
                                    IconButton(
                                      icon: const Icon(Icons.comment_outlined),
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              CommentsScreen(postId: post.id!),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
    );
  }
}