import 'package:flutter/material.dart';
import 'User.dart';
import 'package:google_fonts/google_fonts.dart';
import 'editForm.dart';

class editProfile extends StatefulWidget {
  User user = User();

  editProfile({this.user});

  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Color.fromRGBO(244, 75, 89, 1)),
        elevation: 0,
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        title: Text(
          "Account Setting",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(238, 83, 84, 1),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      minRadius: 50,
                      child: Icon(
                        Icons.person,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.user.getName(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.getName()),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    title: Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.getEmail()),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    title: Text(
                      "Phone",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.getPhone()),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                      title: Text(
                        "Password",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("**********"),
                      trailing: InkWell(child: Icon(Icons.add,color: Colors.red,),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>EditForm(originalUser: widget.user,))
                          );

                        },
                      ),
                    ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
