import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project/categories.dart';

class HomeScreen extends StatelessWidget {

  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Game Store',
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.search), // Replace with search icon
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
            children:<Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text("linta"),
                accountEmail:Text("lintarehman@gmail.com"),
                currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white38),
                    )
                ),
                decoration: BoxDecoration(
                    color: Colors.blueGrey
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text("homepage"),
                  leading: Icon(Icons.home),
                ),
              ),
              InkWell(
                  onTap: () {
                    try {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => categories()),
                      );
                      print("Categories Page");
                    } catch (e) {
                      print('Error navigating to Categories: $e');
                    }
                  },
                  child: ListTile(
                    title: Text("Category"),
                    leading: Icon(Icons.category),
                  ),
              ),

              // Sub-options for Categories
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        title: Text("Option 1"),
                        leading: Icon(Icons.car_crash),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        title: Text("Option 2"),
                        leading: Icon(Icons.sports_baseball),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        title: Text("Option 3"),
                        leading: Icon(Icons.local_police),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        title: Text("Option 4"),
                        leading: Icon(Icons.star),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text("My Profile"),
                  leading: Icon(Icons.person),
                ),
              ),

              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text("My Orders"),
                  leading: Icon(Icons.shopping_basket_outlined),
                ),
              ),
              Divider(),

              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help),
                ),
              ),
            ]
        ),
      ),

      body: Stack(
        children: [
          // Carousel Background
          CarouselSlider(
            items: [
              Image.network('https://placekitten.com/800/400', fit: BoxFit.cover),
              Image.network('https://placekitten.com/800/401', fit: BoxFit.cover),
              Image.network('https://placekitten.com/800/402', fit: BoxFit.cover),
            ],
            options: CarouselOptions(
              height: double.infinity, // Match the screen height
              viewportFraction: 1.0, // Full width of the screen
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
          ),

          // Your Content
          Column(
            children: [
              // Additional widgets or content
              // Example: Text widget
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "hello",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),

      );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search results here
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement your search suggestions here
    return Center(
      child: Text('Search suggestions for: $query'),
    );
  }
}
