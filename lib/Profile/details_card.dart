import 'package:flutter/material.dart';

Widget detailsCard({double? width, String? count, String? title}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    padding: EdgeInsets.all(4),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count!,
          style: TextStyle(color: Colors.blueGrey, fontSize: 16),
        ),
        SizedBox(height: 5),
        Text(
          title!,
          style: TextStyle(color: Colors.blueGrey,
        ),
        ),
      ],
    ),
  );
}
