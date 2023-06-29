



import 'package:advance_notification/advance_notification.dart';
import 'package:flutter/material.dart';

class Utils{

  void snackBar(String message1,Color color,BuildContext context){
      AdvanceSnackBar(
        
        textSize: 12.0,
        bgColor:color,
        message: message1,
        mode: Mode.ADVANCE,
        duration: Duration(seconds: 5),
        icon: Icon(Icons.close,color: Colors.white,)
      ).show(context);

  }

 


}