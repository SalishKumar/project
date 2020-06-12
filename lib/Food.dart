import 'dart:convert';
import 'dart:typed_data';
class Food{
  String fid;
  String name;
  String Ingredient;
  String price;
  String discountedPrince;
  int totalPrice;
  Uint8List imgInBytes;
  int quantity=1;
  String img;
  Food.fromfOOD(){

  }
  Food(String name,String ingrement,String price,String img){
    this.name=name;
    this.Ingredient=ingrement;
    this.price=price;
    totalPrice=int.parse(price);
    this.img=img;
  }
  void incQuantity(){
    quantity++;
    totalPrice+=int.parse(price);
  }
  void decQuantity(){
    if(quantity>0) {
      quantity--;
      totalPrice -= int.parse(price);
    }
  }
  void setImage(){
    imgInBytes = base64Decode(img);
  }
  Map toJson() => {
    'fid': fid,
    'totalPrice': totalPrice,
    'quantity': quantity,
  };


}