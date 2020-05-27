class Food{
  String name;
  String Ingredient;
  String price;
  String discountedPrince;
  int totalPrice;
  int quantity=1;
  Food(String name,String ingrement,String price){
    this.name=name;
    this.Ingredient=ingrement;
    this.price=price;
    totalPrice=int.parse(price);
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



}