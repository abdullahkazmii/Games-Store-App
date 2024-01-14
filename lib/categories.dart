import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/pages/category_details.dart';

class categories extends StatelessWidget {
  var category_list=[
    {
      "name":"game 1",
      "picture":"images/fortnite-3.jpeg",
      "detail":"bla bla bla",

    },
    {
      "name":"game 2",
      "picture":"images/slider-1.webp",
      "detail":"bla bla bla",
    },
    {
      "name":"game 3",
      "picture":"images/slider-2.jpeg",
      "detail":"bla bla bla",
    },
    {
      "name":"game 4",
      "picture":"images/slider-3.jpeg",
      "detail":"bla bla bla",
    },
  ];
  @override

  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => homepage()),
              );
            },
          ),
          title: Text("Categories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
        body: Container(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: category_list.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle the tap here, for example, navigate to a new page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => category_details(
                            category_list: category_list,
                            name: category_list[index]["name"],
                          ),
                        ),
                      );
                    },
                    child: Category(
                      name: category_list[index]["name"] ?? "",
                      imagePath: category_list[index]["picture"] ?? "",
                      detail: category_list[index]["detail"] ?? "",
                    ),
                  );
                },
              ),
            ),
          ),
        );
  }
}


class Category extends StatelessWidget {
  final String name;
  final String imagePath;
  final String detail;


  const Category({Key? key, required this.name, required this.imagePath,required this.detail})
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


