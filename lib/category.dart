class Category{
  String cat_id;
  String name;
  bool isClicked = false;
  Category({this.cat_id,this.name});
  factory Category.fromJSON(Map<String,dynamic> json){
    return Category(
      cat_id: json["cat_id"],
          name  : json["cat_name"]

    );
  }


}