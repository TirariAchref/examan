import 'package:examan/auth.dart';
import 'package:examan/nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         routes: {
           "/": (context) {
          return const Authentification();
        },
        "/home": (context) {
          return const NavigationTab();
        }
        
       
      }
    );
  }
}