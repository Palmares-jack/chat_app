import 'package:flutter/material.dart';
import 'package:chat_app/models/chat_message_entity.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;

  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  final TextEditingController chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    final text = chatMessageController.text.trim();
    if (text.isEmpty) return;

    final newMessage = ChatMessageEntity(
      text: text,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(userName: 'poojab26'),
    );

    onSubmit(newMessage);
    chatMessageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.white),
          ),
          Expanded(
            child: TextField(
              controller: chatMessageController,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Type your message",
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onSendButtonPressed,
            icon: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
