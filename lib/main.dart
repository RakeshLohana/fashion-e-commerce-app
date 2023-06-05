import 'package:fashion_e_commerce_app/Provider/provider.dart';
import 'package:fashion_e_commerce_app/Utils/app_theme.dart';
import 'package:fashion_e_commerce_app/widget/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ProviderClass(),
        )
        

      ],
      child:  MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.appTheme,
      home:MainWrapper(),
      // home: const MainWrapper(),
    ) ,
      );
    
  
  }
}
