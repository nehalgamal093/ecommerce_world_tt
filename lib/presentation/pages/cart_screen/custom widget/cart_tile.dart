import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 110,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            width: 100,
            height: 120,
            decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: Image.asset('assets/images/iphone.png', fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Iphone x5 Pro',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '764 \$',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('-'),
              SizedBox(
                height: 10,
              ),
              Text('1'),
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: ColorManager.lightOrange,
                child: Text('+'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
