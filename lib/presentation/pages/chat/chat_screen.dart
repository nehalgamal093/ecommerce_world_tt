import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/custom_widgets/top_bar.dart';
import 'package:world_commerce/presentation/pages/chat/widgets/message_input.dart';
import 'package:world_commerce/presentation/pages/chat/widgets/messages_list.dart';

import '../../resources/assets_manager.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar('Chat', true, context, true, true),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.chat_background),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [Expanded(child: messagesList()), messageInput(context)],
        ),
      ),
    );
  }
}
