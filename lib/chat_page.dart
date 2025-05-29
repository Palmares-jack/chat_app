import 'package:flutter/material.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  final String username;
  const ChatPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout, color: Colors.black),
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
                alignment:
                i.isEven ? Alignment.centerLeft : Alignment.centerRight,
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
