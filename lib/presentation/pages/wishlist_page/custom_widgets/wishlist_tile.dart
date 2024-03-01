import 'package:flutter/material.dart';

class WishListTile extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  const WishListTile(
      {super.key,
      required this.title,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .90,
        height: 110,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 100,
              height: 120,
              child: Image.network(image, fit: BoxFit.cover),
            ),
            const SizedBox(
              width: 3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
                Text(
                  '$price \$',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
