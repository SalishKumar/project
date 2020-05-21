import 'package:flutter/material.dart';
import 'package:foodhubbb/SignUp.dart';
import 'package:foodhubbb/User.dart';
import 'alertDialog.dart';
import 'http.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class EditForm extends StatefulWidget {
  User originalUser = User();
  EditForm({@required this.originalUser});
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
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
          "Account Setting",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
              child: TextField(
                onChanged: (val){
                  oldPass = val;
                },
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.pink
                        )
                    ),
                    labelText: "Old Password",
                    errorText: "",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    )
                ),
                obscureText: true,
              ),
            ),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(onPressed: ()async{
                    if(oldPass=="" ||oldPass==null ||user.getPassword()==""||user.getPassword()==null||pass == null||pass=="")
                      showAlertDialog(context, "Fill All The Respective Fields");
                    else if(oldPass!=widget.originalUser.getPassword())
                      showAlertDialog(context,"Wrong Password");
                    else if(user.getPassword() == oldPass)
                      showAlertDialog(context,"Password matched with old password");
                    else if(user.isPasswordValid() && checkPass()){
                      setState(() {
                        spinner=true;
                      });
                     bool result = await db.updatePass(widget.originalUser.getName(), user.getPassword());
                     setState(() {
                       spinner=false;
                     });
                     if(result){
                       widget.originalUser.ssetPassword(user.getPassword());
                    await   messageAlert(context);
                     }
                     else{
                       showAlertDialog(context, "Try again letter");
                     }
                    }
                },
                  child: Text("Update"),
                ),
                RaisedButton(onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
