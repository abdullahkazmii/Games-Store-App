import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/auth_service.dart';

class signup extends StatefulWidget {
  static const String id='signup';

  const signup({super.key});


  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool _isSigningUp = false;
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
              image: AssetImage('images/spiderman1.jpg'),
              fit:BoxFit.cover
          )
      ),
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.3),

          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 30,),

            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, 'login'); // Navigate back to the previous page
            },
          ),
        ),

        backgroundColor: Colors.transparent,
        body: Stack( //to keep things organized
          children: [
            Container(
              color: Colors.white.withOpacity(0.2), // Adjust opacity as needed
            ),
            Container(
              padding: EdgeInsets.only(left: 33, top: 110),
              child: Text(
                'Create New\nAccount',
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
                      top: MediaQuery.of(context).size.height*0.30, right: 35, left: 35),
                  child:Form(
                    key: formkey,


                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white, // Set the text color
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.black ,
                            filled: true,
                            hintText: 'Enter Your Name',
                            hintStyle: TextStyle(
                              color: Colors.grey, // Set the hint text color
                            ),
                          ),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            // You can add more email validation logic if needed
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          controller: _emailnameController,
                          style: TextStyle(
                            color: Colors.white, // Set the text color
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.black ,
                            filled: true,
                            hintText: 'Enter Your Email',
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
                            hintText: 'Enter your Password',
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
                            }
                            String passwordPattern = r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{6,}$';
                            RegExp passwordRegex = RegExp(passwordPattern);

                              if (!passwordRegex.hasMatch(value)) {
                                return 'Password must contain at least 1 capital letter, 1 number, 1 special character, and be at least 6 characters long';
                              }
                              return null; // Return null for successful validation
                          },

                        ),
                        SizedBox(
                          height: 20,
                        ),

                        TextField(
                          style: TextStyle(
                            color: Colors.white, // Set the text color
                          ),
                          obscureText: true, //to hide
                          decoration: InputDecoration(
                            fillColor: Colors.black ,
                            filled: true,
                            hintText: 'Confirm Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3)
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey, // Set the hint text color
                            ),


                          ),
                        ),

                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              setState(() {
                                _isSigningUp = true;
                              });
                              String name = _usernameController.text;
                              String email = _emailnameController.text;
                              String password = _passwordnameController.text;

                              User? user = await _auth.signUpMethod(
                                  email, password);
                              setState(() {
                                _isSigningUp = false;
                              });

                              if (user != null) {
                                print("User is successfully created");
                                Navigator.pushNamed(context, 'login');
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey, // Set the button background color
                            onPrimary: Colors.black87, // Set the text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0), // Set a smaller button border radius
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 85.0), // Reduce button padding
                            side: BorderSide(
                              color: Colors.black, // Set the border color
                              width: 1.5, // Set the border width
                            ),
                          ),

                          child: _isSigningUp? CircularProgressIndicator(color: Colors.white,):  Text(
                            'Create your Account',
                            style: TextStyle(
                              fontSize: 16.0, // Decrease font size for a slimmer look
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
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