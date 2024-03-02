import 'package:flutter/material.dart';
import '../../../../utils/capitalize.dart';
import '../../../resources/assets_manager.dart';

Widget accountHeader(BuildContext context, String username) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Center(
      child: Column(
        children: [
          CircleAvatar(radius: 60, child: Image.asset(AssetsManager.cat)),
          Text(
            capitalizeName(username),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
//21✅