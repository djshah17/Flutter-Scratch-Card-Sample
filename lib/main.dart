import 'package:flutter/material.dart';
import 'package:flutterscratchcardsample/my_scratch_card_view_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScratchCardViewScreen(),
    );
  }
}
