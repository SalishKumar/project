import 'package:flutter/material.dart';
import 'package:foodhubbb/alertDialog.dart';
import 'package:foodhubbb/http.dart';
import 'package:google_fonts/google_fonts.dart';
import 'editPass.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class CodeScreen extends StatefulWidget {
  String code,email;
  CodeScreen({this.code,this.email});
  @override
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  bool spinner = false;
  String code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        iconTheme: new IconThemeData(color: Color.fromRGBO(244, 75, 89, 1)),
        elevation: 0,
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        title: Text(
          "Authentication",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Column(
          children: <Widget>[
            Center(child: Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Text("A verification code has been sent to your given email"),
            )),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                onChanged: (code1){
                  setState(() {
                    this.code = code1;

                  });
                },
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.pink
                        )
                    ),
                    labelText: "Code",
                    hintText: "Enter your code to authenticate",
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
                    if(code==null)
                      code="";
                    if(code==""){
                      showAlertDialog1(context, "Code empty");
                      return;
                    }
                    if(code==widget.code){
                      Navigator.popUntil(context, ModalRoute.withName("second"));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>EditPass1(email: widget.email,)));
                    }
                    else{
                      showAlertDialog1(context, "Invalid credientials");
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
