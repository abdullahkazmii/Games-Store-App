import 'package:flutter/material.dart';
import 'package:project/tab1.dart';
import 'package:project/tab3.dart';

class homepage extends StatefulWidget {
  static const String id='landing_page';

  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Game Store',
              overflow: TextOverflow.ellipsis,
            ),
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {

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
                InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text("Logout"),
                    leading: Icon(Icons.logout),
                  ),
                ),
              ]
            ),
          ),

          body: TabBarView(
            children: [
               tab1(),
               tab3()
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.grey, // Adjust the color as needed
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
                if (index == 1) {
                  showSearch(context: context, delegate: SearchBarDelegate());
                }
              },
            ),


          ),


        )
    );

  }
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => homepage()),
          );
        }
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
  }}
