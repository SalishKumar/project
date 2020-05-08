class User{
   String _username;
   String _Email;
   String _Phone;
   String _Password;

   User(){
     _username="";
     _Email="";
     _Phone="";
     _Password="";
   }

   void setName(String name){
      _username = name;
   }
   void setEmail(String email){
     _Email = email;
   }

   void setPhone(String phone){
     _Phone = phone;
   }
   void ssetPassword(String password){
     _Password = password;
   }

   String getName(){
     return _username;
   }
   String getEmail(){
     return _Email;
   }
   String getPhone(){
     return _Phone;
   }
   String getPassword(){
     return _Password;
   }
   bool isNameValid(){
     for(int i=0;i<_username.length;++i){
          int a = _username[i].compareTo('0');
          int b = _username[i].compareTo('9');
          if(a<0){
            return false;
          }
          else if(b > 0){
              a = _username[i].compareTo('A');
              if(a<0){
                return false;
              }
              int b = _username[i].compareTo('Z');
              if(b>0){
                a = _username[i].compareTo('a');
                if(a<0){
                  return false;
                }
                int b = _username[i].compareTo('z');
                if(b>0){
                  return false;
                }
              }
          }
     }
     return true;
   }
   bool isEmailValid() {
     int j= 0;
     for (int i = 0; i < _Email.length; ++i) {
        if(_Email[i]=='@'){
          j=i;
          break;
        }
        if(i==_Email.length-1){
          return false;
        }

     }
     while(j<_Email.length){
       if(_Email[j]=='.'){
         break;
       }
       else if(j==_Email.length-1){
         return false;
       }
       j++;
     }
     return true;

   }
   bool isPasswordValid(){

   }
}