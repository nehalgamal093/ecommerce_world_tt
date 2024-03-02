import 'package:flutter/material.dart';
import '../../../resources/assets_manager.dart';

Widget profilePicture(BuildContext context, String username) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            child: Image.asset(AssetsManager.cat),
          ),
          Text(
            username,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
