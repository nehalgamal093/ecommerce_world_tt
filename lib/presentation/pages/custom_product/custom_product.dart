import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:world_commerce/bloc/like_bloc/like_bloc.dart';

class CustomProduct extends StatefulWidget {
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
  State<CustomProduct> createState() => _CustomProductState();
}

class _CustomProductState extends State<CustomProduct> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.all(8),
          child: SizedBox(
            width: 230.0,
            height: 300,
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
                  child: Image.network(widget.imgCover, fit: BoxFit.contain),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  '${widget.price} \$',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
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
                    Text(widget.ratingAvg)
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 13,
          right: 13,
          child: IconButton(
              onPressed: () {
                context.read<LikeBloc>().add(FavoriteEvent());
              },
              icon: context.watch<LikeBloc>().state.favProductStatus ==
                      FavoriteStatus.favorite
                  ? const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.grey,
                    )
                  : const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
        )
      ],
    );
  }
}
