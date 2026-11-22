import 'package:flutter/material.dart';
import 'package:cookbook_client/cookbook_client.dart';
import '../client.dart';

class UserProfileScreen extends StatefulWidget {
  final String userId;
  const UserProfileScreen({super.key, required this.userId});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  UserSummary? _summary;
  bool _loading = true;
  bool _busy = false;
  bool _loggedIn = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final summary = await client.follow.getUserSummary(widget.userId);
      var loggedIn = false;
      try {
        await client.profile.getProfile();
        loggedIn = true;
      } catch (_) {
        // Guest.
      }
      if (!mounted) return;
      setState(() {
        _summary = summary;
        _loggedIn = loggedIn;
      });
    } catch (e) {
      _showError('Could not load profile: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _toggleFollow() async {
    final summary = _summary;
    if (summary == null) return;
    setState(() => _busy = true);
    try {
      final following = await client.follow.toggle(summary.userId);
      if (!mounted) return;
      setState(() {
        summary.followedByMe = following;
        summary.followerCount += following ? 1 : -1;
      });
    } catch (e) {
      _showError('Could not update follow: $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _stat(String label, int value) {
    return Column(
      children: [
        Text(
          '$value',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final summary = _summary;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : summary == null
              ? const Center(child: Text('User not found.'))
              : Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 36,
                        child: Icon(Icons.person, size: 36),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        summary.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(summary.role,
                          style: const TextStyle(color: Colors.grey)),
                      if (summary.bio != null && summary.bio!.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(summary.bio!),
                      ],
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _stat('Followers', summary.followerCount),
                          _stat('Following', summary.followingCount),
                        ],
                      ),
                      const SizedBox(height: 24),
                      if (summary.isMe)
                        const Text('This is you.')
                      else if (!_loggedIn)
                        const Text('Log in to follow this user.')
                      else
                        SizedBox(
                          width: double.infinity,
                          child: summary.followedByMe
                              ? OutlinedButton(
                                  onPressed: _busy ? null : _toggleFollow,
                                  child: const Text('Unfollow'),
                                )
                              : ElevatedButton(
                                  onPressed: _busy ? null : _toggleFollow,
                                  child: const Text('Follow'),
                                ),
                        ),
                    ],
                  ),
                ),
    );
  }
}