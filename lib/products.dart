import 'package:flutter/material.dart';
import 'package:project/cart.dart';
import 'package:project/homepage.dart';
import 'package:project/pages/product_detail.dart';
import 'package:badges/badges.dart';
import 'package:project/home_screen.dart';

class product extends StatefulWidget {
  static const String id='product';
  const product({super.key});
  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  var product_list=[
    {
      "name":"Fortnite",
      "picture":"images/fortnite-3.jpeg",
      "price":"900"
    },
    {
      "name":"GTA- Vice City",
      "picture":"images/slider-1.webp",
      "price":"1000"
    },
    {
      "name":"Mortal Combat V4",
      "picture":"images/slider-2.jpeg",
      "price":"500"
    },
    {
      "name":"Mini Stars",
      "picture":"images/slider-3.jpeg",
      "price":"1000"
    },
    {
      "name":"God Of War",
      "picture":"images/slider-4.jpeg",
      "price":"2000"
    },
    {
      "name":"Game",
      "picture":"images/fortnite-3.jpeg",
      "price":"1000"
    },
    {
      "name":"game 2",
      "picture":"images/fortnite-3.jpeg",
      "price":"1000"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          'Games',
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlueAccent, Colors.purple],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.black],
          ),
        ),
        child: GridView.builder(
            itemCount: product_list.length,
            gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index){
              return single_product(
                product_name: product_list[index]['name'],
                product_image: product_list[index]['picture'],
                product_price: product_list[index]['price'],
              );
            }
        ),
      ),
    );
  }
}

class single_product extends StatelessWidget {
  const single_product({super.key, this.product_name, this.product_image, this.product_price});
  final product_name;
  final product_image;
  final product_price;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Add elevation for a shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Add rounded corners
      ),
      child: Hero(
        tag: product_name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => new product_detail(
                  product_detail_name: product_name,
                  product_detail_image: product_image,
                  product_detail_price: product_price,
                ),
              ),
            ),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  contentPadding: EdgeInsets.all(8.0), // Add padding to ListTile
                  title: Align(
                    alignment: Alignment.topRight, // Align to the right corner
                    child: Container(
                      padding: EdgeInsets.all(6.0), // Add padding to the price container
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey), // Add border to the container
                        borderRadius: BorderRadius.circular(8.0), // Add rounded corners to the container
                        color: Colors.blueGrey, // Set the background color
                      ),
                      child: Text(
                        '\pkr$product_price',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set the text color
                        ),
                      ),
                    ),
                  ),
                  leading: Text(
                    product_name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0), // Add rounded corners to the image
                child: Image.asset(
                  product_image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

          ),
        ),
      ),
    );
  }
}
