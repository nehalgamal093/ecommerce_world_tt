import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

Widget reviewsBar(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Reviews',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        const Text(
          '4.0',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
        ),
        RatingBar(
          initialRating: 3.5,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          glowColor: Colors.yellow,
          itemSize: 40,
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
        const Text(
          'based on 23 reviews',
          style: TextStyle(color: ColorManager.grey, fontSize: 15),
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            const Text('Excellent'),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(4),
              width: 200,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ],
        ),
        Row(
          children: [
            const Text('Good'),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(4),
              width: 170,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 36, 250, 43),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ],
        ),
        Row(
          children: [
            const Text('Average'),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(4),
              width: 150,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(214, 232, 222, 18),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ],
        ),
        Row(
          children: [
            const Text('Below Average'),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(4),
              width: 100,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 228, 170, 8),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ],
        ),
        Row(
          children: [
            const Text('Poor'),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(4),
              width: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 229, 11, 11),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ],
        ),
      ],
    ),
  );
}
