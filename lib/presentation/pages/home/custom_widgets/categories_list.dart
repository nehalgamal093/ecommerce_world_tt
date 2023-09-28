import 'package:flutter/material.dart';

final List<Categories> list = [
  Categories(title: 'Electronics', icon: Icons.tv_outlined),
  Categories(title: 'Fashion', icon: Icons.ad_units),
  Categories(title: 'Home', icon: Icons.home),
  Categories(title: 'Books', icon: Icons.book),
  Categories(title: 'Beauty', icon: Icons.beach_access),
  Categories(title: 'Electronics', icon: Icons.tv_outlined),
];

class Categories {
  String title;
  IconData icon;
  Categories({
    required this.title,
    required this.icon,
  });
}

Widget categoriesList(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 100,
    child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    // color: ColorManager.lightOrange,
                    border: Border.all(color: Colors.purple),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    list[index].icon,
                    color: Colors.purple,
                  ),
                ),
              ),
              Text(
                list[index].title,
                style: const TextStyle(
                    fontSize: 10, color: Color.fromARGB(255, 199, 163, 205)),
              )
            ],
          );
        }),
  );
}
