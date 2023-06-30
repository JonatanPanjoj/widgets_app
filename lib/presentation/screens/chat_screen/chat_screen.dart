import 'package:flutter/material.dart';
import 'package:widgets_app/config/constants/environment.dart';

class ChatScreen extends StatelessWidget {

  static const name = 'chat-screen';

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: Center(
        child: Text(Environment.gptKey),
      ),
    );
  }
}