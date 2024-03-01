import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../Services/add_review.dart';
import '../../resources/color_manager.dart';

// ignore: must_be_immutable
class WriteReviewPage extends StatelessWidget {
  final String id;
  WriteReviewPage({super.key, required this.id});
  double? rate;
  final TextEditingController reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 15),
                        )),
                    const Text(
                      'Write a Review',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () async {
                          await Post()
                              .postReview(reviewController.text, rate!, id);

                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Send',
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 50),
              RatingBar(
                initialRating: 3.5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                glowColor: Colors.yellow,
                itemSize: 50,
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star, color: Colors.yellow[500]),
                  half: Icon(Icons.star_half, color: Colors.yellow[500]),
                  empty: Icon(Icons.star_border_outlined,
                      color: Colors.yellow[500]),
                ),
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {
                  rate = rating;
                  // print(rating);
                },
              ),
              const SizedBox(height: 10),
              TextField(
                controller: reviewController,
                maxLines: 8,
                decoration: const InputDecoration(
                  hintText: 'Write Review',
                  hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: ColorManager.medGrey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
