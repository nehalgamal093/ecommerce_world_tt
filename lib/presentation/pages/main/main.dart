import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_commerce/presentation/pages/account_page/account_page.dart';
import 'package:world_commerce/presentation/pages/add_product/add_product.dart';
import 'package:world_commerce/presentation/pages/home/home.dart';
import 'package:world_commerce/presentation/pages/settings_page/settings_page.dart';
import 'package:world_commerce/presentation/pages/wallet_page/wallet_page.dart';
import 'package:world_commerce/presentation/resources/assets_manager.dart';
import '../../../Services/get_user.dart';
import '../../../generated/l10n.dart';
import '../signin/signin.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  final List _pages = [
    const Home(),
    const Icon(
      Icons.favorite,
      size: 150,
    ),
    const Icon(Icons.chat, size: 150),
    AccountPage()
  ];
  @override
  void initState() {
    super.initState();
    GetUser().userExit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecommerce World'),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(AssetsManager.cat, width: 100, height: 100),
                    const Text(
                      'Nehal Gamal',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 100),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
                },
                child: ListTile(
                  leading: const ImageIcon(AssetImage(AssetsManager.setting)),
                  title: Text(
                    S.of(context).settings,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WalletPage()));
                },
                child: ListTile(
                  leading: const ImageIcon(AssetImage(AssetsManager.wallet)),
                  title: Text(
                    S.of(context).wallet,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddProduct()));
                },
                child: ListTile(
                  leading: const ImageIcon(AssetImage(AssetsManager.product)),
                  title: Text(
                    S.of(context).addProdct,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Signin(
                        isRegisteredSuccess: false,
                      ),
                    ),
                  );
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.remove('token');
                  preferences.remove('saveLogin');
                  preferences.remove('userId');
                  preferences.remove('email');
                },
                child: ListTile(
                  leading: const ImageIcon(
                    AssetImage(AssetsManager.signout),
                  ),
                  title: Text(
                    S.of(context).signOut,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
        child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.store)),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.heart100)),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.message)),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.person)),
                  label: 'Home'),
            ]),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
//181