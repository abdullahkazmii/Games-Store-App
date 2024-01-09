import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/login.dart';
import 'package:project/signup.dart';

class splash_screen extends StatefulWidget {
  static const String id='splash_screen';

  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  bool animate = false;

  @override
  void initState() {
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(
          255,
          (8 + 0) ~/ 2,    // Average of red values
          (67 + 64) ~/ 2,  // Average of green values
          (86 + 51) ~/ 2,  // Average of blue values
        ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: animate ? 0 : -30,
            left: animate ? 0 : -30,
              child: Image.asset(
                'images/splash-2.png',
                width: 130,  // Adjust the width as needed
                height: 130, // Adjust the height as needed
                fit: BoxFit.contain,
                // Adjust the fit as needed
              ),
            ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: 170,
            left: animate ? 50 : -20,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: animate ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Game Store App", style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    fontFamily: 'Trajan Pro',
                  ),
                  ),
                  Text("        Buy Games Online\n"
                      "                 from E-commerce Store",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    fontFamily: 'Trajan Pro',
                  ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2400),
            bottom: animate ? 100 : 0,
            left: 70,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              opacity: animate ? 1 : 0,
              child: Image.asset(
                'images/splash-logo.png',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
            ),),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 2400),
            bottom: animate ? 0 : -30,
            right: animate ? 0 : -30,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              opacity: animate ? 1 : 0,
              child: Image.asset(
                'images/splash-color.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
                // Adjust the fit as needed
              ),
            ),
          ),
        ],
      )
    );
  }

  Future startAnimation() async{
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(Duration(milliseconds: 3000));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signup()));
  }
}
