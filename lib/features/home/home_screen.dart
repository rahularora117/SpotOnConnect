// lib/features/home/home_screen.dart
import 'package:flutter/material.dart';
import '../chat/chat_screen.dart';
import '../profile/profile_screen.dart';
import '../radar/radar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _openRadar() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const RadarScreen()));
  }

  void _openChats() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ChatScreen(
          name: 'Emma',
          image: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=800',
        ),
      ),
    );
  }

  void _openProfile() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'SpotOn Connect',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.language),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1E153D),
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meet. Connect. Belong.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Made in Germany 🇩🇪',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 14),
                Text(
                  'Good Evening, Rahul 👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Stuttgart, Germany',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search people, places or events...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF1E153D),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _ActionPill(label: 'Radar', icon: Icons.radar, onTap: _openRadar),
                _ActionPill(label: 'Chats', icon: Icons.chat, onTap: _openChats),
                _ActionPill(label: 'Venues', icon: Icons.location_on, onTap: _openRadar),
                _ActionPill(label: 'Events', icon: Icons.celebration, onTap: _openRadar),
                _ActionPill(label: 'Profile', icon: Icons.person, onTap: _openProfile),
                _ActionPill(label: 'How it works', icon: Icons.help_outline, onTap: _openRadar),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Nearby people',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),
          _PersonRow(
            name: 'Emma',
            age: '24',
            distance: '180 m',
            status: 'Open to dating',
            image: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=800',
            onConnect: () {},
            onChat: _openChats,
            onProfile: _openProfile,
          ),
          _PersonRow(
            name: 'Liam',
            age: '29',
            distance: '320 m',
            status: 'Networking',
            image: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=800',
            onConnect: () {},
            onChat: _openChats,
            onProfile: _openProfile,
          ),
          const SizedBox(height: 24),
          const Text(
            'Nearby places',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),
          _PlaceTile(title: 'The Copper Fox', subtitle: 'Checked-in venue • 8 here', onTap: _openRadar),
          _PlaceTile(title: 'Starbucks', subtitle: 'Cafe • 12 here', onTap: _openRadar),
          const SizedBox(height: 24),
          const Text(
            'Nearby events',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),
          _PlaceTile(title: 'Vinyl Night', subtitle: 'Tonight • 120 going', onTap: _openRadar),
          _PlaceTile(title: 'Coffee Meetup', subtitle: 'Tomorrow • 42 going', onTap: _openRadar),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF1E153D),
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How it works',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '1. Create a verified profile\n2. Check in to a venue\n3. Choose your social mode\n4. Discover people nearby\n5. Wave, like or chat\n6. Meet if it is mutual',
                  style: TextStyle(color: Colors.white70, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionPill extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _ActionPill({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonRow extends StatelessWidget {
  final String name;
  final String age;
  final String distance;
  final String status;
  final String image;
  final VoidCallback onConnect;
  final VoidCallback onChat;
  final VoidCallback onProfile;

  const _PersonRow({
    required this.name,
    required this.age,
    required this.distance,
    required this.status,
    required this.image,
    required this.onConnect,
    required this.onChat,
    required this.onProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(image)),
        title: Text('$name, $age'),
        subtitle: Text('$distance • $status'),
        trailing: Wrap(
          spacing: 6,
          children: [
            IconButton(onPressed: onConnect, icon: const Icon(Icons.favorite)),
            IconButton(onPressed: onChat, icon: const Icon(Icons.chat)),
            IconButton(onPressed: onProfile, icon: const Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}

class _PlaceTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _PlaceTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: const CircleAvatar(child: Icon(Icons.place)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}