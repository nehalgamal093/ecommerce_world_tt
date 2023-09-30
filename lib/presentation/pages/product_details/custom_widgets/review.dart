import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget review(String username, String comment) {
  return Column(
    children: [
      const Divider(),
      const SizedBox(height: 10),
      Row(
        children: [
          CircleAvatar(
            radius: 20,
            child: Image.asset('assets/images/cat.png'),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Text(username),
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
                  empty: Icon(Icons.star_border_outlined,
                      color: Colors.yellow[500]),
                ),
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {
                  // print(rating);
                },
              )
            ],
          )
        ],
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Align(alignment: Alignment.centerLeft, child: Text(comment)),
      ),
      const SizedBox(height: 10),
    ],
  );
}
