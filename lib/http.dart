import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:foodhubbb/User.dart';

class database{
  String _name;
  String _email;
  String _phone;
  String _password;
  String _url;
  
  database(){
    _name = null;
    _email = null;
    _password = null;
    _phone = null;
    _url = "https://vibrant-millions.000webhostapp.com/Signup.php";
  }
  void setDetails(String name,String email,String phone,String password){
    _name = name;
    _email = email;
    _phone=phone;
    _password=password;
  }

  Future<String> createAccount()async{
      http.Response response = await http.post(_url,
          body: {
            "name":_name,
            "email":_email,
            "password":_password,
            "phone":_phone,

          }
      );
      return response.body;
  }
  Future<String> req()async{
      http.Response response = await http.post(
          "https://vibrant-millions.000webhostapp.com/checkUsername.php",
          body: {
            "name":_name,
            "email":_email,
            "phone":_phone
          }
      );
      return  await response.body;
  }
  Future<User> login(String email,String password)async{
      http.Response response = await http.post(
          "https://vibrant-millions.000webhostapp.com/login.php",
          body: {
            "email" :  email,
            "password": password,
          }
      );
      User user = User();
      if(response.body!='0') {

        user.setId(int.parse(jsonDecode(response.body)['cid']));
        user.setName(jsonDecode(response.body)['username']);
        user.setEmail(jsonDecode(response.body)['email']);
        user.matched=true;

      }
      else
        user.matched=false;
      return  await user;
  }
}