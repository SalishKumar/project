import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodhubbb/alertDialog.dart';
import 'package:foodhubbb/codeScreen.dart';
import 'package:foodhubbb/http.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool spinner = false;
  String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        iconTheme: new IconThemeData(color: Color.fromRGBO(244, 75, 89, 1)),
        elevation: 0,
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        title: Text(
          "Forget Password",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                onChanged: (email1){
                  setState(() {
                      this.email = email1;

                  });
                },
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.pink
                        )
                    ),
                    labelText: "Email",
                    hintText: "Enter your mail to authenticate",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                  onTap: ()async{
                    setState(() {
                      spinner=true;
                    });
                    database db = database();
                    String result = await db.recoverPassword(email);
                    setState(() {
                      spinner=false;
                    });
                    if(result =="Wrong email"){
                      showAlertDialog(context, "This email is not registered!");
                    }
                    else{
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>CodeScreen(code: result,email: email,))
                      );
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      color:   Color.fromRGBO(244, 75, 89, 1),
                      margin: EdgeInsets.only(top: 20),
                      child: Center(
                          child: Text(
                            "Authenticate",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white
                            ),
                          )
                      ),
                    ),
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
