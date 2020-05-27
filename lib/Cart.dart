import 'dart:math';
import 'Food.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Cart extends StatefulWidget {
  List<Food> cart = List();
  Cart({this.cart});
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int cartTotal=0;
  @override
  void initState() {
    calBill();
    super.initState();
  }
  void calBill(){
    cartTotal=0;
    for(var i in widget.cart){
      cartTotal+=i.totalPrice;
    }
  }
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
        actions: <Widget>[
          Center(child: Padding(padding:EdgeInsets.only(right: 10),child: Text("RS "+cartTotal.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: widget.cart.length.toDouble()*100,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.cart.length,
                  itemBuilder: (context,int index){
                    return Container(
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                title: AutoSizeText(widget.cart[index].name,maxLines: 1,),
                                subtitle: AutoSizeText("Quantity: "+widget.cart[index].quantity.toString()+"\nRs "+widget.cart[index].totalPrice.toString(),maxLines: 2),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/1.6-20,
                              color: Colors.white,
                              child: ListTile(
                                leading: IconButton(
                                    icon: Icon(Icons.keyboard_arrow_up),
                                    onPressed: (){
                                      setState(() {
                                        widget.cart[index].incQuantity();
                                        calBill();
                                      });
                                    }
                                ),
                                title: Text(""),
                                subtitle: Text(""),
                                trailing: IconButton(
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    onPressed: (){
                                      setState(() {
                                        if(widget.cart[index].quantity==1)
                                          widget.cart.removeAt(index);
                                        else
                                          widget.cart[index].decQuantity();
                                        calBill();
                                        if(widget.cart.length==0)
                                            Navigator.pop(context);
                                      });
                                    }
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
            SizedBox(height: 10,),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.red
                ),
              ),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Address"),
                subtitle: Text("SAHGDHJASGDJHASGDHJASG"),
                trailing: IconButton(icon: Icon(Icons.edit), onPressed: null),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                        "Place order",
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
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
