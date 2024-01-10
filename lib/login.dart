import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
              image: AssetImage('images/login.webp'),
              fit:BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack( //to keep things organized
          children: [
            Container(
              color: Colors.white.withOpacity(0.2), // Adjust opacity as needed
            ),
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
                            ),
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
                        ElevatedButton(
                              onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                setState(() {
                                  _isSigning = true;
                                });
                                String email = _emailnameController.text;
                                String password = _passwordnameController.text;

                                User? user = await _auth.signInMethod(
                                    email, password);
                                setState(() {
                                  _isSigning = false;
                                });

                                if (user != null) {
                                  print("User is successfully created");
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => homepage()));
                                }
                                else{
                                  print("User Don't Exist");
                                }
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
                        ElevatedButton(
                              onPressed: () async {
                                final GoogleSignIn _googleSignIn = GoogleSignIn();
                                try{
                                  final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
                                  if(googleSignInAccount != null){
                                    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

                                    final AuthCredential credential = GoogleAuthProvider.credential(
                                      idToken: googleSignInAuthentication.idToken,
                                      accessToken: googleSignInAuthentication.accessToken,
                                    );
                                    await _firebaseAuth.signInWithCredential(credential);
                                    Navigator.pushNamed(context, 'homepage');
                                  }

                                } catch(e){
                                  print("Error Occured: $e");

                                }
                          },

                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // Set the button background color
                            onPrimary: Colors.red, // Set the text color

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0), // Set a smaller button border radius
                            ),
                            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0), // Reduce button padding
                            side: BorderSide(
                              color: Colors.black, // Set the border color
                              width: 1.5, // Set the border width
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.google),
                              SizedBox(width: 8.0,),
                              Text(
                                'SignIn with Google Account',
                                style: TextStyle(
                                  fontSize: 15, // Decrease font size for a slimmer look
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
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

                            TextButton(onPressed:(){
                              Navigator.pushNamed(context, 'home');
                            },
                                child: Text('Forget Password', style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),))

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

}
