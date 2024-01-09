import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/auth_service.dart';
class login extends StatefulWidget {
  static const String id='login';
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final formkey= GlobalKey<FormState>();
  final FirebaseServices _auth = FirebaseServices();
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

                                String email = _emailnameController.text;
                                String password = _passwordnameController.text;

                                User? user = await _auth.signInMethod(
                                    email, password);

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
                            onPrimary: Colors.black54, // Set the text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0), // Set a smaller button border radius
                            ),
                            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), // Reduce button padding
                            side: BorderSide(
                              color: Colors.black, // Set the border color
                              width: 1.5, // Set the border width
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16.0, // Decrease font size for a slimmer look
                              fontWeight: FontWeight.normal,
                            ),
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