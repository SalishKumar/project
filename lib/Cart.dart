import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Color.fromRGBO(244, 75, 89, 1)),
        elevation: 0,
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        title: Text(
          "Cart",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.red
                  )
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.6,
                      color: Colors.white,
                      child: ListTile(
                        leading:Image.asset("images/food1.png"),
                        title: AutoSizeText("Food name",maxLines: 1,),
                        subtitle: AutoSizeText("Quantity 2\nRs 300",maxLines: 2),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/1.6-20,
                      color: Colors.white,
                      child: ListTile(
                          leading: IconButton(icon: Icon(Icons.keyboard_arrow_up), onPressed: null),
                        title: Text(""),
                        subtitle: Text(""),
                        trailing: IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: null),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.red
                    )
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.6,
                      color: Colors.white,
                      child: ListTile(
                        leading:Image.asset("images/food1.png"),
                        title: AutoSizeText("Food name",maxLines: 1,),
                        subtitle: AutoSizeText("Quantity 2\nRs 300",maxLines: 2),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/1.6-20,
                      color: Colors.white,
                      child: ListTile(
                        leading: IconButton(icon: Icon(Icons.keyboard_arrow_up), onPressed: null),
                        title: Text(""),
                        subtitle: Text(""),
                        trailing: IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: null),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.red
                    )
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.6,
                      color: Colors.white,
                      child: ListTile(
                        leading:Image.asset("images/food1.png"),
                        title: AutoSizeText("Food name",maxLines: 1,),
                        subtitle: AutoSizeText("Quantity 2\nRs 300",maxLines: 2),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/1.6-20,
                      color: Colors.white,
                      child: ListTile(
                        leading: IconButton(icon: Icon(Icons.keyboard_arrow_up), onPressed: null),
                        title: Text(""),
                        subtitle: Text(""),
                        trailing: IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: null),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.red
                    )
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.6,
                      color: Colors.white,
                      child: ListTile(
                        leading:Image.asset("images/food1.png"),
                        title: AutoSizeText("Food name",maxLines: 1,),
                        subtitle: AutoSizeText("Quantity 2\nRs 300",maxLines: 2),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/1.6-20,
                      color: Colors.white,
                      child: ListTile(
                        leading: IconButton(icon: Icon(Icons.keyboard_arrow_up), onPressed: null),
                        title: Text(""),
                        subtitle: Text(""),
                        trailing: IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: null),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.red
                    )
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.6,
                      color: Colors.white,
                      child: ListTile(
                        leading:Image.asset("images/food1.png"),
                        title: AutoSizeText("Food name",maxLines: 1,),
                        subtitle: AutoSizeText("Quantity 2\nRs 300",maxLines: 2),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/1.6-20,
                      color: Colors.white,
                      child: ListTile(
                        leading: IconButton(icon: Icon(Icons.keyboard_arrow_up), onPressed: null),
                        title: Text(""),
                        subtitle: Text(""),
                        trailing: IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: null),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.red
                    )
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.6,
                      color: Colors.white,
                      child: ListTile(
                        leading:Image.asset("images/food1.png"),
                        title: AutoSizeText("Food name",maxLines: 1,),
                        subtitle: AutoSizeText("Quantity 2\nRs 300",maxLines: 2),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/1.6-20,
                      color: Colors.white,
                      child: ListTile(
                        leading: IconButton(icon: Icon(Icons.keyboard_arrow_up), onPressed: null),
                        title: Text(""),
                        subtitle: Text(""),
                        trailing: IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: null),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.red
                    )
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.6,
                      color: Colors.white,
                      child: ListTile(
                        leading:Image.asset("images/food1.png"),
                        title: AutoSizeText("Food name",maxLines: 1,),
                        subtitle: AutoSizeText("Quantity 2\nRs 300",maxLines: 2),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/1.6-20,
                      color: Colors.white,
                      child: ListTile(
                        leading: IconButton(icon: Icon(Icons.keyboard_arrow_up), onPressed: null),
                        title: Text(""),
                        subtitle: Text(""),
                        trailing: IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: null),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.red
                    )
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.6,
                      color: Colors.white,
                      child: ListTile(
                        leading:Image.asset("images/food1.png"),
                        title: AutoSizeText("Food name",maxLines: 1,),
                        subtitle: AutoSizeText("Quantity 2\nRs 300",maxLines: 2),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/1.6-20,
                      color: Colors.white,
                      child: ListTile(
                        leading: IconButton(icon: Icon(Icons.keyboard_arrow_up), onPressed: null),
                        title: Text(""),
                        subtitle: Text(""),
                        trailing: IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: null),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.red
                    )
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.6,
                      color: Colors.white,
                      child: ListTile(
                        leading:Image.asset("images/food1.png"),
                        title: AutoSizeText("Food name",maxLines: 1,),
                        subtitle: AutoSizeText("Quantity 2\nRs 300",maxLines: 2),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/1.6-20,
                      color: Colors.white,
                      child: ListTile(
                        leading: IconButton(icon: Icon(Icons.keyboard_arrow_up), onPressed: null),
                        title: Text(""),
                        subtitle: Text(""),
                        trailing: IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: null),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.red
                    )
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.6,
                      color: Colors.white,
                      child: ListTile(
                        leading:Image.asset("images/food1.png"),
                        title: AutoSizeText("Food name",maxLines: 1,),
                        subtitle: AutoSizeText("Quantity 2\nRs 300",maxLines: 2),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/1.6-20,
                      color: Colors.white,
                      child: ListTile(
                        leading: IconButton(icon: Icon(Icons.keyboard_arrow_up), onPressed: null),
                        title: Text(""),
                        subtitle: Text(""),
                        trailing: IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: null),

                      ),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
