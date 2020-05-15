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
      print(response.body);
      return response.body;
  }
  Future<String> req(String parameter,String value,String argu)async{
    if(value!=null && value !="") {
      http.Response response = await http.post(
          "https://vibrant-millions.000webhostapp.com/checkUsername.php",
          body: {
            "argu" :  argu,
            parameter: value,
          }
      );
      var data;
      if(response.body!='0') {
        data = json.decode(response.body);
        return "0";
      }

      return "1";
    }
    return "2";
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
        user.setName(jsonDecode(response.body)['name']);
        user.setEmail(jsonDecode(response.body)['email']);
        user.matched=true;

      }
      else
        user.matched=false;
      return user;
  }
}