import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodhubbb/http.dart';
import 'package:google_fonts/google_fonts.dart';
import 'orderClass.dart';
class Order extends StatefulWidget {
  String id;
  Order({this.id});
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  database db = database();

  Future<List<OrderClass>> select1;

  Future<List<OrderClass>> select2;

  Future<List<OrderClass>> fillList(String con1,String con2)async{
   String result =  await db.getOrder(widget.id);
   var data = jsonDecode(result);
   List<OrderClass> temp1=List();
   for(var i in data){
     if(i["status"]==con1 || i["status"]==con2){
       temp1.add(
           OrderClass(
             status: i["status"],
             bill: i["totalPrice"],
             date: i["date"],
             orderID: i["orderID"],
             address: i["address1"]
           ));
     }
   }
   return temp1;
  }

  @override
  void initState() {
    select1=fillList("pending","on the way");
    select2=fillList("delivered","cancelled");
    super.initState();
  }
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

              ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FutureBuilder(
                future: select1,
                builder: (BuildContext context,
                    AsyncSnapshot snapshot) {
                  if(!snapshot.hasData)
                    return Center(child: CircularProgressIndicator(),);
                  if(snapshot.hasData){
                    if(snapshot.data.length==0)
                      return Center(child: Text("No orders yet!"));
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index){
                          return Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text("Order#"+snapshot.data[index].orderID),
                          subtitle: Text("Bill:"+snapshot.data[index].bill+"\nDate:"+snapshot.data[index].date+"\nAddress:"+snapshot.data[index].address),
                                  trailing: Text("Status\n"+snapshot.data[index].status),
                                ),
                              ),
                              Divider(color: Colors.pink,)
                            ],
                          );
                        });
                  }
                }
            ),
            FutureBuilder(
                future: select2,
                builder: (BuildContext context,
                    AsyncSnapshot snapshot) {
                  if(!snapshot.hasData)
                    return Center(child: CircularProgressIndicator(),);
                  if(snapshot.hasData){
                    if(snapshot.data.length==0)
                      return Center(child: Text("No Past orders yet!"));
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index){
                          return Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text("Order#"+snapshot.data[index].orderID),
                                  subtitle: Text("Bill:"+snapshot.data[index].bill+"\nDate:"+snapshot.data[index].date+"\nAddress:"+snapshot.data[index].address),
                                  trailing: Text("Status\n"+snapshot.data[index].status),
                                ),
                              ),
                              Divider(color: Colors.pink,)
                            ],
                          );
                        });
                  }
                }
            ),
          ],
        )
      ),
    );
  }
}
