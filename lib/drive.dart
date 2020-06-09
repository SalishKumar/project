import 'package:flutter/material.dart';
import 'package:foodhubbb/Login.dart';
import 'package:foodhubbb/http.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:convert';
import 'main.dart';
import 'home.dart';
import 'package:foodhubbb/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
class drive extends StatefulWidget {
  @override
  _driveState createState() => _driveState();
}

class _driveState extends State<drive> {
  database db =database();
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: spinner,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(onPressed: ()async{
                bool result =  await checkIfUserHasLoggedInBefore();
                if(result){
                  setState(() {
                    spinner = true;
                  });
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  String email = preferences.getString("email");
                  String pass = preferences.getString("pass");
                  User currentUser =   await db.login(email, pass);
                  setState(() {
                    spinner = false;
                  });
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>Home(user: currentUser,),
                      ));
                }
                else {
                  Navigator.pushNamed(context, 'second');
                }

            //      apicall();
              },
              child: Text("Login"),),
              RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "third");

                },
                child: Text("Signup"),)
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> checkIfUserHasLoggedInBefore()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString("email");
    print(email);
    if(email==null)
      return false;
    return true;

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
