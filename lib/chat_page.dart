import 'package:flutter/material.dart';
import 'package:chat_app/chat_bubble.dart';
import 'package:chat_app/chat_input.dart';

class ChatPage extends StatelessWidget {
  final String username;

  const ChatPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (_, i) => ChatBubble(
                alignment: i.isEven
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                message: 'Hello, this is Ivan!',
              ),
            ),
          ),
          const ChatInput(),
        ],
      ),
    );
  }
}
