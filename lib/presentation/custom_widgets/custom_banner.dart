import 'package:flutter/material.dart';

Widget customBanner(
    BuildContext context, String img, String title, String subTitle) {
  return Stack(
    children: [
      Opacity(
        opacity: .5,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width * .7,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    img,
                  ),
                  fit: BoxFit.fill),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
        ),
      ),
      Positioned(
        top: 20,
        left: 20,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black.withOpacity(.5),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              subTitle,
              style: TextStyle(
                  fontSize: 20.0, color: Colors.black.withOpacity(.5)),
            ),
          ],
        ),
      ),
    ],
  );
}
