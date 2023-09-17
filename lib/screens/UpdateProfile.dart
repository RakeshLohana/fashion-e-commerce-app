import 'package:animate_do/animate_do.dart';
import 'package:fashion_e_commerce_app/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(LineAwesomeIcons.angle_left,color: Colors.black,)),
        title: Text("Edit Profile", style:TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: FadeInUp(
           delay: Duration(milliseconds: 300),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // -- IMAGE with ICON
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(image: AssetImage("assets/images/profilePic.jpg"),fit: BoxFit.cover,)),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100), color:  AppColor().editTabColorShade,),
                        child: const Icon(LineAwesomeIcons.camera, color: Colors.black, size: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
        
                // -- Form Fields
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                              labelStyle: TextStyle(color: Colors.black),
                            label: Text('Full Name'), prefixIcon: Icon(
                              LineAwesomeIcons.user,color: primaryColor,)),
                      ),
                      const SizedBox(height:10),
                      TextFormField(
                        decoration: const InputDecoration(
                           focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                              labelStyle: TextStyle(color: Colors.black),
                            label: Text('Email'), prefixIcon: Icon(LineAwesomeIcons.envelope_1,color: primaryColor,)),
                      ),
                      const SizedBox(height: 10 ),
                      TextFormField(
                        decoration: const InputDecoration(
                           focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                              labelStyle: TextStyle(color: Colors.black),
                            label: Text('Phone No'), prefixIcon: Icon(LineAwesomeIcons.phone,color: primaryColor,)),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                           focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                              labelStyle: TextStyle(color: Colors.black),
                          label: const Text('Password'),
                          prefixIcon: const Icon(Icons.fingerprint,color: primaryColor,),
                          suffixIcon:
                          IconButton(icon: const Icon(LineAwesomeIcons.eye_slash,color: primaryColor,), onPressed: () {}),
                        ),
                      ),
                      const SizedBox(height: 10),
        
                      // -- Form Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor:AppColor().editTabColorShade,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child:  Text("Edit Profile", style: TextStyle(color: AppColor().editTabColor)),
                        ),
                      ),
                      const SizedBox(height: 10),
        
                      // -- Created Date and Delete Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text.rich(
                            TextSpan(
                              text: 'Joined',
                              style: TextStyle(fontSize: 12),
                              children: [
                                TextSpan(
                                    text: ' 02-06-2023',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent.withOpacity(0.1),
                                elevation: 0,
                                foregroundColor: Colors.red,
                                shape: const StadiumBorder(),
                                side: BorderSide.none),
                            child: const Text('Delete'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}