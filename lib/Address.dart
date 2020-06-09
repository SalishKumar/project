import 'dart:convert';
import 'addAddressForm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foodhubbb/http.dart';
import 'addressClass.dart';
import 'package:foodhubbb/User.dart';

class Address extends StatefulWidget {
  User user =User();
  bool mode;
  Address({this.user,this.mode});

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  Future<List> addresses;
  bool isClickec = false;
  database db = database();

  @override
  void initState() {

    addresses = loadAddresses();
    super.initState();
  }

  Future<List> loadAddresses()async{
       String response= await db.getAddress(widget.user.getId().toString());
      List<AddressClass> listAddress = List();
      var data = jsonDecode(response);


      for (var i in data) {
        AddressClass address = AddressClass();
        address.address = i["address"];
        address.addressType = i["addressType"];
        listAddress.add(address);
      }
      return  listAddress;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        setState(() {
         addresses = loadAddresses();
        });
        await Future.delayed(Duration(seconds: 2));
      },
      child: Scaffold(
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Color.fromRGBO(244, 75, 89, 1)),
            elevation: 0,
            backgroundColor: Color.fromRGBO(246, 246, 246, 1),
            title: Text(
              "Addresses",
              style: GoogleFonts.lato(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
            ),

          ),
          body: Stack(
            children: <Widget>[
              FutureBuilder(
                  future: addresses,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData && snapshot.connectionState==ConnectionState.done) {
                      return Center(child: Text("No address Added yet"));
                    }
                    if (!snapshot.hasData) {
                      return Center(child: Text("Loading..."));
                    }

                    else {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                  color: Colors.red
                              )
                            ),
                              child: ListTile(
                                leading: Icon(Icons.home),
                                title: Text(snapshot.data[index].addressType),
                                subtitle: Text(snapshot.data[index].address),
                                trailing: Checkbox(value: snapshot.data[index].isClicked, onChanged: (value){
                                  setState(() {
                                      for(var address in snapshot.data){
                                        address.isClicked=false;
                                      }
                                      widget.user.address=snapshot.data[index];
                                      snapshot.data[index].isClicked=true;
                                      print(widget.user.address.address);
                                  });
                                }),
                              ),
                            );
                          }
                      );
                    }
                  }
              ),
              widget.mode?Positioned(
                bottom: 20,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>AddAddressForm(cid: widget.user.getId(),))
                      );
                      });
                    },
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 50,
                      color: Colors.pinkAccent,
                      child: Center(child: Text("Add new address",
                        style: TextStyle(color: Colors.white, fontSize: 20),)),
                    ),
                  ),
                ),
              ):Positioned(
                bottom: 20,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 50,
                      color: Colors.pinkAccent,
                      child: Center(child: Text("Done",
                        style: TextStyle(color: Colors.white, fontSize: 20),)),
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
