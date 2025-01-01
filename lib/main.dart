import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:registration/firebase_options.dart';
import 'package:registration/login.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}
