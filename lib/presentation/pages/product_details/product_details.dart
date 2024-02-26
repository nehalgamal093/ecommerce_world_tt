import 'package:flutter/material.dart';
import 'package:world_commerce/models/reviews.dart';
import 'package:world_commerce/presentation/pages/product_details/custom_widgets/reviews_bar.dart';
import 'package:world_commerce/presentation/pages/write_review_page/write_review_page.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';
import '../../../Services/add_to_cart.dart';
import '../../../Services/get_reviews.dart';
import '../../../generated/l10n.dart';
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
              SizedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: SizedBox(
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
                              Text(S.of(context).availableColors),
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
                                  return const CircularProgressIndicator();
                                }
                              }),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WriteReviewPage(
                                        id: id,
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text(S.of(context).writeReview),
                                )),
                          ),
                          const SizedBox(height: 20),
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () async {
          try {
            await AddProductToCart().addToCart(id);
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Product has been added to your Cart"),
            ));
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Something went wrong"),
            ));
          }
        },
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                        color: ColorManager.whiteMain,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(S.of(context).addToCart,
                          style: const TextStyle(
                            color: ColorManager.whiteMain,
                            fontSize: 20,
                          )),
                      const SizedBox(width: 5),
                      const Icon(Icons.shopping_cart_outlined,
                          color: ColorManager.whiteMain),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
//194