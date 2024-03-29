import 'dart:io';

import 'package:flutter/material.dart';

Widget imagesView(BuildContext context, List<File> uploadedImages) {
  return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: uploadedImages.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(4),
          width: 50,
          height: 50,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 221, 68, 248)),
          child: uploadedImages.isNotEmpty
              ? Image.file(File(uploadedImages[index].path))
              : Container(),
        );
      });
}
