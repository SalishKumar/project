import 'package:flutter/material.dart';
import 'package:foodhubbb/Food.dart';
import 'package:google_fonts/google_fonts.dart';
class FoodPage extends StatefulWidget {
  Food food = Food.fromfOOD();
  List<Food> cart =List();
  FoodPage({this.food,this.cart});
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addInCart(Food food){
    int flag = 0;
    if(widget.cart.length== 0 || widget.cart==null){
      widget.cart.add(food);
    }
    else{
      for(Food i in widget.cart){
        if(i.name == food.name) {
          i.incQuantity();
          flag=1;
        }
      }
      if(flag==0)
        widget.cart.add(food);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        iconTheme: new IconThemeData(color: Color.fromRGBO(244, 75, 89, 1)),
        elevation: 0,
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        title: Text(
          "Menu",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: GestureDetector(
              onTap: () {
  
              },
              child: MyCart(
                itemCount: widget.cart.length
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pink
                          )
                        ),
                        height: MediaQuery.of(context).size.height/3,
                        child: Card(child:Image.memory(widget.food.imgInBytes)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: Text(widget.food.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:20.0),
                        child: Text("Rs"+widget.food.price,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Text(widget.food.Ingredient)
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    addInCart(widget.food);
                  });
                },
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 50,
                  color: Colors.pinkAccent,
                  child: Center(child: Text("Add in cart",
                    style: TextStyle(color: Colors.white, fontSize: 20),)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class MyCart extends StatelessWidget {
  const MyCart({
    Key key,
    @required this.itemCount,
  }) : super(key: key);

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side:
            BorderSide(width: 8, color: Color.fromRGBO(245, 215, 218, 1))),
        color: Color.fromRGBO(244, 75, 89, 1),
        child: Center(
          child: Text(
            "$itemCount",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
