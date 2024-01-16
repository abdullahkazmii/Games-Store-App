import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:project/homepage.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Use FutureBuilder to load async data from SharedPreferences
      future: getUserDetails(),
      builder: (context, AsyncSnapshot<Map<String, String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator while waiting for data
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle error
          return Text('Error: ${snapshot.error}');
        } else {
          // If data is available, build the UI
          final userDetails = snapshot.data!;
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
                'Profile',
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
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 16),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "images/fortnite-3.jpeg",
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userDetails['username'] ?? '', // Display username
                                  style: TextStyle(
                                    fontFamily: 'Pacifico', // Change the font
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  userDetails['email'] ?? '', // Display email
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20, // Adjust the font size as needed
                                    fontWeight: FontWeight.bold, // Add other styling properties if necessary
                                  ),
                                ),

                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              onPrimary: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Adjust padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Add rounded corners
                              ),
                              shadowColor: Colors.black.withOpacity(0.2), // Add a shadow to the button
                              elevation: 5, // Set the elevation of the button
                            ),
                            onPressed: () {
                              try {
                                FirebaseAuth.instance.signOut();
                                Navigator.pushNamed(context, "login");
                                print("User is Logged out Successfully");
                              } catch (e) {
                                print('Error navigating to login: $e');
                              }
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                fontFamily: 'Pacifico', // Change the font
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DetailsCard(
                            count: "00",
                            title: "in Your Cart",
                            width: MediaQuery.of(context).size.width / 3.5,
                          ),
                          DetailsCard(
                            count: "32",
                            title: "in Your Wishlist",
                            width: MediaQuery.of(context).size.width / 3.5,
                          ),
                          DetailsCard(
                            count: "675",
                            title: "your Orders",
                            width: MediaQuery.of(context).size.width / 3.5,
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.black, Colors.white], // Gradient colors
                      ),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.deepPurple, // Set the color of the divider
                          thickness: 2, // Set the thickness of the divider
                          height: 20, // Set the height of the divider
                        );
                      },
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100], // Set the background color of the ListTile
                            borderRadius: BorderRadius.circular(12), // Add rounded corners
                          ),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "images/fortnite-3.jpeg",
                                width: 36, // Adjust the width of the leading image
                              ),
                            ),
                            title: Text(
                              "Edit my Profile $index",
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                color: Colors.deepPurple, // Set the text color
                                fontSize: 18, // Set the font size
                                fontWeight: FontWeight.bold, // Make the text bold
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  // Function to retrieve user details from SharedPreferences
  Future<Map<String, String>> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'email': prefs.getString('email') ?? '',
      'username': prefs.getString('username') ?? '',
    };
  }
}

class DetailsCard extends StatelessWidget {
  const DetailsCard({required this.count, required this.title, required this.width});

  final String count;
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.purple, Colors.black], // Gradient colors
        ),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                count,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
