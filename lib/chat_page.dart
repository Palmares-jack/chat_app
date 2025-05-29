import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

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
    onPressed: () {
    Navigator.pushReplacementNamed(context, '/');
    print('Logout icon pressed!');
    },
    icon: Icon(Icons.logout),
    ),
    ],
    ),
    body: Column(
    children: [
    Expanded(
    child: ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
    return ChatBubble(
    entity: ChatMessageEntity(
    id: 'msg_$index',
    text: index % 2 == 0
    ? "Hello, this is Ivan!"
        : "Hello, this is Mark!!!",
    createdAt: DateTime.now().millisecondsSinceEpoch,
    a
