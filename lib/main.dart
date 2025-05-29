import 'package:flutter/material.dart';
import 'package:chat_app/counter_stateful_demo.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/chat_page.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat App!!!',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
        ),
      ),
      // Pick one home:
      // home: CounterStateful(buttonColor: Colors.blue),
      // home: const LoginPage(),
      home: const ChatPage(),
    );
  }
}
