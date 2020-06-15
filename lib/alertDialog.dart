import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodhubbb/http.dart';
import 'dart:io';
import 'package:foodhubbb/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
showAlertDialog(BuildContext context,String sms) {
  if(Platform.isAndroid) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text("$sms"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  else if(Platform.isIOS){
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Error'),
          content: Text(sms),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
showAlertDialog1(BuildContext context,String sms) {

  if(Platform.isAndroid){
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Message"),
      content: Text("$sms"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

  }
  else if(Platform.isIOS){
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Message'),
          content: Text(sms),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

  }
}
showAlertDialog2(BuildContext context,String sms) {

  if(Platform.isAndroid){
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, "second");
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Message"),
      content: Text("$sms"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

  }
  else if(Platform.isIOS){
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Message'),
          content: Text(sms),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Okay'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, "second");
              },
            ),
          ],
        );
      },
    );

  }
}

 logoutAlertDialog(BuildContext context) {
  if(Platform.isAndroid){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text("Message"),
          content:  Text("Are you sure you want to logout?"),
          actions: <Widget>[
            FlatButton(
              child:  Text("okay"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child:  Text("Logout"),
              onPressed: ()async {
                SharedPreferences preferences = await SharedPreferences.getInstance();
                preferences.remove("email");
                preferences.remove("pass");
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, "/");
              },
            ),

          ],
        );
      },
    );
  }
  else if(Platform.isIOS){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Message"),
          content: Text("Are you sure you want to logout?"),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: (){
                Navigator.of(context).pop();
              },
                child: Text("Okay"),
            ),
            CupertinoDialogAction(
              onPressed: ()async{
                SharedPreferences preferences = await SharedPreferences.getInstance();
                preferences.remove("email");
                preferences.remove("pass");
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, "/");
              },
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}
deliveryAlertDialog(BuildContext context,String orderID) {
  database db = database();
  if(Platform.isAndroid){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text("Confirmation"),
          content:  Text("Are you sure your food is delieverd?"),
          actions: <Widget>[
            FlatButton(
              child:  Text("Yes"),
              onPressed: () async {
                String result = await db.makeOrderDeliver(orderID);
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child:  Text("No"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

          ],
        );
      },
    );
  }
  else if(Platform.isIOS){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Confirmation"),
          content:  Text("Are you sure your food is delieverd?"),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: ()async{
                String result = await db.makeOrderDeliver(orderID);
                Navigator.pop(context);

              },
              child: Text("Yes"),
            ),
            CupertinoDialogAction(
              onPressed: (){
                Navigator.pop(context);

              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }
}
void messageAlert(BuildContext context) {
  if(Platform.isAndroid) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text("Message"),
          content:  Text("Password changed successfully"),
          actions: <Widget>[
            FlatButton(
              child:  Text("okay"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  else if(Platform.isIOS){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Message"),
          content: Text("Password changed successfully"),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("Okay"),
            ),
          ],
        );
      },
    );
  }
}