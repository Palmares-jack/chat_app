import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  ChatInput({Key? key}) : super(key: key);

  void _send() {
    debugPrint('ChatMessage: ${_controller.text}');
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // TODO: add attachment
            },
            icon: const Icon(Icons.add, color: Colors.white),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Type your message',
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: _send,
            icon: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
