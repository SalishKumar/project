import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'orderClass.dart';
class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<OrderClass> orders = [
    OrderClass(status: "On the way",bill: "200",date: "2020-09-20",orderID: "1"),
    OrderClass(status: "pending",bill: "220",date: "2020-09-21",orderID: "2"),
    OrderClass(status: "delivered",bill: "220",date: "2020-09-21",orderID: "3"),
    OrderClass(status: "cancelled",bill: "220",date: "2020-09-21",orderID: "4"),
  ];
  List<OrderClass> select1 = List();
  List<OrderClass> select2= List();
  fillList(){
      for(var i in orders){
        if(i.status=="On the way"||i.status=="pending"){
          select1.add(i);
        }
        else{
          select2.add(i);
        }
      }

  }
  @override
  void initState() {
    fillList();
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
           ListView.builder(
             itemCount: select1.length,
               itemBuilder: (context,index){
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("Order#"+select1[index].orderID),
                          subtitle: Text("Bill:"+select1[index].bill+"\nDate:"+select1[index].date),
                          trailing: Text("Status\n"+select1[index].status),
                        ),
                      ),
                      Divider(color: Colors.pink,)
                    ],
                  );
               }),
            ListView.builder(
                itemCount: select2.length,
                itemBuilder: (context,index){
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("Order#"+select2[index].orderID),
                          subtitle: Text("Bill:"+select2[index].bill+"\nDate:"+select2[index].date),
                          trailing: Text("Status\n"+select2[index].status),
                        ),
                      ),
                      Divider(color: Colors.pink,)
                    ],
                  );
                }),

          ],
        )
      ),
    );
  }
}
