import 'package:flutter/material.dart';
import 'package:world_commerce/models/review.dart';
import 'package:world_commerce/models/reviews.dart';

import 'package:world_commerce/presentation/pages/product_details/custom_widgets/reviews_bar.dart';
import 'package:world_commerce/presentation/pages/write_review_page/write_review_page.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

import '../../../Services/get_reviews.dart';
import 'custom_widgets/review.dart';

class ProductDetails extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final String id;

  const ProductDetails(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  width: 350,
                  height: 400,
                  child: Image.network(image)),
              const SizedBox(height: 50.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.visible,
                          ),
                          const Icon(Icons.star, color: Colors.yellow)
                        ],
                      ),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 14),
                      ),
                      Row(
                        children: [
                          const Text('Available Colors: '),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 200,
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 10,
                                ),
                                SizedBox(width: 5),
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 10,
                                ),
                                SizedBox(width: 5),
                                CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      reviewsBar(context),
                      FutureBuilder<ReviewsList>(
                          future: Reviews().getReviews(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var reviews = snapshot.data!.reviews!
                                  .where((e) => e.productId == id)
                                  .toList();
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: reviews.length,
                                  itemBuilder: (context, index) {
                                    return review(
                                        reviews[index].userReview!.name!,
                                        reviews[index].comment!);
                                  });
                            } else {
                              return CircularProgressIndicator();
                            }
                          }),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WriteReviewPage(
                                id: id,
                              ),
                            ),
                          );
                        },
                        child: Center(
                          child: Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 210, 207, 207),
                                border: Border.all(color: Colors.black)),
                            child: const Center(
                              child: Text('Write a review'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ]),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
        child: BottomAppBar(
          color: Colors.white,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              price,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: ColorManager.lightGrey,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const Row(
                children: [
                  Icon(Icons.shopping_cart_outlined),
                  Text('Add To Cart'),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
