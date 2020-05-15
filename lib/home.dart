import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String email="dsa";
  bool burgerClicked = false;
  bool pizzaClicked = false;
  bool pakistaniClicked = false;
  bool italianClicked = false;
  bool beveragesClicked = false;
  bool dailyDealsClicked = false;
  bool dealsClicked = false;

  void toggle(){
      burgerClicked = false;
      pizzaClicked = false;
      pakistaniClicked = false;
      italianClicked = false;
      beveragesClicked = false;
      dailyDealsClicked = false;
      dealsClicked = false;

  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          toggle();
        });
      },
      child: Scaffold(
          resizeToAvoidBottomPadding:false,
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        appBar: AppBar(
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
                  setState(() {

                  });
                },
                child: MyCart(itemCount: 0),
              ),
            )
          ],
        ),
        drawer: Drawer(

          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: Text("Salish kumar",style: TextStyle(fontWeight: FontWeight.bold)),
                  accountEmail: Text("Goindanisalish@gmail.com",style: TextStyle(fontWeight: FontWeight.bold)),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person),
                  ),
                  decoration: BoxDecoration(
                    color:Color.fromRGBO(244, 75, 89, 1)
                  ),
              ),
              ListTile(
                onTap: (){

                },
                trailing: Icon(Icons.favorite,color: Colors.red,),
                title: Text("Favourite"),
              ),
              ListTile(
                onTap: (){

                },
                trailing: Icon(Icons.fastfood,color: Colors.red,),
                title: Text("Orders"),
              ),
              ListTile(
                onTap: (){

                },
                trailing: Icon(Icons.settings,color: Colors.red,),
                title: Text("Account Settings"),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MySearchWidget(),
              Container(
                margin: EdgeInsets.only(top: 10,left: 5),
                padding: EdgeInsets.all(5),
                height: 120,
                child:  ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        setState(() {
                          toggle();
                          dailyDealsClicked = true;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(
                                    color: dailyDealsClicked?Colors.red:Colors.grey,
                                  )),
                              child: Icon(Icons.fastfood),
                            ),
                          ),
                          Text(
                            "Daily Deals",
                            style: TextStyle(color: Colors.black,fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          toggle();
                          dealsClicked = true;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(
                                    color: dealsClicked?Colors.red:Colors.grey,
                                  )),
                              child: Icon(Icons.fastfood),
                            ),
                          ),
                          Text(
                            "Deals",
                            style: TextStyle(color: Colors.black,fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        toggle();
                        burgerClicked = true;
                        setState(() {
                          toggle();
                          burgerClicked = true;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(
                                    color:burgerClicked ?  Colors.red : Colors.grey,
                                  )),
                              child: Icon(Icons.fastfood),
                            ),
                          ),
                          Text(
                            "Burger",
                            style: TextStyle(color: Colors.black,fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          toggle();
                          pizzaClicked = true;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(
                                    color: pizzaClicked ? Colors.red : Colors.grey,
                                  )),
                              child: Icon(Icons.fastfood),
                            ),
                          ),
                          Text(
                            "Pizza",
                            style: TextStyle(color: Colors.black,fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          toggle();
                          pakistaniClicked = true;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(
                                    color: pakistaniClicked?Colors.red:Colors.grey,
                                  )),
                              child: Icon(Icons.fastfood),
                            ),
                          ),
                          Text(
                            "Pakistani",
                            style: TextStyle(color: Colors.black,fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          toggle();
                          italianClicked = true;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(
                                    color: italianClicked?Colors.red:Colors.grey,
                                  )),
                              child: Icon(Icons.fastfood),
                            ),
                          ),
                          Text(
                            "Italian",
                            style: TextStyle(color: Colors.black,fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          toggle();
                          beveragesClicked = true;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(
                                    color: beveragesClicked?Colors.red:Colors.grey,
                                  )),
                              child: Icon(Icons.fastfood),
                            ),
                          ),
                          Text(
                            "Beverages",
                            style: TextStyle(color: Colors.black,fontSize: 16),
                          )
                        ],
                      ),
                    ),



                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 170,
                      width: 300,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        elevation: 6,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color.fromRGBO(245, 245, 243, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              "images/food1.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2.5,
                            margin: EdgeInsets.only(top: 15),
                           child: Column(
                             children: <Widget>[
                               ListTile(
                                 title: Text(
                                   "Grill Burger",
                                   style: TextStyle(
                                       fontWeight: FontWeight.bold, fontSize: 22),
                                 ),
                                 subtitle: Container(
                                     width: MediaQuery.of(context).size.width,
                                     margin: EdgeInsets.only(top: 4),
                                     child: AutoSizeText(
                                       "Potato,Cheeze,Chicken",
                                       style: TextStyle(fontSize: 19),
                                       maxLines: 4,
                                     )),

                               ),
                               Container(
                                 margin: EdgeInsets.only(
                                   left: MediaQuery.of(context).size.width/4,
                                   top: MediaQuery.of(context).size.height/45
                                 ),
                                 child: Text("RS:300",
                                   style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     fontSize: 15
                                   ),
                                 ),
                               )
                             ],
                           ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            height: 75,
                            width:  65,
                            child: Card(
                              color: Color.fromRGBO(245, 245, 243, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              elevation: 5,
                              child: IconButton(
                                  icon: Icon(
                                      Icons.add_circle_outline,
                                    size: 40,
                                    color: Colors.pinkAccent,
                                  ),
                                  onPressed: null
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 170,
                      width: 300,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        elevation: 6,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color.fromRGBO(245, 245, 243, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              "images/food1.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2.5,
                            margin: EdgeInsets.only(top: 15),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    "Grill Burger",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 22),
                                  ),
                                  subtitle: Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(top: 4),
                                      child: AutoSizeText(
                                        "Potato,Cheeze,Chicken",
                                        style: TextStyle(fontSize: 19),
                                        maxLines: 4,
                                      )),

                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width/4,
                                      top: MediaQuery.of(context).size.height/45
                                  ),
                                  child: Text("RS:300",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            height: 75,
                            width:  65,
                            child: Card(
                              color: Color.fromRGBO(245, 245, 243, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              elevation: 5,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    size: 40,
                                    color: Colors.pinkAccent,
                                  ),
                                  onPressed: null
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 170,
                      width: 300,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        elevation: 6,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color.fromRGBO(245, 245, 243, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              "images/food1.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2.5,
                            margin: EdgeInsets.only(top: 15),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    "Grill Burger",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 22),
                                  ),
                                  subtitle: Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(top: 4),
                                      child: AutoSizeText(
                                        "Potato,Cheeze,Chicken",
                                        style: TextStyle(fontSize: 19),
                                        maxLines: 4,
                                      )),

                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width/4,
                                      top: MediaQuery.of(context).size.height/45
                                  ),
                                  child: Text("RS:300",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            height: 75,
                            width:  65,
                            child: Card(
                              color: Color.fromRGBO(245, 245, 243, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              elevation: 5,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    size: 40,
                                    color: Colors.pinkAccent,
                                  ),
                                  onPressed: null
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 170,
                      width: 300,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        elevation: 6,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color.fromRGBO(245, 245, 243, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              "images/food1.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2.5,
                            margin: EdgeInsets.only(top: 15),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    "Grill Burger",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 22),
                                  ),
                                  subtitle: Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(top: 4),
                                      child: AutoSizeText(
                                        "Potato,Cheeze,Chicken",
                                        style: TextStyle(fontSize: 19),
                                        maxLines: 4,
                                      )),

                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width/4,
                                      top: MediaQuery.of(context).size.height/45
                                  ),
                                  child: Text("RS:300",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            height: 75,
                            width:  65,
                            child: Card(
                              color: Color.fromRGBO(245, 245, 243, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              elevation: 5,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    size: 40,
                                    color: Colors.pinkAccent,
                                  ),
                                  onPressed: null
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 170,
                      width: 300,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        elevation: 6,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color.fromRGBO(245, 245, 243, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              "images/food1.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2.5,
                            margin: EdgeInsets.only(top: 15),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    "Grill Burger",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 22),
                                  ),
                                  subtitle: Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(top: 4),
                                      child: AutoSizeText(
                                        "Potato,Cheeze,Chicken",
                                        style: TextStyle(fontSize: 19),
                                        maxLines: 4,
                                      )),

                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width/4,
                                      top: MediaQuery.of(context).size.height/45
                                  ),
                                  child: Text("RS:300",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            height: 75,
                            width:  65,
                            child: Card(
                              color: Color.fromRGBO(245, 245, 243, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              elevation: 5,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    size: 40,
                                    color: Colors.pinkAccent,
                                  ),
                                  onPressed: null
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ),
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

