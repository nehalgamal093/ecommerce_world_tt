import 'package:flutter/material.dart';

Widget spanText(BuildContext context, String textSpan, String children,
    Color clr, Color childrenClr) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * .7,
    child: Center(
      child: RichText(
        text: TextSpan(
          text: textSpan,
          style: Theme.of(context).textTheme.bodyMedium,
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
