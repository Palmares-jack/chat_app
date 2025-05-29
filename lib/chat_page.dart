import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  Widget _buildMessage({
    required String message,
    required String imageUrl,
    required bool isSender,
  }) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Image.network(imageUrl, height: 200),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Hi Mark!', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {
              print('Logout pressed');
            },
            icon: const Icon(Icons.logout, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 10),
              children: [
                _buildMessage(
                  message: 'Hi this is your message!',
                  imageUrl: 'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
                  isSender: false,
                ),
                _buildMessage(
                  message: 'Reply from sender!',
                  imageUrl: 'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
                  isSender: true,
                ),
                _buildMessage(
                  message: 'Another message!',
                  imageUrl: 'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
                  isSender: true,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    print('Add pressed');
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print('Send pressed');
                  },
                  icon: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
