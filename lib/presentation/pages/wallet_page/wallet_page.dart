import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/custom_widgets/top_bar.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar('Wallet', true, context, true),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black,
                    Color.fromRGBO(78, 77, 77, 1),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Balance',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  '\$ 2,398,203.0',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Nehal Gamal',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 50),
                    Text(
                      '12/11',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'XXX XXX XXX X20',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/icons/visa.png',
                      width: 200,
                      height: 80,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
