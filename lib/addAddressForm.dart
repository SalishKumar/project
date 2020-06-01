import 'package:flutter/material.dart';
import 'package:foodhubbb/Address.dart';
import 'package:google_fonts/google_fonts.dart';
import 'addressClass.dart';
import 'alertDialog.dart';
import 'http.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class AddAddressForm extends StatefulWidget {
  int cid;
  AddAddressForm({this.cid});
  @override
  _AddAddressFormState createState() => _AddAddressFormState();
}

class _AddAddressFormState extends State<AddAddressForm> {
  Future<List> addressList;
  database db = database();
  bool Spinner = false;
  @override
  void initState() {
    super.initState();
  }
  getAddress()async{
  }

  void toggle(int code){
      home = false;
      work=false;
      other=false;
      if(code==1)
        home=true;
      else if(code==2)
        work=true;
      else if(code==3)
        other=true;
  }
  bool home=false,work=false,other=false;
  getAddresses(){

  }
  AddressClass address = AddressClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Color.fromRGBO(244, 75, 89, 1)),
        elevation: 0,
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        title: Text(
            "Add Address",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25)
          ),
        ),
      body: ModalProgressHUD(
        inAsyncCall: Spinner,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value){
                    setState(() {
                      address.address=value;
                    });
                  },
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey
                      )
                    ),
                    hintText: "Address",
                    errorText: address.isAddressValid()?"":"Address must not contain special character",
                    border: OutlineInputBorder(

                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pinkAccent
                      )
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 10),
                child: Text(
                    "Label as",
                  style: TextStyle(
                    fontSize: 20
                  ),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        address.addressType='Home';
                        toggle(1);
                      });

                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: home?Colors.pink: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        elevation: 0,
                        child: Center(child: Text(
                            "Home",
                          style: TextStyle(
                            color: home?Colors.pink: Colors.grey
                          ),

                        )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        address.addressType='Office';
                        toggle(2);
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: work?Colors.pink:Colors.grey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        elevation: 0,
                        child: Center(child: Text(
                          "Office",
                          style: TextStyle(
                              color: work?Colors.pink: Colors.grey
                          ),

                        )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        address.addressType='Other';
                        toggle(3);
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color:other?Colors.pink: Colors.grey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        elevation: 0,
                        child: Center(child: Text(
                          "Other",
                          style: TextStyle(
                              color: other?Colors.pink: Colors.grey
                          ),

                        )),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: ()async{
                    if(address.address==null||address.address==""||address.addressType==null){
                      showAlertDialog(context, "Incomplete Details!");
                    }
                    else{
                      setState(() {
                        Spinner=true;
                      });
                     String result =  await db.addAddress(widget.cid.toString(), address);
                      setState(() {
                        Spinner=false;
                      });
                     if(result=="1"){
                       await showAlertDialog1(context, "Address added Successfully");
                     }
                     else{
                       showAlertDialog(context, "Address already exist!.");
                     }

                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Card(
                      elevation: 5,
                      color: Colors.pinkAccent,
                      child: Center(child: Text(
                          "Add New Address",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
