import 'package:fashion_e_commerce_app/Utils/constants.dart';
import 'package:fashion_e_commerce_app/Utils/flutterToast.dart';
import 'package:fashion_e_commerce_app/screens/signInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.white,
                  backgroundImage:AssetImage('assets/images/profilePic.jpg'),
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
                  ZoomDrawer.of(context)?.toggle();
                  
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
    );
  }
}