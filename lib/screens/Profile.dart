import 'package:animate_do/animate_do.dart';
import 'package:fashion_e_commerce_app/Utils/constants.dart';
import 'package:fashion_e_commerce_app/Utils/flutterToast.dart';
import 'package:fashion_e_commerce_app/screens/UpdateProfile.dart';
import 'package:fashion_e_commerce_app/screens/signInPage.dart';
import 'package:fashion_e_commerce_app/widget/ProfileWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final auth=FirebaseAuth.instance;

    return Scaffold(

   
      body: SingleChildScrollView(
        child: FadeInUp(
           delay: Duration(milliseconds: 300),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
        
                /// -- IMAGE
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage('assets/images/profilePic.jpg',),fit: BoxFit.cover,
                          )),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: AppColor().editTabColorShade,),
                        child: const Icon(
                          LineAwesomeIcons.alternate_pencil,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text('Rakesh Kumar', style: Theme.of(context).textTheme.headline4),
                Text('rakeshlohana15@gmail.com', style: Theme.of(context).textTheme.bodyText2),
                const SizedBox(height: 20),
        
                /// -- BUTTON
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>UpdateProfileScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:AppColor().editTabColorShade, side: BorderSide.none, shape: const StadiumBorder()),
                    child: const Text('Edit Profile', style: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 10),
        
                /// -- MENU
                ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: () {}),
                ProfileMenuWidget(title: "Billing Details", icon: LineAwesomeIcons.wallet, onPress: () {}),
                ProfileMenuWidget(title: "User Management", icon: LineAwesomeIcons.user_check, onPress: () {}),
                const Divider(),
                const SizedBox(height: 10),
                ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info, onPress: () {}),
                ProfileMenuWidget(
                    title: "Logout",
                    icon: LineAwesomeIcons.alternate_sign_out,
                    textColor: Colors.red,
                    endIcon: false,
                    onPress: () {
                         auth.signOut().then((value) {
                         Navigator.push(context,MaterialPageRoute(builder: (context)=>SignInScreen()));
            
            
                        }).onError((error, stackTrace) {
                          Utils().snackBar('Error occured while signing out', Colors.red, context);
            
                        });
                      // Get.defaultDialog(
                      //   title: "LOGOUT",
                      //   titleStyle: const TextStyle(fontSize: 20),
                      //   content: const Padding(
                      //     padding: EdgeInsets.symmetric(vertical: 15.0),
                      //     child: Text("Are you sure, you want to Logout?"),
                      //   ),
                      //   confirm: Expanded(
                      //     child: ElevatedButton(
                      //       onPressed: () => AuthenticationRepository.instance.logout(),
                      //       style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
                      //       child: const Text("Yes"),
                      //     ),
                      //   ),
                      //   cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
                      // );
                    }
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}