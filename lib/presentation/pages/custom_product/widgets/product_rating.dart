import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget productRating(String productRating) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      RatingBar(
        initialRating: 2,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        glowColor: Colors.yellow,
        itemSize: 15,
        ratingWidget: RatingWidget(
          full: Icon(Icons.star, color: Colors.yellow[500]),
          half: Icon(Icons.star_half, color: Colors.yellow[500]),
          empty: Icon(Icons.star_border_outlined, color: Colors.yellow[500]),
        ),
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        onRatingUpdate: (rating) {
          // print(rating);
        },
      ),
      const SizedBox(width: 5),
      Text(productRating)
    ],
  );
}
//30✅