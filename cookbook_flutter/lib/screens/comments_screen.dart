import 'package:flutter/material.dart';
import 'package:cookbook_client/cookbook_client.dart';
import '../client.dart';

class CommentsScreen extends StatefulWidget {
  final int postId;
  const CommentsScreen({super.key, required this.postId});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final _controller = TextEditingController();
  List<PostComment> _comments = [];
  UserProfile? _me; // null for guests
  bool _loading = true;
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    _loadMe();
    _load();
  }

  Future<void> _loadMe() async {
    try {
      final me = await client.profile.getProfile();
      if (!mounted) return;
      setState(() => _me = me);
    } catch (_) {
      // Guest: can read, cannot comment.
    }
  }

  Future<void> _load() async {
    try {
      final comments = await client.comment.getComments(widget.postId);
      if (!mounted) return;
      setState(() => _comments = comments);
    } catch (e) {
      _showError('Could not load comments: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() => _sending = true);
    try {
      await client.comment.add(postId: widget.postId, text: text);
      _controller.clear();
      await _load();
    } catch (e) {
      _showError('Could not post comment: $e');
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _delete(PostComment comment) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete comment?'),
        content: const Text('This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      await client.comment.delete(comment.id!);
      if (!mounted) return;
      setState(() => _comments.remove(comment));
    } catch (e) {
      _showError('Could not delete: $e');
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  bool _canDelete(PostComment c) =>
      _me != null && (_me!.userId == c.userId || _me!.role == 'admin');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comments')),
      body: Column(
        children: [
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _comments.isEmpty
                    ? const Center(child: Text('No comments yet.'))
                    : ListView.builder(
                        itemCount: _comments.length,
                        itemBuilder: (context, i) {
                          final c = _comments[i];
                          return ListTile(
                            title: Text(c.authorName),
                            subtitle: Text(c.text),
                            trailing: _canDelete(c)
                                ? IconButton(
                                    icon: const Icon(Icons.delete_outline),
                                    onPressed: () => _delete(c),
                                  )
                                : null,
                          );
                        },
                      ),
          ),
          if (_me == null)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Log in to comment.'),
            )
          else
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        maxLength: 300,
                        decoration: const InputDecoration(
                          hintText: 'Add a comment...',
                          counterText: '',
                        ),
                        onSubmitted: (_) => _send(),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: _sending ? null : _send,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}