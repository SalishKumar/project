import 'dart:convert';
import 'alertDialog.dart';
import 'package:flutter/material.dart';
import 'package:foodhubbb/http.dart';
import 'package:foodhubbb/orderDetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'orderClass.dart';
class Order extends StatefulWidget {
  String id;
  Order({this.id});
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  Widget makeTile(String orderID,String Bill,String Date,String addresss,String status){

    if(status=="pending") {
      return  Column(
        children: <Widget>[
          // ignore: missing_return
          Padding(
              padding: const EdgeInsets.all(8.0),
              child:ListTile(
                title: Text("Order#" + orderID),
                subtitle: Text(
                    "Bill:" + Bill + "\nDate:" + Date + "\nAddress:" + addresss),
                trailing: Container(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(status,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ),
              )
          ),
          Divider(color: Colors.pink,)
        ],
      );
    }
    return  Column(
      children: <Widget>[
        // ignore: missing_return
        Padding(
            padding: const EdgeInsets.all(8.0),
            child:ListTile(
              title: Text("Order#" + orderID),
              subtitle: Text(
                  "Bill:" + Bill + "\nDate:" + Date + "\nAddress:" + addresss),
              trailing: GestureDetector(
                onTap: (){
                  setState(() async{
                    await deliveryAlertDialog(context,orderID);
                  });
                  setState(() {

                  });
                },
                child: Container(

                  color: Colors.pink,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(status,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            )
        ),
        Divider(color: Colors.pink,)
      ],
    );

  }
  database db = database();

  Future<List<OrderClass>> select1;

  Future<List<OrderClass>> select2;

  Future<List<OrderClass>> fillList(String con1,String con2)async{
   String result =  await db.getOrder(widget.id);
   List<OrderClass> temp1=List();
   if(result=="0")
     return temp1;
   var data = jsonDecode(result);
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
      buildit();
      super.initState();
    }
  void buildit(){
    select1=fillList("pending","on the way");
    select2=fillList("delivered","cancelled");
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
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh,color: Colors.pink,size: 30,), onPressed: (){
              setState(() {
                buildit();
              });
            })
          ],
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
                  print(snapshot.hasData);
                  if(!snapshot.hasData)
                    return Center(child: CircularProgressIndicator(),);
                  print(snapshot.hasData);
                  if(snapshot.hasData){
                    if(snapshot.data.length==0)
                      return Center(child: Text("No orders yet!"));
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails(order: snapshot.data[index],)));
                            },
                            child: makeTile(snapshot.data[index].orderID, snapshot.data[index].bill, snapshot.data[index].date, snapshot.data[index].address, snapshot.data[index].status),
                          );
                        });
                  }
                }
            ),
            FutureBuilder(
                future: select2,
                builder: (BuildContext context,
                    AsyncSnapshot snapshot) {
                  print(snapshot.hasData);
                  if(!snapshot.hasData)
                    return Center(child: CircularProgressIndicator(),);
                  print(snapshot.hasData);
                  if(snapshot.hasData){
                    if(snapshot.data.length==0)
                      return Center(child: Text("No Past orders yet!"));
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails(order: snapshot.data[index],)));
                            },
                            child: Column(
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
                            ),
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
