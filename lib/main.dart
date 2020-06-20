import 'package:flutter/material.dart';
import 'package:foodhubbb/Loader.dart';
import 'package:foodhubbb/editPass.dart';
import 'package:foodhubbb/foodPage.dart';
import 'package:foodhubbb/googleMaps.dart';
import 'package:foodhubbb/temp.dart';
import 'Login.dart';
import 'drive.dart';
import 'package:foodhubbb/SignUp.dart';
import 'home.dart';
import 'Cart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foodhubbb/Address.dart';
import 'addAddressForm.dart';
import 'order.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => Loader(),
        'drive':(context)=>drive(),
        'second': (context) => Login(),
        'third': (context) => SignUp(),
        'fourth': (context) => Home()
      },
    );
  }
}