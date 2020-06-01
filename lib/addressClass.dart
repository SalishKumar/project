class AddressClass{
  String addressType,address;
  bool isClicked=false;

  AddressClass(){}
  bool isAddressValid(){
    if(address==null || address == "")
      return true;
    for(int i=0;i<address.length;++i){
      int a = address[i].compareTo('0');
      int b = address[i].compareTo('9');
      if(address[i]==' ')
        continue;
      if(a<0){
        return false;
      }
      else if(b > 0){
        a = address[i].compareTo('A');
        if(a<0){
          return false;
        }
        int b = address[i].compareTo('Z');
        if(b>0){
          a = address[i].compareTo('a');
          if(a<0){
            return false;
          }
          int b = address[i].compareTo('z');
          if(b>0){
            return false;
          }
        }
      }
    }
    return true;
  }
}