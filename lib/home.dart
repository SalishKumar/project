import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodhubbb/Cart.dart';
import 'package:foodhubbb/Food.dart';
import 'package:foodhubbb/category.dart';
import 'package:foodhubbb/editProfile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets.dart';
import 'package:foodhubbb/User.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:foodhubbb/alertDialog.dart';
import 'http.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Home extends StatefulWidget {
  User user = User();

  Home({this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> category1;
  Future<List> food1;
  double Height = 50;
  @override
  initState(){
    category1 = getCategory();
    buildFood();
    super.initState();

  }
  void rebuild(){
    category1 = getCategory();
    food1 = getMenu();
  }
  bool isCategoryLoaded=false;
  String selectedMenu = "";
  List<Food> cart = List();
  database db = database();
  void buildFood(){
    food1 = getMenu();
  }
    Future<List> getCategory() async {
    var response = await db.getCategory();
    List<Category> listCategory = List();
      var data = jsonDecode(response.body);


      for (var i in data) {
        Category cat = Category(cat_id: i["cat_id"], name: i["cat_name"],img: i["cat_img"]);
        cat.setImage();
        if (selectedMenu == cat.cat_id)
          cat.isClicked = true;
        listCategory.add(cat);
      }
    return  listCategory;
  }
  Future<List> getMenu() async {
    var response = await db.getMenu(selectedMenu);
    var data = jsonDecode(response.body);
    List<Food> listFood = List();
    for (var i in data) {
      Food food = Food(i["f_name"], i["ingredients"], i["f_price"]);
      listFood.add(food);
    }
    return listFood;
  }
  void addInCart(Food food){
      int flag = 0;
      if(cart.length== 0 || cart==null){
        cart.add(food);
      }
      else{
        for(Food i in cart){
          if(i.name == food.name) {
            i.incQuantity();
            flag=1;
          }
        }
        if(flag==0)
        cart.add(food);
      }
  }

  @override
  Widget build(BuildContext context) {
    String category = "0";
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
                    if(cart.length==0||cart==null){
                      showAlertDialog(context,"Cart is Empty!!");
                    }
                    else{
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>Cart(cart: cart,),
                          ));
                    }
              },
              child: MyCart(
                  itemCount: cart.length,
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(

        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(widget.user.getName(),
                  style: TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: Text(widget.user.getEmail(),
                  style: TextStyle(fontWeight: FontWeight.bold)),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 75, 89, 1)
              ),
            ),
            ListTile(
              onTap: () {

              },
              trailing: Icon(Icons.favorite, color: Colors.red,),
              title: Text("Favourite"),
            ),
            ListTile(
              onTap: () {

              },
              trailing: Icon(Icons.home, color: Colors.red,),
              title: Text("My Addresses"),
            ),
            ListTile(
              onTap: () {

              },
              trailing: Icon(Icons.fastfood, color: Colors.red,),
              title: Text("Orders"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => editProfile(user: widget.user,),
                    ));
              },
              trailing: Icon(Icons.settings, color: Colors.red,),
              title: Text("Account Settings"),
            ),
            ListTile(
              onTap: () {
                logoutAlertDialog(context);
              },
              trailing: Icon(Icons.cancel, color: Colors.red,),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
              rebuild();
          });
          await Future.delayed(Duration(seconds: 2));

        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MySearchWidget(),
              Container(
                  margin: EdgeInsets.only(top: 10, left: 5),
                  padding: EdgeInsets.all(5),
                  height: 120,
                  child: FutureBuilder<List>(
                      future: category1,
                      builder: (BuildContext context,
                          AsyncSnapshot<List> snapshot) {
                        if(!snapshot.hasData)
                          return Text("Loading....");
                           if(snapshot.hasData){
                              if(snapshot.data.length==0)
                                return Text("No Category");
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        if(selectedMenu==snapshot.data[index].cat_id)
                                          return;
                                        selectedMenu =
                                            snapshot.data[index].cat_id;
                                        print(selectedMenu);
                                        snapshot.data[index].isClicked = true;
                                        for (int i = 0; i <
                                            snapshot.data.length; ++i) {
                                          if (i == index)
                                            continue;
                                          snapshot.data[i].isClicked = false;
                                        }
                                        setState(() {
                                            buildFood();
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
                                                  borderRadius: BorderRadius
                                                      .circular(50),
                                                  side: BorderSide(
                                                    color: snapshot
                                                        .data[index].isClicked
                                                        ? Colors.red
                                                        : Colors.grey,
                                                  )),
                                                child: Container(width:50,height:50,margin:EdgeInsets.only(top: 5),child:  ListTile(title: Image.memory(snapshot.data[index].imgInBytes,)),)
                                            ),
                                          ),
                                          Text(
                                            snapshot.data[index].name,
                                            style: TextStyle(
                                                color: snapshot.data[index]
                                                    .isClicked
                                                    ? Colors.red
                                                    : Colors.black,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                  ],
                                );
                              }
                          );
                        }
                      }
                  )
              ),
              FutureBuilder<List>(
                  future: food1,
                  builder: (BuildContext context,
                      AsyncSnapshot<List> snapshot) {
                    print(snapshot.hasData);
                    if(selectedMenu=="")
                      return Text("Select the category");
                    if(snapshot.hasData && snapshot.connectionState==ConnectionState.waiting)
                      return Text("Loading...");
                    if(!snapshot.hasData && snapshot.connectionState==ConnectionState.done)
                      return Text("No product!");
                    if(!snapshot.hasData)
                      return Text("Loading.....");
                    if(snapshot.hasData){
                      return Container(
                        height: snapshot.data.length.toDouble() * 200,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          addAutomaticKeepAlives: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: <Widget>[
                                  Stack
                                    (
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          height: 170,
                                          width: MediaQuery.of(context).size.width/1.5,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20
                                                )),
                                            elevation: 6,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(top: 10, left: 15),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                                  color: Color.fromRGBO(245, 245, 243, 1),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(0.0, 1.0),
                                                      blurRadius: 3.0,
                                                    ),
                                                  ],
                                                ),
                                                child: Image.asset("images/food1.png",
                                                  width: MediaQuery.of(context).size.width/3,
                                                  height: 150,
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context).size.width / 2.5,
                                                margin: EdgeInsets.only(top: 15),
                                                child: Column(
                                                  children: <Widget>[
                                                    ListTile(
                                                      title: AutoSizeText(snapshot.data[index].name,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 22
                                                        ),
                                                        maxLines: 1,
                                                      ),
                                                      subtitle: Container(
                                                          width: MediaQuery.of(context).size.width,
                                                          margin: EdgeInsets.only(top: 4),
                                                          child: AutoSizeText(
                                                            snapshot.data[index].Ingredient,
                                                            style: TextStyle(
                                                                fontSize: 19
                                                            ),
                                                            maxLines: 3,
                                                          )
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: MediaQuery.of(context).size.width / 5, top: MediaQuery.of(context).size.height / 45
                                                      ),
                                                      child: Text(
                                                        "Rs "+snapshot.data[index].price,
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
                                                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/70),
                                                height: 75,
                                                width: MediaQuery.of(context).size.width/8,
                                                child: Card(
                                                  color: Color.fromRGBO(245, 245, 243, 1),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)
                                                  ),
                                                  elevation: 5,
                                                  child: IconButton(
                                                      icon: Icon(
                                                        Icons.add_circle_outline,
                                                        size: 25,
                                                        color: Colors.pinkAccent,),
                                                      onPressed: (){
                                                        print(cart.length);
                                                        setState(() {
                                                          addInCart(snapshot.data[index]);
                                                          snackBar(context,Icons.thumb_up," "+ snapshot.data[index].name + " added");
                                                        });
                                                        print(cart.length);
                                                      }
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            }
                        ),
                      );
                    }
                  }
              ),

            ],
          ),
        ),
      ),
    );
  }
  void snackBar(context,IconData icon,String sms){
    Scaffold.of(context).showSnackBar(
        SnackBar(
            duration: Duration(microseconds: 1),
            content: Row(
              children: <Widget>[
                Icon(icon),
                SizedBox(width: 20,),
                Expanded(child: Text(sms)),
              ],
            ))
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
