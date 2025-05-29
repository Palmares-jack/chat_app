import 'package:flutter/material.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
      author: Author(userName: 'pooja'),
      createdAt: 2131231242,
      id: '1',
      text: 'First text',
    ),
    ChatMessageEntity(
      author: Author(userName: 'pooja'),
      createdAt: 2131231442,
      id: '2',
      text: 'Second text',
      imageUrl: 'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
    ),
    ChatMessageEntity(
      author: Author(userName: 'jane'),
      createdAt: 2131234242,
      id: '3',
      text: 'Third text',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text('Hi $username!')),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
              print('Logout pressed!');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatBubble(
                  alignment: message.author.userName == 'pooja'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  entity: message,
                );
              },
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
