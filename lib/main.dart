import 'package:flutter/material.dart';
import 'package:twitter/screens/login/initial_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/screens/login/interests_screen.dart';

void main() {
  runApp(const TwitterApp());
}

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const FaIcon(FontAwesomeIcons.twitter, size: 24),
          centerTitle: true,
        ),
        body: const InterestsScreen(),
      ),
    );
  }
}
