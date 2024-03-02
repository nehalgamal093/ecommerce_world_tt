import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';

topBar(String title, bool isBack, BuildContext context, bool centerTitle,
    bool isChat) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        title: Row(
          children: [
            isChat
                ? const ImageIcon(AssetImage(AssetsManager.chat))
                : Container(),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
        leading: isBack
            ? InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back))
            : const SizedBox(),
        centerTitle: centerTitle,
      ),
    ),
  );
}
