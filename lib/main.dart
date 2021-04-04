import 'package:flutter/material.dart';
import 'package:shared_perference/pages/home_page.dart';
import 'package:shared_perference/pages/signin_page.dart';
import 'package:shared_perference/pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignIn(),
      routes: {
        SignIn.id: (context) => SignIn(),
        HomePage.id: (context) => HomePage(),
        SignUp.id: (context) => SignUp(),
      },
    );
  }
}

