import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginuicolors/home.dart';
import 'package:loginuicolors/login.dart';
import 'package:loginuicolors/mainpage.dart';
import 'package:loginuicolors/register.dart';
import 'register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'home': (context) => Homepage(),
      // 'mainpage': (context) => Mainpage(),
    },
  ));
}
