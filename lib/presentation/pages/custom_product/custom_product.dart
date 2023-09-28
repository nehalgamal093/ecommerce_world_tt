import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomProduct extends StatelessWidget {
  final String title;
  final String imgCover;
  final String price;
  final String ratingAvg;
  const CustomProduct(
      {super.key,
      required this.title,
      required this.imgCover,
      required this.price,
      required this.ratingAvg});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 250.0,
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Image.network(imgCover, fit: BoxFit.contain),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Text(
                '$price \$',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
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
                      empty: Icon(Icons.star_border_outlined,
                          color: Colors.yellow[500]),
                    ),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      // print(rating);
                    },
                  ),
                  const SizedBox(width: 5),
                  Text(ratingAvg)
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 13,
          right: 13,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.red[300],
            child: const ImageIcon(
              AssetImage('assets/images/heart.png'),
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
