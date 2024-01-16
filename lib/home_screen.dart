import 'package:flutter/material.dart';
import 'package:project/Profile/myprofile.dart';
import 'package:project/products.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project/categories.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {

  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Game Store',
          overflow: TextOverflow.ellipsis,
        ),
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
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => product()),
              );
            },
            child: CarouselSlider(
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: [
                'images/slider-1.webp',
                'images/slider-2.jpeg',
                'images/slider-3.jpeg',
              ].map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 33, top: 130),
                  child: Text(
                    'WELCOME\nTO OUR WEBSITE',
                    style: TextStyle(
                      color: Colors.black, // Set text color based on your design
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1500),
            top: MediaQuery.of(context).size.height * 0.5 - 20,
            right: 20,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => product()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Tap to explore",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 24.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: FutureBuilder(
          future: getUserDetails(),
          builder: (context, AsyncSnapshot<Map<String, String>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final userDetails = snapshot.data!;
              return ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(userDetails['username'] ?? 'Guest'),
                    accountEmail: Text(userDetails['email'] ?? ''),
                    currentAccountPicture: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white38),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
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
                    onTap: () {
                      try {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                        print("Categories Page");
                      } catch (e) {
                        print('Error navigating to Categories: $e');
                      }
                    },
                    child: ListTile(
                      title: Text("My Profile"),
                      leading: Icon(Icons.person),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text("My Orders"),
                      leading: Icon(Icons.shopping_basket_outlined),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text("Settings"),
                      leading: Icon(Icons.settings),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text("About"),
                      leading: Icon(Icons.help),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      try {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushNamed(context, "login");
                        print("User is Loggged out Successfully");
                      } catch (e) {
                        print('Error navigating to tab3: $e');
                      }
                    },
                    child: ListTile(
                      title: Text("Logout"),
                      leading: Icon(Icons.logout),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<Map<String, String>> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'email': prefs.getString('email') ?? '',
      'username': prefs.getString('username') ?? '',
    };
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