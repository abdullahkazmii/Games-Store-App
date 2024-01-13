import 'package:flutter/material.dart';
import 'package:project/products.dart';
class tab3 extends StatefulWidget {
  static const String id='tab3';

  const tab3({super.key});

  @override
  State<tab3> createState() => _tab3State();
}

class _tab3State extends State<tab3> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: product(),
    );

  }
}
