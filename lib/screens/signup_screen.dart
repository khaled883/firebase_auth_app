// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ConfirmpasswordController = TextEditingController();

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.of(context).pushNamed('/');
    } else {
      //a dialog of an alert message will pop up
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _ConfirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void openSigninScreen() {
    Navigator.of(context).pushReplacementNamed('loginScreen');
  }

  @override
  // dispose is used to disable the controllers when they aint used
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ConfirmpasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        //a safeAsrea widget used to make the elements and column far away
        //of the screen borders
        child: Center(
          //center widget used to make the column sumetrical in the screen
          child: SingleChildScrollView(
            //singleChildScrollView to prevent the
            //black/yellow from not scrolling
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //main axis alignment used tomake the column centered in the middle of the screen
              children: [
                //image
                Image.asset(
                  'images/glitch.png',
                  height: 200,
                ),
                SizedBox(height: 20),
                //title
                Text(
                  'Sign up',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //subtitle
                Text(
                  'Let`s sign up',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 18,
                  ),
                ),
                //Email Textfield
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        //this is the controller property we use to store the email from the text
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                //Password Textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        //this is the controller property we use to store the password from the text
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                //conform Password Textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        //this is the controller property we use to store the password from the text
                        controller: _ConfirmpasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                //Sign up button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    //this is the sign in action when tapping the button(implemented up there)
                    onTap: signUp,
                    child: Container(
                      //this is the sign in button(Container)>>>>>>>
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 29, 15, 120),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'SIGN Up',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                //Sign up text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      //GestureDetector converts any widget into a button
                      onTap:
                          openSigninScreen, //the method to push the signup screen(up there)
                      child: Text(
                        'SIGN IN HERE',
                        style: GoogleFonts.robotoCondensed(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 143, 17, 140),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
