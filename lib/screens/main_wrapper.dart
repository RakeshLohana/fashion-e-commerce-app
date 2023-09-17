import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:fashion_e_commerce_app/Provider/provider.dart';
import 'package:fashion_e_commerce_app/Utils/constants.dart';
import 'package:fashion_e_commerce_app/Utils/flutterToast.dart';
import 'package:fashion_e_commerce_app/screens/cart.dart';
import 'package:fashion_e_commerce_app/screens/Profile.dart';
import 'package:fashion_e_commerce_app/screens/home.dart';
import 'package:fashion_e_commerce_app/screens/search.dart';
import 'package:fashion_e_commerce_app/screens/signInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
    final auth=FirebaseAuth.instance;


  List _widgetOptions = <Widget>[
    Home(),
    Search(),
    // Explore(),
    Cart(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
              // ProviderClass provider = Provider.of<ProviderClass>(context);

    print('build');
    return Consumer<ProviderClass>(builder: (context, value, child) {
      return WillPopScope(

         onWillPop: () => showExitPopup(context),
        child: Scaffold(
          drawer: SafeArea(
            child: Drawer(
              width: 200,
              backgroundColor: primaryColor,
            
              
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircleAvatar(
          
                      radius: 40.0,
                      backgroundColor: Colors.white,
                      backgroundImage:AssetImage('assets/images/profilePic.jpg'
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onTap: () {
          
                
                    
               
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onTap: () {
                  }
                ),
                ListTile(
                  leading: const Icon(
                    Icons.explore,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Explore',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onTap: () {
                  
                
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onTap: () {
              
                },
                
                ),
             const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    
                    leading:  Icon(
                        Icons.logout_sharp,
                        color: Colors.white,
                      ),
                    
                    title: const Text(
                      'Log out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: () {
                          auth.signOut().then((value) {
                       Navigator.push(context,MaterialPageRoute(builder: (context)=>SignInScreen()));
          
          
                      }).onError((error, stackTrace) {
                        Utils().snackBar('Error occured while signing out', Colors.red, context);
          
                      });
                    },
                  ),
                ),
              
              ],
            ),
            ),
          ),
          // App Bar
        
          appBar:  AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            
            title: value.isSearchActive
                ? FadeIn(
                    delay: const Duration(milliseconds: 300),
                    child: const Text(
                      'Search',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  )
                : FadeIn(
                    delay: const Duration(milliseconds: 300),
                    child: value.navIndex==0?const Text(
                      'Home',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ):  (value.navIndex==1)?const Text(
                      'Search',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ):(value.navIndex==2)?const Text(
                      'Cart',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ):const Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {
                  value.isSearchFunction();
                },
                icon: value.isSearchActive
                    ? const Icon(
                        LineIcons.searchMinus,
                        color: Colors.black,
                        size: 30,
                      )
                    : (value.navIndex==0)?const Icon(
                        LineIcons.search,
                        color: Colors.black,
                        size: 30,
                      ):(value.navIndex==1)?const Icon(
                        LineIcons.search,
                        color: Colors.black,
                        size: 30,
                      ):Text(''),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                },
                icon:
                    const Icon(LineIcons.shoppingBag, color: Colors.black, size: 30),
              )
            ],
          ),
          body: value.isSearchActive
              ? Search()
              : Center(
                  child: _widgetOptions.elementAt(value.selectedIndex),
                ),
      
          // Bottom Navigation Bar
          bottomNavigationBar: BottomBarBubble(
            color: primaryColor,
            selectedIndex: value.selectedIndex,
            items: [
              BottomBarItem(iconData: Icons.home),
              BottomBarItem(iconData: LineIcons.search),
              // BottomBarItem(iconData: Icons.explore),
              BottomBarItem(iconData: Icons.shopping_cart),
              BottomBarItem(iconData: LineIcons.user),
            ],
            onSelect: (index) {
              value.onItemTapped(index);
              value.navIndexFunc(index);
              
            },
          ),
        ),
      );
    });
  }
}


Future<bool> showExitPopup(context) async{
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Do you want to exit?"),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('yes selected');
                          exit(0);
                        },
                        child: Text("Yes"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade800),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        print('no selected');
                        Navigator.of(context).pop();
                      },
                      child: Text("No", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}  