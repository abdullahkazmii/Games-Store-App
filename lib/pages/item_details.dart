import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/categories.dart';
import 'package:project/pages/category_details.dart';

class itemdetail extends StatelessWidget {
  const itemdetail({super.key, required this.item_name, required this.item_imagePath,required this.item_detail});
  final String? item_name;
  final String item_imagePath;
  final String item_detail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => categories()),
              );
            },
          ),
          title: Text('Game Store',
            overflow: TextOverflow.ellipsis,
          ),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightBlueAccent, Colors.purple], // Gradient colors
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homepage(),
                    )
                );
              },
              icon: Icon(Icons.home),
            ),

            SizedBox(width: 20,),
          ],
        ),
        body: new ListView(
          children: [
            Container(
              height: 300,
              child: GridTile(
                child: Container(
                    color: Colors.white,
                    child: Image.asset(item_imagePath)
                ),
                footer: Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: Text(item_name!),
                      title: Row(
                        children: [
                          Expanded(child: Text(
                              item_detail)
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text("Add to Cart"),
              ),
            ),
          ],
        )

    );
  }
}
