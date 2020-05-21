import 'dart:convert';
import 'package:flutter/material.dart';
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


  database db = database();
  Future<List<Category>> getCategory()async{
    http.Response response= await db.getCategory();
    var data=jsonDecode(response.body);

    List<Category> listCategory = List();
    for(var i in data) {
      Category cat = Category(cat_id: i["cat_id"], name: i["cat_name"]);
      listCategory.add(cat);
    }
    return await listCategory;

  }
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                accountName: Text(widget.user.getName(),style: TextStyle(fontWeight: FontWeight.bold)),
                accountEmail: Text(widget.user.getEmail(),style: TextStyle(fontWeight: FontWeight.bold)),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>editProfile(user: widget.user,),
                    ));
              },
              trailing: Icon(Icons.settings,color: Colors.red,),
              title: Text("Account Settings"),
            ),
            ListTile(
              onTap: (){
                logoutAlertDialog(context);

              },
              trailing: Icon(Icons.cancel,color: Colors.red,),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(Duration(seconds: 1));
          setState(() {

          });
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MySearchWidget(),
              Container(
                margin: EdgeInsets.only(top: 10,left: 5),
                padding: EdgeInsets.all(5),
                height: 120,
                child: FutureBuilder(
                  future: getCategory(),
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                    if(snapshot.data == null) {
                      spinner=true;
                      return Text("Loading");
                    }
                    if(snapshot.data !=null){
                      spinner=false;
                      if(snapshot.data.length == 0)
                        return Text("No category");
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context,int index){
                          return Row(
                            children: <Widget>[
                              InkWell(
                                onTap: (){
                                  snapshot.data[index].isClicked = true;
                                  for(int i=0;i<snapshot.data.length;++i){
                                    if(i==index)
                                      continue;
                                    snapshot.data[i].isClicked = false;

                                  }
                                  setState(() {

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
                                              color: snapshot.data[index].isClicked?Colors.red:Colors.grey,
                                            )),
                                        child: Icon(Icons.fastfood
                                        ),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].name,
                                      style: TextStyle(color: snapshot.data[index].isClicked?Colors.red:Colors.black,fontSize: 16),
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
