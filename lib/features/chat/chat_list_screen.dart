import 'package:flutter/material.dart';
import '../../core/models/app_user.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  final AppUser profile;

  const ChatListScreen({super.key, required this.profile});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final _searchController = TextEditingController();

  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Emma',
      'message': 'Hey 👋 How are you?',
      'time': '2 min',
      'online': true,
      'unread': 2,
      'image': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500',
    },
    {
      'name': 'Sophia',
      'message': 'Let us meet for coffee ☕',
      'time': '10 min',
      'online': true,
      'unread': 1,
      'image': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=500',
    },
    {
      'name': 'David',
      'message': 'See you tomorrow!',
      'time': 'Yesterday',
      'online': false,
      'unread': 0,
      'image': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500',
    },
    {
      'name': 'Lisa',
      'message': 'Nice meeting you 😊',
      'time': 'Yesterday',
      'online': true,
      'unread': 5,
      'image': 'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?w=500',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final results = chats.where((chat) {
      final q = _searchController.text.trim().toLowerCase();
      if (q.isEmpty) return true;
      return chat['name'].toString().toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Chats • ${widget.profile.nickname}'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF4D8D),
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search conversations...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final chat = results[index];
                return ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(chat['image']),
                      ),
                      if (chat['online'])
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: Text(chat['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(chat['message']),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(chat['time'], style: const TextStyle(fontSize: 12)),
                      const SizedBox(height: 6),
                      if ((chat['unread'] as int) > 0)
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: const Color(0xFFFF4D8D),
                          child: Text(
                            '${chat['unread']}',
                            style: const TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(
                          name: chat['name'],
                          image: chat['image'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}