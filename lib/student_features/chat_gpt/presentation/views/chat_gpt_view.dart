import 'package:flutter/material.dart';

import '../widgets/chat_gpt_view_body.dart';

class ChatGPTView extends StatelessWidget {
  const ChatGPTView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: ChatGPTViewBody()),
    );
  }
}
