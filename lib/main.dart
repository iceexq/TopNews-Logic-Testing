import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logical_frontend/states/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logical Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.mitrTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryTextTheme: GoogleFonts.mitrTextTheme(
          Theme.of(context).primaryTextTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
