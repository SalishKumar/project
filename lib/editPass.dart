import 'package:flutter/material.dart';
import 'package:foodhubbb/SignUp.dart';
import 'package:foodhubbb/User.dart';
import 'alertDialog.dart';
import 'http.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EditPass1 extends StatefulWidget {
  String email;
  EditPass1({this.email});
  @override
  _EditPass1State createState() => _EditPass1State();
}

class _EditPass1State extends State<EditPass1> {
  database db = database();
  bool checkPass(){
    if(user.getPassword()=="" || user.getPassword()==null)
      return true;
    else if(pass=="" || pass==null)
      return true;
    return user.getPassword()==pass;
  }
  User user = User();
  String oldPass,pass;
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        iconTheme: new IconThemeData(color: Color.fromRGBO(244, 75, 89, 1)),
        elevation: 0,
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        title: Text(
          "Recover Password",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: TextField(
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    user.ssetPassword(val);
                  });
                },
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.pink
                        )
                    ),
                    labelText: "New Password",
                    errorText: user.isPasswordValid()?"":"Password should be alteast 6 character long with \none alphabet and one number",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: TextField(
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    pass = val;
                  });
                },
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.pink
                        )
                    ),
                    labelText: "Re-Enter Password",
                    errorText:checkPass()?"":"Password not matched",
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
                  if(checkPass()) {
                    setState(() {
                      spinner=true;
                    });
                    bool result = await  db.updatePassAfterAuthentication(widget.email, user.getPassword());
                    setState(() {
                      spinner=false;
                    });
                    if(result){
                        showAlertDialog2(context, "Account recovered Successfully");
                    }
                    else
                    showAlertDialog(context, "Unknown error occured try again letter");
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
                          "Updates ",
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
            ),
          ],
        ),
      ),
    );
  }
}
