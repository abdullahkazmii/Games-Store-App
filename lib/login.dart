import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/homepage.dart';
import 'package:project/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  static const String id='login';
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final formkey= GlobalKey<FormState>();
  bool _isSigning = false;
  final FirebaseServices _auth = FirebaseServices();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailnameController = TextEditingController();
  TextEditingController _passwordnameController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _emailnameController.dispose();
    _usernameController.dispose();
    _passwordnameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container( //since scaffold apki background image nhi leta hum container return krwain gai
      decoration: BoxDecoration(
          image:  DecorationImage(
              image: AssetImage('images/spiderman1.jpg'),
              fit:BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack( //to keep things organized
          children: [
            Container(
              color: Colors.white.withOpacity(0.3), // Adjust opacity as needed
            ),

            SingleChildScrollView( //for scrolling
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.36, right: 35, left: 35),
                  child: Form(
                    key: formkey,

                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailnameController,
                          style: TextStyle(
                            color: Colors.white, // Set the text color
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.black ,
                            filled: true,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.grey, // Set the hint text color
                            ),//
                          ),

                          validator: (value) {

                            if (value == null || value.isEmpty) {

                              return 'Please enter your email';
                            }
                            String emailPattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                            RegExp regExp = RegExp(emailPattern);

                            if (!regExp.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            // You can add more email validation logic if needed
                            return null;
                          },
                        ),


                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _passwordnameController,
                          style: TextStyle(
                            color: Colors.white, // Set the text color
                          ),
                          obscureText: true, //to hide
                          decoration: InputDecoration(
                            fillColor: Colors.black ,
                            filled: true,
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3)
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey, // Set the hint text color
                            ),
                          ),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }// Return null for successful validation
                          },
                        ),

                        SizedBox(
                          height: 50,
                        ),
                        Column(
                          children: [
                        ElevatedButton(
                              onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                setState(() {
                                  _isSigning = true;
                                });
                                String email = _emailnameController.text;
                                String password = _passwordnameController.text;
                                try {
                                  UserCredential userCredential =
                                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  );

                                  if (userCredential.user != null) {
                                    // Save user details in SharedPreferences on successful login
                                    saveUserDetails(email, userCredential.user!.displayName);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => homepage()));
                                  } else {
                                    print("User Don't Exist");
                                  }
                                } catch (e) {
                                  print("Error signing in: $e");
                                } finally {
                                  setState(() {
                                    _isSigning = false;
                                  });
                                }

                                // User? user = await _auth.signInMethod(email, password);
                                // setState(() {
                                //   _isSigning = false;
                                // });
                                //
                                // if (user != null) {
                                //   print("User is successfully created");
                                //   saveUserDetails(email, user.displayName);
                                //   Navigator.push(context, MaterialPageRoute(
                                //       builder: (context) => homepage()));
                                // }
                                // else{
                                //   print("User Don't Exist");
                                // }



                              }// Add your login logic here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey, // Set the button background color
                            onPrimary: Colors.black87, // Set the text color

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0), // Set a smaller button border radius
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 145.0), // Reduce button padding
                            side: BorderSide(
                              color: Colors.black, // Set the border color
                              width: 1.5, // Set the border width
                            ),
                          ),
                          child: _isSigning ? CircularProgressIndicator(color: Colors.white,): Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16.0, // Decrease font size for a slimmer look
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.black,
                                    thickness: 1.2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.black,
                                    thickness: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                    GestureDetector(
                      onTap: () async {
                        final GoogleSignIn _googleSignIn = GoogleSignIn();
                        try {
                          final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
                          if (googleSignInAccount != null) {
                            final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

                            final AuthCredential credential = GoogleAuthProvider.credential(
                              idToken: googleSignInAuthentication.idToken,
                              accessToken: googleSignInAuthentication.accessToken,
                            );
                            await _firebaseAuth.signInWithCredential(credential);
                            Navigator.pushNamed(context, 'homepage');
                          }
                        } catch (e) {
                          print("Error Occure: $e");
                        }
                      },
                      child: Container(
                        // decoration: BoxDecoration(
                        //   color: Colors.black, // Set the background color
                        //   borderRadius: BorderRadius.circular(5.0), // Set border radius
                        //   border: Border.all(
                        //     color: Colors.black, // Set the border color
                        //     width: 1.5, // Set the border width
                        //   ),
                        // ),
                        // padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Colors.red[900], // Set the icon color
                            ),
                            //SizedBox(width: 8.0),
                            Text(
                              'SignIn with Google Account',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[900], // Set the text color
                                ),
                              ),
                            ],
                          ),
                        ),
                    ),
                          ]
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed:(){
                              Navigator.pushNamed(context, 'signup');
                            },
                                child: Text('Sign Up', style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),)),

                          ],
                        ),

                      ],

                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

// Function to save user details in SharedPreferences
  void saveUserDetails(String email, String? username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('username', username ?? ''); // Use an empty string if username is null
  }

  }

