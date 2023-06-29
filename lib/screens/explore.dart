import 'package:fashion_e_commerce_app/Provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
 


  @override
  Widget build(BuildContext context)  {
    return  Consumer<ProviderClass>(
      builder: (context,value,child){

        return Scaffold(
          body: Column(
            children: [
              
              Container(
                child:value.image3 ,
              ),
              
              Container(
                child: value.image2,
              )
           
            
            
          ]),
        );
      }

     );
  }
}