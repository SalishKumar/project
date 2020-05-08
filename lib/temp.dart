/*import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color burger = Colors.black,
      pizza = Colors.black,
      pakistani = Colors.black,
      pasta = Colors.black,
      fries = Colors.black,
      beverages = Colors.black;

  ListView getCategory() {
    List<Padding> Category = List();
    Category.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (burger == Color.fromRGBO(244, 75, 89, 1))
              burger = Colors.black;
            else
              burger = Color.fromRGBO(244, 75, 89, 1);
            pizza = Colors.black;
            pakistani = Colors.black;
            pasta = Colors.black;
            fries = Colors.black;
            beverages = Colors.black;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: burger,
                    )),
                child: Icon(Icons.fastfood),
              ),
            ),
            Text(
              "Burger",
              style: TextStyle(color: burger),
            )
          ],
        ),
      ),
    ));
    Category.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (pizza == Color.fromRGBO(244, 75, 89, 1))
              pizza = Colors.black;
            else
              pizza = Color.fromRGBO(244, 75, 89, 1);
            burger = Colors.black;
            pakistani = Colors.black;
            pasta = Colors.black;
            fries = Colors.black;
            beverages = Colors.black;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: pizza,
                    )),
                child: Icon(Icons.fastfood),
              ),
            ),
            Text(
              "Pizza",
              style: TextStyle(color: pizza),
            )
          ],
        ),
      ),
    ));
    Category.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (pakistani == Color.fromRGBO(244, 75, 89, 1))
              pakistani = Colors.black;
            else
              pakistani = Color.fromRGBO(244, 75, 89, 1);
            burger = Colors.black;
            pizza = Colors.black;
            pasta = Colors.black;
            fries = Colors.black;
            beverages = Colors.black;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: pakistani,
                    )),
                child: Icon(Icons.fastfood),
              ),
            ),
            Text(
              "Pakistani",
              style: TextStyle(color: pakistani),
            )
          ],
        ),
      ),
    ));
    Category.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (pasta == Color.fromRGBO(244, 75, 89, 1))
              pasta = Colors.black;
            else
              pasta = Color.fromRGBO(244, 75, 89, 1);
            burger = Colors.black;
            pizza = Colors.black;
            pakistani = Colors.black;
            fries = Colors.black;
            beverages = Colors.black;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: pasta,
                    )),
                child: Icon(Icons.fastfood),
              ),
            ),
            Text(
              "Pasta",
              style: TextStyle(color: pasta),
            )
          ],
        ),
      ),
    ));
    Category.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (fries == Color.fromRGBO(244, 75, 89, 1))
              fries = Colors.black;
            else
              fries = Color.fromRGBO(244, 75, 89, 1);
            burger = Colors.black;
            pizza = Colors.black;
            pasta = Colors.black;
            pakistani = Colors.black;
            beverages = Colors.black;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: fries,
                    )),
                child: Icon(Icons.fastfood),
              ),
            ),
            Text(
              "Fries",
              style: TextStyle(color: fries),
            )
          ],
        ),
      ),
    ));
    Category.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (beverages == Color.fromRGBO(244, 75, 89, 1))
              beverages = Colors.black;
            else
              beverages = Color.fromRGBO(244, 75, 89, 1);
            burger = Colors.black;
            pizza = Colors.black;
            pasta = Colors.black;
            pakistani = Colors.black;
            fries = Colors.black;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: beverages,
                    )),
                child: Icon(Icons.fastfood),
              ),
            ),
            Text(
              "Beverages",
              style: TextStyle(color: beverages),
            )
          ],
        ),
      ),
    ));
    return ListView(scrollDirection: Axis.horizontal, children: Category);
  }

  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  itemCount++;
                });
              },
              child: MyCart(itemCount: itemCount),
            ),
          )
        ],
      ),
      drawer: Drawer(

        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 75, 89, 1)
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          MySearchWidget(),
          Container(height: 150, child: getCategory()),
          Expanded(
              child: ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,)
                  ,Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                ],
              ))
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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color burger = Colors.black,
      pizza = Colors.black,
      pakistani = Colors.black,
      pasta = Colors.black,
      fries = Colors.black,
      beverages = Colors.black;

  ListView getCategory() {
    List<Padding> Category = List();
    Category.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (burger == Color.fromRGBO(244, 75, 89, 1))
              burger = Colors.black;
            else
              burger = Color.fromRGBO(244, 75, 89, 1);
            pizza = Colors.black;
            pakistani = Colors.black;
            pasta = Colors.black;
            fries = Colors.black;
            beverages = Colors.black;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: burger,
                    )),
                child: Icon(Icons.fastfood),
              ),
            ),
            Text(
              "Burger",
              style: TextStyle(color: burger),
            )
          ],
        ),
      ),
    ));
    Category.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (pizza == Color.fromRGBO(244, 75, 89, 1))
              pizza = Colors.black;
            else
              pizza = Color.fromRGBO(244, 75, 89, 1);
            burger = Colors.black;
            pakistani = Colors.black;
            pasta = Colors.black;
            fries = Colors.black;
            beverages = Colors.black;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: pizza,
                    )),
                child: Icon(Icons.fastfood),
              ),
            ),
            Text(
              "Pizza",
              style: TextStyle(color: pizza),
            )
          ],
        ),
      ),
    ));
    Category.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (pakistani == Color.fromRGBO(244, 75, 89, 1))
              pakistani = Colors.black;
            else
              pakistani = Color.fromRGBO(244, 75, 89, 1);
            burger = Colors.black;
            pizza = Colors.black;
            pasta = Colors.black;
            fries = Colors.black;
            beverages = Colors.black;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: pakistani,
                    )),
                child: Icon(Icons.fastfood),
              ),
            ),
            Text(
              "Pakistani",
              style: TextStyle(color: pakistani),
            )
          ],
        ),
      ),
    ));
    Category.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (pasta == Color.fromRGBO(244, 75, 89, 1))
              pasta = Colors.black;
            else
              pasta = Color.fromRGBO(244, 75, 89, 1);
            burger = Colors.black;
            pizza = Colors.black;
            pakistani = Colors.black;
            fries = Colors.black;
            beverages = Colors.black;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: pasta,
                    )),
                child: Icon(Icons.fastfood),
              ),
            ),
            Text(
              "Pasta",
              style: TextStyle(color: pasta),
            )
          ],
        ),
      ),
    ));
    Category.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (fries == Color.fromRGBO(244, 75, 89, 1))
              fries = Colors.black;
            else
              fries = Color.fromRGBO(244, 75, 89, 1);
            burger = Colors.black;
            pizza = Colors.black;
            pasta = Colors.black;
            pakistani = Colors.black;
            beverages = Colors.black;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: fries,
                    )),
                child: Icon(Icons.fastfood),
              ),
            ),
            Text(
              "Fries",
              style: TextStyle(color: fries),
            )
          ],
        ),
      ),
    ));
    Category.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (beverages == Color.fromRGBO(244, 75, 89, 1))
              beverages = Colors.black;
            else
              beverages = Color.fromRGBO(244, 75, 89, 1);
            burger = Colors.black;
            pizza = Colors.black;
            pasta = Colors.black;
            pakistani = Colors.black;
            fries = Colors.black;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: beverages,
                    )),
                child: Icon(Icons.fastfood),
              ),
            ),
            Text(
              "Beverages",
              style: TextStyle(color: beverages),
            )
          ],
        ),
      ),
    ));
    return ListView(scrollDirection: Axis.horizontal, children: Category);
  }

  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  itemCount++;
                });
              },
              child: MyCart(itemCount: itemCount),
            ),
          )
        ],
      ),
      drawer: Drawer(

        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 75, 89, 1)
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          MySearchWidget(),
          Container(height: 150, child: getCategory()),
          Expanded(
              child: ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,)
                  ,Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 170,
                          width: 300,
                        ),
                      ),
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
                              "Food/Burger.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "Grill Burger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Tomato,onion,chicken",
                                    style: TextStyle(fontSize: 19),
                                  )),
                              trailing: Container(
                                height: 200,
                                width: 53,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 243, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline,
                                      size: 40,
                                      color: Color.fromRGBO(244, 75, 89, 1)),
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                ],
              ))
        ],
      ),
    );
  }
}

*/