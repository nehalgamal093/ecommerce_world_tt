import 'package:flutter/material.dart';

Widget customButton(
  String label,
  bool isNext,
) {
  return Container(
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 101, 47, 114),
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    ),
    width: 90,
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        isNext
            ? Container()
            : CircleAvatar(
                radius: 15,
                child: Align(
                    alignment:
                        isNext ? Alignment.centerLeft : Alignment.centerRight,
                    child: const Icon(Icons.arrow_back))),
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        isNext
            ? CircleAvatar(
                radius: 15,
                child: Align(
                    alignment:
                        isNext ? Alignment.centerLeft : Alignment.centerRight,
                    child: const Icon(Icons.arrow_forward)))
            : Container(),
      ],
    ),
  );
}
