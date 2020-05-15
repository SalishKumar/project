import 'Login.dart';
import 'alertDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'http.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'User.dart';
import 'Login.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  database db = database();
  check email = check();
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
                        "Signup",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 50,color: Colors.white),
                      ),
                    ),

                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    children: <Widget>[
                      TextField(

                        onChanged: (Username){
                              setState(() {
                                user.setName(Username);

                              });
                        },
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:  Colors.pink,
                                )
                            ),
                            labelText: "Username",
                           errorText:user.isNameValid()?"":"Invalid username",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      TextField(
                        onChanged: (email){
                          setState(() {
                            user.setEmail(email);
                          });
                        },
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.pink
                                )
                            ),
                            labelText: "Email",
                            errorText: user.isEmailValid() ? "": "Invalid email",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      TextField(
                        onChanged: (phone){
                          setState(() {
                            user.setPhone(phone);
                          });
                        },
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.pink
                                )
                            ),
                            labelText: "Phone",
                           errorText: user.isPhoneValid()?"":"Invalid phone number",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),

                      TextField(
                        onChanged: (Password){
                          setState(() {
                            user.ssetPassword(Password);
                          });
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.pink
                                )
                            ),
                            labelText: "Password",
                            errorText: user.isPasswordValid()?"":"Password should be alteast 6 character long with \none alphabet and one number",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      InkWell(
                        onTap: ()async{

                          db.setDetails(user.getName(), user.getEmail(), user.getPhone(), user.getPassword());
                          setState(() {
                            spinner=true;
                          });
                          String result = await db.req("name", user.getName(),"username");
                         setState(() {
                           spinner=false;
                         });
                          if(result=="2"){
                            showAlertDialog(context, "Username field is empty.");
                            return;
                          }
                          else if(result=="0"){
                            showAlertDialog(context, "Username already exist.");
                            return;
                          }
                           result = await db.req("name", user.getEmail(),"email");
                          if(result=="2"){
                            showAlertDialog(context, "Email field is empty.");
                            return;
                          }
                          else if(result=="0"){
                            showAlertDialog(context, "Email already exist.");
                            return;
                          }
                          result = await db.req("name", user.getPhone(),"phone");
                          if(result=="2"){
                            showAlertDialog(context, "Phone field is empty.");
                          }
                          else if(result=="0"){
                            showAlertDialog(context, "Phone already exist.");
                          }
                          if(user.isNameValid()&&user.isPasswordValid()&&user.isPhoneValid()&&user.isEmailValid()) {
                            db.createAccount();
                            Navigator.pushNamed(context, "second");
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
                                  "Sign Up",
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
                                  "Sign up With facebook",
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
      ),
    );
  }
}
class check{
  bool isvalid = true;
  String messege = "";

}
