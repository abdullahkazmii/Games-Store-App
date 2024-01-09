import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project/my_drawer_header.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatefulWidget {
  static const String id='landing_page';

  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  var currentPage = DrawerSecions.profile;
  List imagelist = [
    {"id":1, "image_path": 'images/slider-1.webp'},
    {"id":2, "image_path": 'images/slider-2.webp'},
    {"id":3, "image_path": 'images/slider-3.webp'},
    {"id":4, "image_path": 'images/slider-4.jpeg'}
  ];

  final CarouselController carouselController = CarouselController();
  TextEditingController _searchController = TextEditingController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Game Store',
              overflow: TextOverflow.ellipsis,
              //style: GoogleFonts.lato(),
            ),
            backgroundColor: const Color.fromARGB(
            255,
            (8 + 0) ~/ 2,    // Average of red values
            (67 + 64) ~/ 2,  // Average of green values
            (86 + 51) ~/ 2,  // Average of blue values
          ),
            actions: [

              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // Handle cart icon tap
                  // Add your cart functionality here
                  print('Cart icon tapped');
                },
              ),
            ],
          ),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    const MyHeaderDrawer(),
                    MyDrawerList(),
                  ],
                ),
              ),
            ),
            // Add your drawer content here

          ),
          body: Container(
            color: Colors.blueGrey,
             // Set your desired background color here
          child: TabBarView(
              children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
              const SizedBox(
                height: 10,
            ),
            Align(

                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
            child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add your button 1 action here
                  print('Button 1 pressed');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: Icon(
                  Icons.sports_soccer, // Replace with your desired icon
                  size: 30,
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Add your button 2 action here
                  print('Button 2 pressed');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: Icon(
                  Icons.car_rental, // Replace with your desired icon
                  size: 30,
                ),
              ),
              const SizedBox(width: 10),

              ElevatedButton(
                onPressed: () {
                  // Add your button 2 action here
                  print('Button 3 pressed');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: Icon(
                  Icons.gamepad,
                  size: 30,
                ),
              ),
              const SizedBox(width: 10),

              ElevatedButton(
                onPressed: () {
                  // Add your button 2 action here
                  print('Button 4 pressed');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: Icon(
                  Icons.local_police,
                  size: 30,
                ),
              ),
              const SizedBox(width: 10),

              ElevatedButton(
                onPressed: () {
                  // Add your button 2 action here
                  print('Button 5 pressed');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: Icon(
                  Icons.extension,
                  size: 30,
                ),
              ),
              SizedBox(width: 10),

              ElevatedButton(
                onPressed: () {
                  // Add your button 2 action here
                  print('Button 6 pressed');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: Icon(
                  Icons.sports_basketball,
                  size: 30,
                ),
              ),
              SizedBox(width: 10),
            ],
            ),
                    ),
            ),

                        SizedBox(
        height: 10,
      ),
                        Opacity(
                          opacity: 0.7, // Adjust the opacity level as needed (0.0 to 1.0)
                          child: InkWell(
                            onTap: () {
                              print(currentIndex);
                            },
                            child: CarouselSlider(
                              items: imagelist
                                  .map(
                                    (item) => Image.asset(
                                  item['image_path'],
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
                              )
                                  .toList(),
                              carouselController: carouselController,
                              options: CarouselOptions(
                                scrollPhysics: const BouncingScrollPhysics(),
                                autoPlay: true,
                                aspectRatio: 3,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imagelist.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () => carouselController.animateToPage(entry.key),
                                child: Container(
                                  width: currentIndex == entry.key ? 17 : 7,
                                  height: 7.0,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 3.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: currentIndex == entry.key ? Colors.red : Colors.teal,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),                      Container(
                          height: 2, // Adjust the height of the divider as needed
                          color: Colors.black38, // Adjust the color of the divider as needed
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),

                        Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
// Part 1
                                        height: 100.0,
                                        width: 100,
                                        child: Image.asset(
                                          'images/rdr-1.jpeg', // Replace with your image URL
                                          fit: BoxFit.fill, // Adjust the BoxFit property as needed
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: 4.0), // Space between parts
                                    Flexible(
                                      flex: 2, // Part 2 will take one unit of space
                                      child: Container(
// Part 2
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.black38, // Choose your desired border color
                                              width: 2.0, // Adjust the width of the border
                                            ),
                                          ),
                                        ),

                                        margin: EdgeInsets.only(left: 20, top: 30),
                                        height: 100.0,
                                        child: Text(
                                          'Red Dead Redemption 2" (RDR2) is an action-adventure video game developed and published by Rockstar Games. It was released for PlayStation 4 and Xbox One in October 2018, and later for Microsoft Windows in November 2019. The game is a prequel to the 2010 game "Red Dead Redemption" and is the third entry in the "Red Dead" series'
                                        , overflow: TextOverflow.ellipsis, // or TextOverflow.clip, TextOverflow.fade
                                          maxLines: 5,),
                                      ),
                                    )],
                                ),


                                Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
// Part 1
                                        height: 100.0,
                                        width: 100,
                                        child: Image.asset(
                                          'images/gta-1.jpg', // Replace with your image URL
                                          fit: BoxFit.fill, // Adjust the BoxFit property as needed
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: 4.0), // Space between parts
                                    Flexible(
                                      flex: 2, // Part 2 will take one unit of space
                                      child: Container(
// Part 2
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.black38, // Choose your desired border color
                                              width: 2.0, // Adjust the width of the border
                                            ),
                                          ),
                                        ),

                                        margin: EdgeInsets.only(left: 20, top: 30),
                                        height: 100.0,
                                        child: Text(
                                          'Grand Theft Auto V" (GTA V) is an action-adventure video game developed by Rockstar North and published by Rockstar Games. It was initially released for PlayStation 3 and Xbox 360 in September 2013 and later for PlayStation 4, Xbox One, and Microsoft Windows. Here a description of the game',
                                          overflow: TextOverflow.ellipsis, // or TextOverflow.clip, TextOverflow.fade
                                          maxLines: 5,),
                                      ),
                                    )],
                                )
                              ],
                            ),
                        ),
                      ],
    ),
                  ),


      Center(child: Text('welcome to your search')),
      Center(child: Text('welcome to your Profile Page')),
    ],
    ),
          ),
          bottomNavigationBar: Container(
            color: Color.fromARGB(
            255,
            (8 + 0) ~/ 2,    // Average of red values
            (67 + 64) ~/ 2,  // Average of green values
            (86 + 51) ~/ 2,  // Average of blue values
          ),

            // Adjust the color as needed
            child: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.search),
                ),
                Tab(
                  icon: Icon(Icons.person),
                ),
              ],
              onTap: (index) {
                // Handle tab selection
                if (index == 1) {
                  showSearch(context: context, delegate: SearchBarDelegate());
                }
              },
            ),

          ),

        )
    );
  }
  Widget MyDrawerList(){
    return Container(
      padding: EdgeInsets.only(top: 15,),
      child: Column(
        children: [
          menuItem(1, "Profile", Icons.data_saver_off,
              currentPage == DrawerSecions.profile ? true : false),
          menuItem(2, "Categories", Icons.category_outlined,
              currentPage == DrawerSecions.categories ? true : false),
          menuItem(3, "Privacy Policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSecions.privacypolicy ? true : false),
          menuItem(4, "Logout", Icons.logout,
              currentPage == DrawerSecions.logout ? true : false),

        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected){
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
            if(id == 1){
              currentPage = DrawerSecions.profile;
            }
            else if(id == 2){
              currentPage = DrawerSecions.categories;
            }
            else if(id == 3){
              currentPage = DrawerSecions.privacypolicy;
            }
            else if(id == 4){
              currentPage = DrawerSecions.logout;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(child: Icon(
                icon,
                size: 20,
                color: Colors.black,
              )
              ),
              Expanded(
                flex:3,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black, fontSize: 14.0),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}

enum DrawerSecions{
  profile,
  categories,
  privacypolicy,
  logout,
}

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // This function is called to build the clear button.
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // This function is called to build the leading icon (back button).
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // This function is called to build the actual search results.
    return Center(child: Text('Search Results for: $query'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This function is called to build the suggestions while the user is typing.
    return Center(child: Text('Suggestions'));
  }
}

Color appBarAndTabBarColor = Color.fromARGB(
  255,
  (8 + 0) ~/ 2,    // Average of red values
  (67 + 64) ~/ 2,  // Average of green values
  (86 + 51) ~/ 2,  // Average of blue values
);

// Adjusting the saturation, lightness, and darkness
Color bodyColor = HSLColor.fromColor(appBarAndTabBarColor)
    .withSaturation(0.8)
    .withLightness(0.9)
    .withLightness(0.1) // Adding a bit of darkness
    .toColor();
