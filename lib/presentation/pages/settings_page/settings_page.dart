import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/change_language_bloc/change_language_bloc.dart';
import 'package:world_commerce/generated/l10n.dart';
import 'package:world_commerce/presentation/custom_widgets/top_bar.dart';
import 'package:world_commerce/presentation/pages/privacy_policy_page/privacy_policy_page.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar('Settings', true, context, false),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(border: Border.all(color: ColorManager.grey)),
            child: Row(
              children: [
                const Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Switch(value: true, onChanged: (val) {})
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(border: Border.all(color: ColorManager.grey)),
            child: Row(
              children: [
                InkWell(
                  child: Text(
                    S.of(context).appTitle,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    context.read<ChangeLanguageBloc>().add(LanguageEvent());
                  },
                ),
                const Spacer(),
                const Text(
                  'English',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.grey),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage()));
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              decoration:
                  BoxDecoration(border: Border.all(color: ColorManager.grey)),
              child: const Row(
                children: [
                  Text(
                    'Privacy and Policy',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_outlined,
                      color: ColorManager.grey)
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(border: Border.all(color: ColorManager.grey)),
            child: const Row(
              children: [
                Text(
                  'Help & Support',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.chat_bubble_outline, color: ColorManager.grey)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(border: Border.all(color: ColorManager.grey)),
            child: const Row(
              children: [
                Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.person_2_outlined, color: ColorManager.grey)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(border: Border.all(color: ColorManager.grey)),
            child: const Row(
              children: [
                Text(
                  'Wishlist',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.favorite, color: ColorManager.grey)
              ],
            ),
          )
        ],
      ),
    );
  }
}
