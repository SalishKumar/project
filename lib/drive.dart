import 'package:flutter/material.dart';
import 'package:foodhubbb/Login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class drive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: (){
       Navigator.pushNamed(context, 'second');
          //      apicall();
            },
            child: Text("Login"),),
            RaisedButton(
              onPressed: ()async{

                Navigator.pushNamed(context, "third");
              },
              child: Text("Signup"),)
          ],
        ),
      ),
    );
  }
  Future apicall(){
    String name = "ajay karo";
    var url = 'https://vibrant-millions.000webhostapp.com/get.php';
    try {
        http.post(url,
          body: {
          "name":name
          }
      );
       print("hello");
    }catch(e){
      print(e);
    }
//    http.post(url, body: {
//      "username": _usernameController.text,
//      "firstname": _firstnameController.text,
//      "gender": _genderController.text,
//      "lastname": _lastnameController.text,
//      "password": _passwordController.text
//    });

  }
}
