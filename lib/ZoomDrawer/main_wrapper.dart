import 'package:animate_do/animate_do.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:fashion_e_commerce_app/Provider/provider.dart';
import 'package:fashion_e_commerce_app/Utils/constants.dart';
import 'package:fashion_e_commerce_app/screens/cart.dart';
import 'package:fashion_e_commerce_app/screens/explore.dart';
import 'package:fashion_e_commerce_app/screens/favourite.dart';
import 'package:fashion_e_commerce_app/screens/home.dart';
import 'package:fashion_e_commerce_app/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';


class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  List _widgetOptions = <Widget> [
     Home(),
  Search(),
  Explore(),
  Cart(),
  Favourite(),
 
    
  ];
  
  @override
  Widget build(BuildContext context) {
    print('build');
    return Consumer<ProviderClass>(builder: (context, value, child) {
      return Scaffold(

        //App Bar
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
             setState(() {
             ZoomDrawer.of(context)!.toggle();

               
             });

          },
          color: Colors.black,
        ),
        title: value.isSearchActive? FadeIn(
          delay: const Duration(milliseconds: 300),
          child: const Text(
            'Search',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ): FadeIn(
          delay: const Duration(milliseconds: 300),
          child: const Text(
            'Home',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                value.isSearchFunction();
              },
              icon: value.isSearchActive? const Icon(
                LineIcons.searchMinus,
                color: Colors.black,
                size: 30,
              ) : const Icon(
                LineIcons.search,
                color: Colors.black,
                size: 30,
              )
              ),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
              },
              icon: const Icon(LineIcons.shoppingBag, color: Colors.black, size: 30))
        ],
      ),
      body:  value.isSearchActive ? Search() :Center(
        child: _widgetOptions.elementAt(value.selectedIndex),),
      // body: value.isSearchActive? const Search() :const Home(),
     
     //Bottom Navigation Bar
      bottomNavigationBar: BottomBarBubble(
        color: primaryColor,
      
        selectedIndex: value.selectedIndex,
        items: [
          BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: LineIcons.search),
          BottomBarItem(iconData: Icons.explore),
          BottomBarItem(iconData: Icons.shopping_cart),
          BottomBarItem(iconData: Icons.favorite),
        ],
        onSelect: (index) {
          
          value.onItemTapped(index);

        },
      ),
    );
    });
  }
}
