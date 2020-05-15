import 'package:flutter/material.dart';
import 'Login.dart';
import 'drive.dart';
import 'package:foodhubbb/SignUp.dart';
import 'home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String,WidgetBuilder>{
        '/':(context)=>drive(),
        'second':(context)=>Login(),
        'third':(context)=>SignUp(),
        'fourth':(context)=>Home(),
      },
    );
  }
}