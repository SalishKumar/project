import 'package:foodhubbb/drive.dart';
import 'package:foodhubbb/forgetPassword.dart';
import 'package:foodhubbb/home.dart';

import 'http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'alertDialog.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool eye = true;
  database db = database();
  User user = User();
  bool spinner = false;
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
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: SingleChildScrollView(
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

                        obscureText: eye,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.grey,), onPressed: (){
                            setState(() {
                              if(eye)
                                eye=false;
                              else
                                eye=true;
                            });
                          }),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.pink
                                )
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                        },
                        child: Container(
                          alignment: Alignment.topRight,
                            child: Text("Forget password?",style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline,),)
                        ),
                      ),
                      InkWell(
                        onTap: ()async{
                          setState(() {
                            spinner = true;
                          });
                         User currentUser =   await db.login(user.getEmail(), user.getPassword());
                         setState(() {
                           spinner = false;
                         });

                         if(currentUser.matched==true){
                           SharedPreferences preferences = await SharedPreferences.getInstance();
                           preferences.setString("email",currentUser.getEmail());
                           preferences.setString("pass",currentUser.getPassword());
                           Navigator.popUntil(context, ModalRoute.withName('/'));
                           Navigator.pushReplacement(
                               context,
                               MaterialPageRoute(
                                 builder: (context) =>Home(user: currentUser,),
                               ));
                         }
                         else{
                           spinner=false;
                           showAlertDialog(context,"Invalid credentials");
                         }

                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 100),
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

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}