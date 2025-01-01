import 'package:flutter/material.dart';
import 'package:registration/login.dart';
import 'package:registration/profile.dart';
import 'package:registration/services/firebase_auth_service.dart';

class Registration extends StatefulWidget {
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Sign Up",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            "Create your account",
            style: TextStyle(color: Colors.black, fontSize: 10),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 38, 82, 104),
                ),
                hintText: "Username",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 38, 82, 104),
                  fontSize: 15,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 223, 190, 219),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(12),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  color: Color.fromARGB(255, 38, 82, 104),
                ),
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 38, 82, 104),
                  fontSize: 15,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 223, 190, 219),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(12),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: TextField(
              controller: passwordController,
              obscureText: true, // For password fields
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.password,
                  color: Color.fromARGB(255, 38, 82, 104),
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 38, 82, 104),
                  fontSize: 15,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 223, 190, 219),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(12),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: TextField(
              obscureText: true, // For password fields
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.password,
                  color: Color.fromARGB(255, 38, 82, 104),
                ),
                hintText: "Confirm Password",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 38, 82, 104),
                  fontSize: 15,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 223, 190, 219),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(12),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 76, 17, 78),
              padding: EdgeInsets.symmetric(horizontal: 130, vertical: 12),
            ),
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              await signup(
                  username: usernameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  context: context);
              setState(() {
                isLoading = false;
              });
            },
            child: isLoading
                ? CircularProgressIndicator()
                : Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
          ),
          SizedBox(
            height: 30,
          ),
          Text("or"),
          SizedBox(
            height: 15,
          ),
          Text("Already have an account?"),
          GestureDetector(
              onTap: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: Color.fromARGB(255, 3, 58, 85),
                ),
              )),
        ],
      ),
    );
  }
}
