import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/chat_message_entity.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/chat_input.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessageEntity> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadInitialMessages();
  }

  Future<void> _loadInitialMessages() async {
    final response = await rootBundle.loadString('assets/mock_messages.json');
    final List<dynamic> decodeList = jsonDecode(response) as List;

    final chatMessages = decodeList.map((item) {
      return ChatMessageEntity.fromJson(item);
    }).toList();

    setState(() {
      _messages = chatMessages;
    });
  }

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
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ChatBubble(
                  alignment: msg.author.userName == username
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  entity: msg,
                );
              },
            ),
          ),
          const ChatInput(),
        ],
      ),
    );
  }
}
