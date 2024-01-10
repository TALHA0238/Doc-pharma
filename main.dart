// ignore_for_file: use_key_in_widget_constructors

//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'introduction_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Firebase Error: $e');
  }
  runApp(const MyApp());
}

class Firebase {
  static initializeApp() {}
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Fixed the constructor and added Key parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diabetes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroductionScreen(),
    );
  }
}
