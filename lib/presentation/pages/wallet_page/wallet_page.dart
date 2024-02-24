import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/custom_widgets/top_bar.dart';

import '../../../generated/l10n.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(S.of(context).wallet, true, context, true),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: const BoxDecoration(
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
                  S.of(context).balance,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                const Text(
                  '\$ 2,398,203.0',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Row(
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
                    const Text(
                      'XXX XXX XXX X20',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/icons/visa.png',
                      width: 200,
                      height: 80,
                    )
                  ],
                )
              ],
            ),
          ),
          transTitle(context),
          listOfTransactions(context)
        ],
      ),
    );
  }
}

Widget transTitle(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.all(10),
    width: MediaQuery.of(context).size.width,
    child: Text(
      S.of(context).recentTransactions,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      textAlign: TextAlign.start,
    ),
  );
}

Widget listOfTransactions(BuildContext context) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return const Card(
          margin: EdgeInsets.all(8),
          child: SizedBox(
            height: 50,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.account_balance_wallet_outlined),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '19-11-2023',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    '+200 \$',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
