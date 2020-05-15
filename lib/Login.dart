

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:foodhubbb/home.dart';
import 'User.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  check email = check();
  User user = User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: new IconThemeData(color:Colors.white,),
        backgroundColor:  Color.fromRGBO(244, 75, 89, 0.9),
        actions: <Widget>[

        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipPath(
                    child: Container(
                      color:  Color.fromRGBO(244, 75, 89, 0.7),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                    ),
                    clipper: WaveClipperOne(flip: true),
                  ),
                  ClipPath(
                    child: Container(
                      color:  Color.fromRGBO(244, 75, 89, 0.7),
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                    ),
                    clipper: WaveClipperOne(flip: true),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 0, bottom: 0,left: 15),
                    child: Text(
                      "Login",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 50,color: Colors.white),
                    ),
                  ),

                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20,right: 20,top: 30),
                child: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (email){
                        user.setEmail(email);
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.pink
                              )
                          ),
                          labelText: "Email",
                          errorText: email.isvalid ? email.messege : email.messege,
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ),


                    TextField(
                      onChanged: (Password){
                        user.ssetPassword(Password);
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.pink
                              )
                          ),
                          labelText: "Password",
                        //  errorText: user.isNameValid(),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ),
                    InkWell(

                      onTap: ()async{


                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 80),
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
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black)
                          ),

                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "images/fb.png",
                                height: 30,
                                width: 30,
                              ),
                              Text(
                                "Login With facebook",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              )
                            ],
                          )
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class check{
  bool isvalid = true;
  String messege = "";

}