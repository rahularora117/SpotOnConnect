import 'package:flutter/material.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  bool visibleOnRadar = true;
  bool ghostMode = false;
  bool hideDistance = false;
  bool verifiedOnly = false;
  bool allowChats = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Safety & privacy')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Who sees you',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            value: visibleOnRadar,
            onChanged: (v) => setState(() => visibleOnRadar = v),
            title: const Text('Visible on radar'),
            subtitle: const Text('Show up to nearby users'),
          ),
          SwitchListTile(
            value: ghostMode,
            onChanged: (v) => setState(() => ghostMode = v),
            title: const Text('Ghost mode'),
            subtitle: const Text('Hide your presence until you choose to show'),
          ),
          SwitchListTile(
            value: hideDistance,
            onChanged: (v) => setState(() => hideDistance = v),
            title: const Text('Hide exact distance'),
            subtitle: const Text('Show approximate distance only'),
          ),
          SwitchListTile(
            value: verifiedOnly,
            onChanged: (v) => setState(() => verifiedOnly = v),
            title: const Text('Verified people only'),
            subtitle: const Text('Only verified users can see you'),
          ),
          SwitchListTile(
            value: allowChats,
            onChanged: (v) => setState(() => allowChats = v),
            title: const Text('Allow chats'),
            subtitle: const Text('Let nearby users send you messages'),
          ),
        ],
      ),
    );
  }
}