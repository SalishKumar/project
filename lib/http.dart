import 'package:flutter/material.dart';
import 'package:foodhubbb/addressClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:foodhubbb/User.dart';
import 'alertDialog.dart';
import 'Food.dart';

class database{
  String _name;
  String _email;
  String _phone;
  String _password;
  String _url;
  BuildContext context;
  
  database(){
    _name = null;
    _email = null;
    _password = null;
    _phone = null;
    _url = "https://vibrant-millions.000webhostapp.com/Signup.php";
  }
  void setDetails(String name,String email,String phone,String password,BuildContext context){
    _name = name;
    _email = email;
    _phone=phone;
    _password=password;
    this.context = context;
  }

  Future<String> createAccount()async{
    http.Response response;
    try {
       response = await http.post(_url,
          body: {
            "name": _name,
            "email": _email,
            "password": _password,
            "phone": _phone,

          }
      );
    }catch(e){
      print("Hello");
      print(e);
    }
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
    http.Response response;
    try {
       response = await http.post(
          "https://vibrant-millions.000webhostapp.com/login.php",
          body: {
            "email": email,
            "password": password,
          }
      );
    }  catch(e){
      print(e);
    }
    if(response.statusCode!=200)
      print("Server");
      //showAlertDialog(context,"Server not responding try again letter");
      User user = User();
      if(response.body!='0') {

        user.setId(int.parse(jsonDecode(response.body)['cid']));
        user.setName(jsonDecode(response.body)['username']);
        user.setEmail(jsonDecode(response.body)['email']);
        user.setPhone(jsonDecode(response.body)['phone']);
        user.ssetPassword(jsonDecode(response.body)['password']);
        user.matched=true;

      }
      else
        user.matched=false;
      return  await user;
  }
   Future<http.Response> getCategory()async{
    http.Response response = await http.get(
        "https://vibrant-millions.000webhostapp.com/getCatogories.php"
    );
   return await response;
  }
  Future<dynamic> getMenu(String cat_id)async{
    if(cat_id=="")
      return "";
    http.Response response = await http.post(
        "https://vibrant-millions.000webhostapp.com/getMenu.php",
      body: {
          "cat_id":cat_id
      }
    );
    if(response.statusCode!=200) {
      //showAlertDialog(context, "Server not responding try again letter");
    }
    return await response;
  }
  Future<http.Response> getMenu2()async{
    http.Response response = await http.post(
        "https://vibrant-millions.000webhostapp.com/getMenu2.php"
    );

    return await response;
  }
  Future<String> getAddress(String id)async{
    http.Response response = await http.post(
        "https://vibrant-millions.000webhostapp.com/getAddresses.php",
      body: {
        "cid":id
      }
    );
    return response.body;
  }
  Future<String> getOrder(String id)async{
    http.Response response = await http.post(
        "https://vibrant-millions.000webhostapp.com/getOrders.php",
        body: {
          "cid":id
        }
    );
    return response.body;
  }
  Future<String> addAddress(String id,AddressClass address)async{
    http.Response response = await http.post(
        "https://vibrant-millions.000webhostapp.com/addAddress.php",
        body: {
          "cid":id,
          "address":address.address,
          "addressType":address.addressType
        }
    );
    print(response.body);
    return response.body;
  }
  Future<bool> updatePass(String name,String password)async{
       http.Response response = await http.post("https://vibrant-millions.000webhostapp.com/updatePassword.php",
          body: {
            "username":name,
            "password":password
          }
        );
     if(response.body=="1")
       return true;
     else
       return false;

  }
  Future<String> placeOrder(String cusID,String price,List<Food> cart,String address1,String addressType)async{
    String json = jsonEncode(cart);

    http.Response response = await http.post("https://vibrant-millions.000webhostapp.com/placeOrder.php",
        body: {
          "cusID":cusID,
          "price":price,
          "cart":json,
          "address":address1,
        }
    );
    print(response.body);
    if(response.statusCode!=200)
      return "0";
    return response.body;
  }
  Future<String> getMenuForSearch()async {
    http.Response response = await http.get("https://vibrant-millions.000webhostapp.com/getFoodForSearch.php");
    return response.body;
  }
}