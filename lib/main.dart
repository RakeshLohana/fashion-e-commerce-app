import 'package:fashion_e_commerce_app/Provider/provider.dart';
import 'package:fashion_e_commerce_app/Utils/app_theme.dart';
import 'package:fashion_e_commerce_app/screens/checkLogin.dart';
import 'package:fashion_e_commerce_app/screens/onBoardingScreen.dart';
import 'package:fashion_e_commerce_app/ZoomDrawer/main_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home:CheckLogin().checkLogin ? OnBoardingScreen():MainWrapper()
      // home: const MainWrapper(),
    ) ,
      );
    
  
  }
}
