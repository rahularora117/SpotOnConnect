import 'package:flutter/material.dart';
import '../../core/models/app_user.dart';

class ActivityScreen extends StatelessWidget {
  final AppUser profile;

  const ActivityScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Emma liked your profile', Icons.favorite, '2 min ago', Colors.pink),
      ('Lisa checked into Starbucks', Icons.local_cafe, '15 min ago', Colors.teal),
      ('David waved at you', Icons.waving_hand, '1 hour ago', Colors.orange),
      ('Sophia accepted your request', Icons.check_circle, 'Yesterday', Colors.green),
      ('Music Festival starts soon', Icons.celebration, 'Today', Colors.purple),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Activity')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Hi ${profile.nickname}, here is what is happening now.',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          ...items.map(
            (item) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: (item.$4 as Color).withValues(alpha: 0.15),
                  child: Icon(item.$2 as IconData, color: item.$4 as Color),
                ),
                title: Text(item.$1 as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(item.$3 as String),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}