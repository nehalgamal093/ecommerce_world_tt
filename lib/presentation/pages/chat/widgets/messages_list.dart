import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/chat/widgets/chat_message.dart';

Widget messagesList() {
  return Column(
    children: [
      chatMessage(true, 'Hi'),
      chatMessage(false, 'Hi, How are you?'),
      chatMessage(true, 'Good, And you?')
    ],
  );
}
