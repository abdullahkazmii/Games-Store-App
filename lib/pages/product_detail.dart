import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/tab1.dart';
import 'package:project/tab3.dart';
import 'package:project/cart.dart';
import 'package:project/products.dart';


class product_detail extends StatefulWidget {
  const product_detail({super.key, this.product_detail_name, this.product_detail_image, this.product_detail_price, this.product_detail_description});
  final product_detail_name;
  final product_detail_image;
  final product_detail_price;
  final product_detail_description;
  @override
  State<product_detail> createState() => _product_detailState();
}

class _product_detailState extends State<product_detail> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
          appBar: AppBar(
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
            leading: IconButton(
              icon: Icon(Icons.arrow_back, size: 30,),
              color: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, 'product'); // Navigate back to the previous page
              },
            ),
          ),
              body: new ListView(
                     children: [
                              Container(
                                height: 300,
                                child: GridTile(
                                  child: Container(
                                    color: Colors.black,
                                    child: Image.asset(widget.product_detail_image)
                                  ),
                                  footer: Container(
                                    color: Colors.black,
                                    child: ListTile(
                                      leading: Text(
                                        widget.product_detail_name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white,
                                          letterSpacing: 0.7,

                                        ),
                                      ),
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.end, // Align to the right
                                        children: [
                                          Text(
                                            '\pkr',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                              letterSpacing: 0.5,

                                            ),
                                          ),
                                          SizedBox(width: 4), // Add some space between currency symbol and price
                                          Text(
                                            '${widget.product_detail_price}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                              fontSize: 18, // Increase the font size
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),


                                ),
                              ),
                       Container(
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(15.0),
                           boxShadow: [
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.5),
                               spreadRadius: 2,
                               blurRadius: 5,
                               offset: Offset(0, 3), // changes position of shadow
                             ),
                           ],
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(16.0),
                           child: Text(
                             '${widget.product_detail_description}',
                             style: TextStyle(
                               fontSize: 18.0,
                               color: Colors.black87,
                               letterSpacing: 0.5,
                               height: 1.5, // Adjust the line spacing
                             ),
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

