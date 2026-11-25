import 'package:flutter/material.dart';
import 'package:cookbook_client/cookbook_client.dart';
import '../client.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  List<UserProfile> _users = [];
  String? _myUserId;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final me = await client.profile.getProfile();
      final users = await client.admin.listUsers();
      if (!mounted) return;
      setState(() {
        _myUserId = me.userId;
        _users = users;
      });
    } catch (e) {
      _showMessage('Could not load users: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _changeRole(UserProfile user) async {
    final newRole = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Role for ${user.name}'),
        children: [
          for (final role in const ['user', 'chef', 'admin'])
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, role),
              child: Text(
                role == user.role ? '$role (current)' : role,
                style: TextStyle(
                  fontWeight:
                      role == user.role ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
        ],
      ),
    );
    if (newRole == null || newRole == user.role) return;

    try {
      final updated = await client.admin
          .setUserRole(targetUserId: user.userId, newRole: newRole);
      if (!mounted) return;
      setState(() {
        final i = _users.indexWhere((u) => u.userId == updated.userId);
        if (i != -1) _users[i] = updated;
      });
      _showMessage('${updated.name} is now ${updated.role}');
    } catch (e) {
      _showMessage('Could not change role: $e');
    }
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Users')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _load,
              child: _users.isEmpty
                  ? ListView(
                      children: const [
                        SizedBox(height: 120),
                        Center(child: Text('No users found.')),
                      ],
                    )
                  : ListView.builder(
                      itemCount: _users.length,
                      itemBuilder: (context, i) {
                        final u = _users[i];
                        final isMe = u.userId == _myUserId;
                        return ListTile(
                          leading: const CircleAvatar(child: Icon(Icons.person)),
                          title: Text(isMe ? '${u.name} (you)' : u.name),
                          subtitle: Text('Role: ${u.role}'),
                          trailing: isMe ? null : const Icon(Icons.edit),
                          onTap: isMe ? null : () => _changeRole(u),
                        );
                      },
                    ),
            ),
    );
  }
}