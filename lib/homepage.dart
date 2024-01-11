import 'package:flutter/material.dart';
import 'package:project/home_screen.dart';
import 'package:project/cart.dart';
import 'package:project/myprofile.dart';


class homepage extends StatefulWidget {
  static const String id='landing_page';

  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  int _selectedIndex = 0;

  final List<Widget> _tabs = [
     HomeScreen(),
     mycart(),
     myprofile(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _tabs[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'My Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
