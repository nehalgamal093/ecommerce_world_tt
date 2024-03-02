import 'package:flutter/material.dart';

Widget messageInput(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width * .80,
          child: TextField(
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromARGB(255, 194, 194, 194)),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromARGB(255, 194, 194, 194)),
                    borderRadius: BorderRadius.circular(20)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromARGB(255, 194, 194, 194)),
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
        const SizedBox(width: 10),
        CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.send_rounded))),
      ],
    ),
  );
}
