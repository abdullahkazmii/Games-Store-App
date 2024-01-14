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
      "price":"900",
      "description":'"Fortnite" is a popular online multiplayer battle royale game developed and published by Epic Games. Initially released in 2017, "Fortnite" quickly gained widespread popularity due to its unique blend of building mechanics, fast-paced action, and engaging gameplay.  Players can harvest resources from the environment and use them to build structures like walls, ramps, and forts. This unique building mechanic adds a strategic element to the gameplay.',
    },
    {
      "name":"GTA- Vice City",
      "picture":"images/slider-1.webp",
      "price":"1000",
      "description":"Grand Theft Auto: Vice City, commonly known as GTA Vice City, is an action-adventure video game developed by Rockstar North and published by Rockstar Games. It was released in 2002 as the sixth title in the Grand Theft Auto series. Set in the fictional Vice City, a heavily inspired rendition of Miami in the 1980s, the game follows the story of Tommy Vercetti, a former member of the Forelli crime family, who is released from prison and seeks to establish a criminal empire in the city.",
    },
    {
      "name":"Mortal Combat",
      "picture":"images/slider-2.jpeg",
      "price":"500",
      "description":"Mortal Kombat is a renowned fighting game franchise known for its intense gameplay, iconic characters, and brutal finishing moves. Here are key aspects of the Mortal Kombat series: Mortal Kombat is a 2D fighting game that places two players against each other in one-on-one combat.",
    },
    {
      "name":"MineCraft",
      "picture":"images/slider-3.jpeg",
      "price":"1000",
      "description":"Minecraft is a sandbox video game that has taken the gaming world by storm. Developed and published by Mojang Studios, it offers players an open-world environment to explore, build, and survive. Launched in 2011, Minecraft has become a cultural phenomenon, captivating millions of players worldwide with its unique blend of creativity and adventure.",
    },
    {
      "name":"God Of War",
      "picture":"images/slider-4.jpeg",
      "price":"2000",
      "description":"Hello this is me",
    },
    {
      "name":"Game",
      "picture":"images/fortnite-3.jpeg",
      "price":"1000",
      "description":"Hello this is me",
    },
    {
      "name":"game 2",
      "picture":"images/fortnite-3.jpeg",
      "price":"1000",
      "description":"Hello this is me",
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
                product_description: product_list[index]['description'],

              );
            }
        ),
      ),
    );
  }
}

class single_product extends StatelessWidget {
  const single_product({super.key, this.product_name, this.product_image, this.product_price, this.product_description});
  final product_name;
  final product_image;
  final product_price;
  final product_description;


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
                  product_detail_description: product_description,

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
