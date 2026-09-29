import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String image;

  const ChatScreen({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

enum MessageStatus { sent, delivered, read }

class ChatMessage {
  final String text;
  final bool isMe;
  final String time;
  final MessageStatus status;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.time,
    required this.status,
  });
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isTyping = false;

  final List<ChatMessage> messages = [
    ChatMessage(text: 'Hey 👋', isMe: false, time: '10:30', status: MessageStatus.read),
    ChatMessage(text: 'Hi Emma 😊', isMe: true, time: '10:31', status: MessageStatus.read),
    ChatMessage(text: 'How are you today?', isMe: false, time: '10:32', status: MessageStatus.read),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  String _now() {
    final now = TimeOfDay.now();
    return '${now.hour}:${now.minute.toString().padLeft(2, '0')}';
  }

  void _scrollBottom() {
    Future.delayed(const Duration(milliseconds: 250), () {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 150,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  void sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add(ChatMessage(text: text, isMe: true, time: _now(), status: MessageStatus.sent));
      isTyping = true;
    });
    _messageController.clear();
    _scrollBottom();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        isTyping = false;
        messages.add(ChatMessage(text: 'Nice 😊', isMe: false, time: _now(), status: MessageStatus.read));
      });
      _scrollBottom();
    });
  }

  void _showActions(ChatMessage message) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.reply),
                title: const Text('Reply'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(this.context).showSnackBar(
                    SnackBar(content: Text('Reply to: ${message.text}')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.copy),
                title: const Text('Copy'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(this.context).showSnackBar(
                    const SnackBar(content: Text('Message copied')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('React ❤️'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(this.context).showSnackBar(
                    const SnackBar(content: Text('Reacted with ❤️')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline),
                title: const Text('Delete'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(this.context).showSnackBar(
                    const SnackBar(content: Text('Delete selected')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bubble(ChatMessage message) {
    final me = message.isMe;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      child: GestureDetector(
        onLongPress: () => _showActions(message),
        child: Align(
          alignment: me ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.all(14),
            constraints: const BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              color: me ? const Color(0xFFFF4D8D) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(blurRadius: 6, color: Colors.black12),
              ],
            ),
            child: Column(
              crossAxisAlignment: me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: TextStyle(
                    fontSize: 16,
                    color: me ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message.time,
                      style: TextStyle(
                        fontSize: 11,
                        color: me ? Colors.white70 : Colors.grey,
                      ),
                    ),
                    if (me) ...[
                      const SizedBox(width: 4),
                      Icon(
                        message.status == MessageStatus.read ? Icons.done_all : Icons.done,
                        size: 15,
                        color: message.status == MessageStatus.read ? Colors.lightBlueAccent : Colors.white70,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: Row(
          children: [
            Hero(
              tag: widget.image,
              child: CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(widget.image),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 2),
                  const Row(
                    children: [
                      Icon(Icons.circle, size: 10, color: Colors.green),
                      SizedBox(width: 6),
                      Text('Online', style: TextStyle(fontSize: 12, color: Colors.green)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          PopupMenuButton(
            itemBuilder: (_) => const [
              PopupMenuItem(value: 1, child: Text('View Profile')),
              PopupMenuItem(value: 2, child: Text('Search')),
              PopupMenuItem(value: 3, child: Text('Mute')),
              PopupMenuItem(value: 4, child: Text('Block')),
              PopupMenuItem(value: 5, child: Text('Report')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) => _bubble(messages[index]),
            ),
          ),
          if (isTyping)
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Emma is typing...',
                  style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                ),
              ),
            ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle_outline)),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      onSubmitted: (_) => sendMessage(),
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.emoji_emotions_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
                  FloatingActionButton.small(
                    heroTag: 'send',
                    backgroundColor: const Color(0xFFFF4D8D),
                    onPressed: sendMessage,
                    child: const Icon(Icons.send),
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