

import 'package:firebase_auth/firebase_auth.dart';

class CheckLogin{
  bool checkLogin=true;

   isLogin(){
 final auth= FirebaseAuth.instance;
  final user= auth.currentUser;
  if(user!=null){
    return checkLogin=false;

    }  }

}