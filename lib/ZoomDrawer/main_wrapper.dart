import 'package:animate_do/animate_do.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:fashion_e_commerce_app/Provider/provider.dart';
import 'package:fashion_e_commerce_app/Utils/constants.dart';
import 'package:fashion_e_commerce_app/Utils/flutterToast.dart';
import 'package:fashion_e_commerce_app/screens/cart.dart';
import 'package:fashion_e_commerce_app/screens/explore.dart';
import 'package:fashion_e_commerce_app/screens/favourite.dart';
import 'package:fashion_e_commerce_app/screens/home.dart';
import 'package:fashion_e_commerce_app/screens/search.dart';
import 'package:fashion_e_commerce_app/screens/signInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
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
    Explore(),
    Cart(),
    Favourite(),
  ];

  @override
  Widget build(BuildContext context) {
    print('build');
    return Consumer<ProviderClass>(builder: (context, value, child) {
      return Scaffold(
        drawer: Drawer(
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
                  backgroundImage:AssetImage('assets/images/glasses.jpg'
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
                
                setState(() {
                  // ZoomDrawer.of(context)?.toggle();
                  
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.new_releases,
                color: Colors.white,
              ),
              title: const Text(
                'News',
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
                Icons.favorite,
                color: Colors.white,
              ),
              title: const Text(
                'Favorites',
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
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onTap: () {
              },
            ),
          Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: (){
                  
                    auth.signOut().then((value) {
                     Navigator.push(context,MaterialPageRoute(builder: (context)=>SignInScreen()));


                    }).onError((error, stackTrace) {
                      Utils().snackBar('Error occured while signing out', Colors.red, context);

                    });

                
                },
                child: ListTile(
                  
                  leading:  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.logout_sharp,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    'Log out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onTap: () {
                  },
                ),
              ),
            ),
    
          ],
        ),
        ),

        // App Bar
        appBar: AppBar(
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
                  child: const Text(
                    'Home',
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
                  : const Icon(
                      LineIcons.search,
                      color: Colors.black,
                      size: 30,
                    ),
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
