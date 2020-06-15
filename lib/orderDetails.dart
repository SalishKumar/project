import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodhubbb/http.dart';
import 'package:foodhubbb/orderClass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Food.dart';
class OrderDetails extends StatefulWidget {
  OrderClass order = OrderClass();
  OrderDetails({this.order});
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  database db = database();
  Future<List> orderDetailList;
  @override
  void initState() {
    orderDetailList = buildList();
    super.initState();
  }
  Future<List> buildList()async{
     String data = await  db.getOrderDetails(widget.order.orderID);
     print(data);
     var data1 = jsonDecode(data);
     List<Food> temp = List();
     print(data);
     for(var i in data1){
       Food food =Food.fromfOOD();
       food.name=i["f_name"];
       food.quantity=int.parse(i["quantity"]);
       print(i["price"]);
       food.price =i["price"];
       temp.add(food);
     }
     return temp;
  }
  Widget getSubTotal(int length,int index){
        if(length-1==index){
          return Column(
            children: <Widget>[
              SizedBox(height: 50,),
              Divider(color: Colors.grey,thickness: 2,height: 0,),
              ListTile(
                title: Text("Total"),
                trailing: Text(widget.order.bill),
              ),
              Divider(color: Colors.grey,thickness: 2,height: 0,),

            ],
          );
        }
        return Container(
          height: 0,
        );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Color.fromRGBO(244, 75, 89, 1)),
        elevation: 0,
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        title: Text(
          "Orders Details",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // ignore: missing_return
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.pink
                )
              ),
              child: ListTile(
                title: Text("Order#"+widget.order.orderID),
                subtitle: Text("Bill:"+widget.order.bill+"\nDate:"+widget.order.date+"\nAddress:"+widget.order.address),
                trailing: Text("Status\n"+widget.order.status),
              ),
            ),
            SizedBox(height: 50,),
            FutureBuilder(
              future: orderDetailList,
                builder: (context,snapshot){
              if(!snapshot.hasData)
                return Container(height:MediaQuery.of(context).size.height/2,child: Center(child: CircularProgressIndicator(),));
              else{
                return Container(
                  height: ((snapshot.data.length.toDouble()+1)*100),

                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                      itemBuilder: (context,index){
                     return Column(
                       children: <Widget>[
                         Divider(color: Colors.grey,thickness: 2,height: 0,),
                         Card(
                         shape: RoundedRectangleBorder(
                         //  side: BorderSide
                         ),
                           child: ListTile(
                             title: Text(snapshot.data[index].quantity.toString()+" X "+snapshot.data[index].name),
                             trailing: Text(snapshot.data[index].price),
                           ),
                         ),
                         Divider(color: Colors.grey,thickness: 2,height: 0,),
                         getSubTotal(snapshot.data.length,index)
                       ],
                     );
                  }),
                );
              }
            })

          ],
        ),
      ),
    );
  }
}
