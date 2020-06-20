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
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset("images/logo.jpeg"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Colors.pink,
                  onPressed: (){
                  Navigator.pushNamed(context, 'second');
                        apicall();
                },
                  child: Text("Login",style: TextStyle(color: Colors.white)),),
                RaisedButton(
                  color: Colors.pink,
                  onPressed: ()async{

                    Navigator.pushNamed(context, "third");
                  },
                  child: Text(
                    "Signup",style: TextStyle(color: Colors.white),),)
              ],
            )
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
