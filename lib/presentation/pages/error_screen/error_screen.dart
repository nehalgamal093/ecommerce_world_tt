import 'package:flutter/material.dart';
import '../../custom_widgets/btn.dart';
import '../../resources/assets_manager.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset(AssetsManager.robot),
            ),
            const SizedBox(height: 40),
            const Text(
              'Opssssssssss',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Something went wrong',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 40),
            InkWell(onTap: () {}, child: btn('Try Again'))
          ],
        ),
      ),
    );
  }
}
