import 'package:flutter/material.dart';

class MySearchWidget extends StatelessWidget {
  const MySearchWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10,right: 10,top: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search food🍔",
            hintStyle: TextStyle(fontSize: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)
            ),

            prefixIcon: Icon(
              Icons.search,
              color: Colors.red,
            ),
            suffixIcon: Icon(
              Icons.sort,
              color: Colors.red,
            )
        ),
      ),
    );
  }
}
