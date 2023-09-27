import 'package:flutter/material.dart';

topBar(String title, bool isBack, BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: Colors.white,
        title: Text(title),
        leading: isBack
            ? InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back))
            : const SizedBox(),
        centerTitle: true,
      ),
    ),
  );
}
