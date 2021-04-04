import 'package:flutter/material.dart';
import 'package:shared_perference/model/account_model.dart';
import 'package:shared_perference/pages/signin_page.dart';
import 'package:shared_perference/services/account_service.dart';
class SignUp extends StatefulWidget {
  static final String id = "signup_page";
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  void doSignup () {
    String name = _nameController.text.toString().trim();
    String email = _emailController.text.toString().trim();
    String phone = _phoneController.text.toString().trim();
    String password = _passwordController.text.toString().trim();
    String confirm = _confirmController.text.toString().trim();
    Account account = Account.from(name: name, email: email, phone: phone, password: password, confirm: confirm);
    PrefsAccount.storeAccount(account);
    PrefsAccount.loadAccount().then((account) => {
      print(account.name),
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            // ARROW
            Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
             child: Row(
               children: [
                 IconButton(
                 icon: Icon(Icons.arrow_back_outlined, color: Colors.black,),
                   iconSize: 30,
                 ),
               ],
             ),
            ),
            SizedBox(height: 40,),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Let's Get Started !", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                  SizedBox(height: 10,),
                  Text("Creat an account to get more information", style: TextStyle(color: Colors.grey, fontSize: 15),),
                  SizedBox(height: 50,),
                  // NAME
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _nameController,
                      style: TextStyle(color: Colors.blue.shade900),
                      decoration: InputDecoration(
                          hintText: "Name",
                          prefixIcon: Icon(Icons.person_outline, color: Colors.blue.shade900,),
                          border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                        ),

                      ),

                    ),
                  ),
                  SizedBox(height: 20,),
                  // EMAIL
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _emailController,
                      style: TextStyle(color: Colors.blue.shade900),
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email, color: Colors.blue.shade900,),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  // PHONE
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _phoneController,
                      style: TextStyle(color: Colors.blue.shade900),
                      decoration: InputDecoration(
                        hintText: "Phone",
                        prefixIcon: Icon(Icons.phone_iphone, color: Colors.blue.shade900,),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  // PASSWORD
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.blue.shade900),
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock_open, color: Colors.blue.shade900,),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blue.shade900,width: 2),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  // CONFIRM
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: _confirmController,
                  style: TextStyle(color: Colors.blue.shade900),
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock_open, color: Colors.blue.shade900,),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.blue.shade900,width: 2),
                      )
                  ),
                ),
              ),
                  SizedBox(height: 40,),
                  // SIGN UP BUTTON
                  Container(
                    height: 55,
                    width: 200,
                    //color: Colors.indigo,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue.shade900,
                    ),
                    child: FlatButton(
                      onPressed: doSignup,
                      child: Center (
                        child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20),),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  // HAVE AN ACCOUNT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: TextStyle(color: Colors.grey, fontSize: 15),),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, SignIn.id);
                        },
                        child: Text("Sign In", style: TextStyle(color: Colors.blue.shade900, fontSize: 15),),
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
