import 'package:flutter/material.dart';
import 'package:project/pages/item_details.dart';
import '../consts/colors.dart';
import '../consts/styles.dart';

class category_details extends StatelessWidget {
  final String? name;
  final List<Map<String, String>> category_list;
  category_details({super.key, this.name, required this.category_list});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? 'Default Title'),
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 250,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => itemdetail(
                    item_name:category_list[index]["image"] ?? "",
                    item_imagePath: category_list[index]["image"] ?? "", // Use the actual key for the image path
                    item_detail: category_list[index]["detail"] ?? "", // Use the actual key for the detail
                  ),
                ),
              );
            },
            child: Container(
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
              margin: EdgeInsets.symmetric(horizontal: 4),
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/gta-1.jpg',
                    height: 150,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Laptop 4GB/64GB",
                    style: TextStyle(
                      fontFamily: semibold,
                      color: darkFontGrey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "\$600",
                    style: TextStyle(
                      color: greenColor,
                      fontFamily: bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}