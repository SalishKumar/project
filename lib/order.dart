import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Color.fromRGBO(244, 75, 89, 1)),
          elevation: 0,
          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
          title: Text(
            "Orders",
            style: GoogleFonts.lato(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          bottom: TabBar(
              indicatorColor: Color.fromRGBO(244, 75, 89, 1),
              tabs: [
                Tab(
                  child: Text(
                  "Current Order",
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
                ),

                Tab(child: Text(
                  "Past Order",
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
                ),

              ]
          ),
        ),
//        body: ListView(
//          children: <Widget>[
//            Card(
//              elevation: 3,
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.all(Radius.circular(5)),
//                side: BorderSide(
//                  color: Colors.pink
//                )
//              ),
//              child: Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: ListTile(
//                  title: Text("Order number:220"),
//                  subtitle: Text("Bill:1290\nDate:6-6-2020"),
//                  trailing: Text("Status\nCancelled"),
//                ),
//              ),
//            ),
//          ],
//        ),
      ),
    );
  }
}
