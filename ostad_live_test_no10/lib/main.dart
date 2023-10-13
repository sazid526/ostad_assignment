import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_live_test_no10/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

