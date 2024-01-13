import 'package:flutter/material.dart';
import 'package:project/home_screen.dart';
import 'package:project/cart.dart';
import 'package:project/Profile/myprofile.dart';


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
    Profile(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _tabs[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.lightBlueAccent], // Gradient colors
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          // Make BottomNavigationBar background transparent
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
          selectedItemColor: Colors.white,

          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}