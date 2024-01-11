import 'package:firebase_auth_app/auth.dart';
import 'package:firebase_auth_app/screens/login_screen.dart';
import 'package:firebase_auth_app/screens/home_screen.dart';
import 'package:firebase_auth_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //To allow the access of the authentication
  await Firebase.initializeApp();
  // also To allow the access of the authentication
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Auth(),
      routes: {
        '/': (context) => Auth(),
        'homeScreen': (context) => HomeScreen(),
        'signupScreen': (context) => const SignupScreen(),
        'loginScreen': (context) => const LoginScreen(),
      },
    );
  }
}
