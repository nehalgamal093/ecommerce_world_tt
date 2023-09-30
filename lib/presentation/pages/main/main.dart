import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_commerce/Services/get_products.dart';
import 'package:world_commerce/presentation/pages/account_page/account_page.dart';
import 'package:world_commerce/presentation/pages/add_product/add_product.dart';
import 'package:world_commerce/presentation/pages/home/home.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

import '../../../Services/get_user.dart';
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
      Icons.chat,
      size: 150,
    ),
    const AddProduct(),
    const Icon(
      Icons.chat,
      size: 150,
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetProducts().fetchProducts(1);
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
                    Image.asset('assets/images/cat.png',
                        width: 100, height: 100),
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
                          builder: (context) => const AccountPage()));
                },
                child: const ListTile(
                  leading: ImageIcon(AssetImage('assets/icons/account.png')),
                  title: Text('Account'),
                ),
              ),
              const Divider(),
              const ListTile(
                leading: ImageIcon(AssetImage('assets/icons/setting.png')),
                title: Text('Setting'),
              ),
              const Divider(),
              const ListTile(
                leading: ImageIcon(AssetImage('assets/icons/wallet.png')),
                title: Text('Wallet'),
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
                child: const ListTile(
                  leading: ImageIcon(
                    AssetImage('assets/icons/signout.png'),
                  ),
                  title: Text('Sign out'),
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
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: ColorManager.orange,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/store.png')),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/heart100.png')),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/message.png')),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/person.png')),
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
