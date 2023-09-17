

import 'package:firebase_auth/firebase_auth.dart';

class CheckLogin{

  bool isLogin(){
 final auth= FirebaseAuth.instance;
  final user= auth.currentUser;
  if(user!=null){
    return true;

    } 
    return false;
     }

}