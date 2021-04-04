

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:shared_perference/model/user_model.dart';
import 'package:shared_perference/pages/signup_page.dart';
import 'package:shared_perference/services/prefs_service.dart';

class SignIn extends StatefulWidget {
  static final String id = "signin_page";
  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void _doSignin () {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user = User.from(email: email, password: password);
    Prefs.storeUser(user);
    Prefs.loadUser().then((user) => {
      print (user.email),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Container(
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text("We care your home", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold ),),
              SizedBox(height: 5,),
              Text("Login to get more information", style: TextStyle(color: Colors.grey), ),
              SizedBox(height: 20,),
              //email
              Container(
                height: 45,
                //width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: emailController,
                  style: TextStyle(color: Colors.blue.shade900),
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.person, color: Colors.blue.shade900,),
                      border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //password
              Container(
                height: 45,
                //width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.blue.shade900),
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock_open_outlined, color: Colors.blue.shade900,),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot password?"),
                ],
              ),
              SizedBox(height: 20,),
              //login
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue.shade900,
                ),
                child: FlatButton(
                  onPressed: _doSignin,
                  child: Center(
                    child: Text("LOG IN", style: TextStyle(color: Colors.white),),
                  ),
                ),

              ),
              SizedBox(height: 30,),
              Text("Or connect using", style: TextStyle(color: Colors.grey),),
              SizedBox(height: 10,),
              //facebook&Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //#facebook
                  Container(
                   height: 50,
                   width: 150,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: SignInButton(
                     Buttons.Facebook,
                     onPressed: (){},
                     text: "Facebook",
                   ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    height: 50,
                    width: 150,

                    child: SignInButton(
                      Buttons.LinkedIn,
                      onPressed: (){},
                      text: "LinkedIn",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              // have account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, SignUp.id);
                    },
                    child: Text("Sign Up", style: TextStyle(color: Colors.blue.shade900),),
                  ),
                ],
              ),

            ]
        ),
      ),
    );
  }
}
