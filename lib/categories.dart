import 'package:flutter/material.dart';

class categories extends StatelessWidget {
  var category_list=[
    {
      "name":"game 1",
      "picture":"images/fortnite-3.jpeg",
    },
    {
      "name":"game 2",
      "picture":"images/fortnite-3.jpeg",
    },
    {
      "name":"game 2",
      "picture":"images/fortnite-3.jpeg",
    },
    {
      "name":"game 2",
      "picture":"images/fortnite-3.jpeg",
    },
  ];
  @override

  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Categories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Category(
                  name: category_list[index]["name"] ?? "",
                  imagePath: category_list[index]["picture"] ?? "",
                );
              },
            ),
          ),
        ));
  }
}


class Category extends StatelessWidget {
  final String name;
  final String imagePath;

  const Category({Key? key, required this.name, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 80, // Adjust the height as needed
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


