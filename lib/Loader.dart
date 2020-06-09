import 'package:flutter/material.dart';
import 'package:foodhubbb/home.dart';
import 'User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foodhubbb/http.dart';
class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  void initState() {
    checkIfUserHasLoggedInBefore();
    super.initState();
  }
  checkIfUserHasLoggedInBefore()async{
    database db =database();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool result;
    if(preferences.getString("email")==null){
      result= false;
    }
    else{
      result = true;
    }
    if(result){

      String email = preferences.getString("email");
      String pass = preferences.getString("pass");
      User currentUser =   await db.login(email, pass);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>Home(user: currentUser,),
          ));
    }
    else {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushNamed(context, 'drive');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Image.asset("images/logo.jpeg"),
      ),
    );
  }
}
