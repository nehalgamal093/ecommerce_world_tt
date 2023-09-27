import 'package:flutter/material.dart';

Widget spanText(BuildContext context, String textSpan, String children,
    Color clr, Color childrenClr) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * .7,
    child: Center(
      child: RichText(
        text: TextSpan(
          text: textSpan,
          style: TextStyle(
            color: clr,
            fontSize: 14,
            height: 1.3,
          ),
          children: <TextSpan>[
            TextSpan(
              text: children,
              style: TextStyle(
                color: childrenClr,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
