
import 'package:fashion_e_commerce_app/Utils/constants.dart';
import 'package:fashion_e_commerce_app/Utils/flutterToast.dart';
import 'package:fashion_e_commerce_app/ZoomDrawer/main_wrapper.dart';
import 'package:fashion_e_commerce_app/screens/signInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

   bool loading=false;
  late bool  _passwordVisible;
  final emailcontroller=TextEditingController();
  final passwordController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  
  FirebaseAuth _auth=FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
  
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {

   
   
    return SafeArea(
      child: Scaffold(
      
        body: Stack(
          children: [
             Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_image.jpg'),
                fit: BoxFit.cover,
                
                
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.srcOver),
              ),
            ),
            
          ),
           Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Align(
                    alignment: Alignment.centerLeft,
                     child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                                 "Welcome Back ! ",
                                 style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold, fontSize: 36),
                               ),
                               SizedBox(height: 15,),
                                Text(
                                 "Sign up to your account  ",
                                 style: TextStyle(color:Colors.white, fontSize: 22,fontWeight: FontWeight.bold),
                               ),
    
                      ],
                     ),
                   ),
    
                const SizedBox(
                  height: 10,
                ),
                    Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    
                    controller: emailcontroller,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter your email';
                      }
                      final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,8}$');
                      if(!emailRegex.hasMatch(value)){
                     return 'Please enter a valid email';
                      }
                      return null;
    
                    },
                    style: TextStyle(fontSize:18,color: Colors.white),
    
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(fontSize: 17),
                      errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
    
                     prefixIcon:Icon(Icons.alternate_email_outlined,color: Colors.white,size: 22,),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      label: Text(
                        "Email",
                      ),
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    keyboardType: TextInputType.emailAddress,
    
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    
                    controller: passwordController,
                    validator: (value){
                      if(value!.isEmpty){
                      
                        return 'Please enter your password';
    
                      }
                      if(value.length<6){
                        return 'Password must be at least 6 characters long';
                   }
                      return null;
    
                    },
    
                    style: const TextStyle(fontSize:18,color: Colors.white),
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(fontSize: 17),
                      errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                                              
                        prefixIcon:Icon(Icons.lock_outline_sharp,color: Colors.white,size: 22,),
                        suffixIcon:  IconButton(
                        icon: Icon(
                      _passwordVisible
                      ? Icons.visibility_off
                     : Icons.visibility,
                     color: Colors.white,
                   ),
                onPressed: () {
    
                   setState(() {
                       _passwordVisible = !_passwordVisible;
                   });
                    },
                ),
    
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      label: const Text(
                        "Password",
                      ),
                      labelStyle: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    obscureText: _passwordVisible,
                  ),
                ),
                    SizedBox(height: 20,),
    
                      SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          loading=true;
                        });
    
                        _auth.createUserWithEmailAndPassword(
                          email: emailcontroller.text.toString(),
                           password: passwordController.text.toString()).then(
                            (value) {
                         Navigator.push(context, MaterialPageRoute(builder: ((context) => MainWrapper())));
                              setState(() {
                          loading=false;
                        });

    
                            }
                            ).onError((error, stackTrace) {
                              Utils().snackBar('An Error Occured While Creating Account',Colors.red,context);
                              
                                setState(() {
                          loading=false;
                        });
                            });
    
    
                        if(_formKey.currentState!.validate()){
                 
    
                        }
                      },
                      child: Container(
    
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange.shade800
                        ),
                        child: Center(child: loading ? CircularProgressIndicator(strokeWidth:3,color: Colors.white,):Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 23),)),
                      ),
                    ),
                    SizedBox(height: 20,),
    
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            height: 20,
                            color: Colors.white
    
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text('Or Continue With',style: TextStyle( fontSize:15,color: Colors.white)),
                        ),
    
                        Expanded(
                          child: Divider(
                            height: 20,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30,),
    
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/google.png',height: 50,width: 70,),
                           VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                          ),
    
                        Image.asset('assets/images/facebook.png',height: 50,width: 70,),
                          VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                           Image.asset('assets/images/twitter.png',height: 50,width: 70,),
                        ],
                      ),
                    ),
    
                    Padding(
                      padding: const EdgeInsets.only(top: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("Already have an account? ",style: TextStyle(color: Colors.white,fontSize: 20),),
    
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                          },
                          child: Text('Sign In',style: TextStyle(fontWeight:FontWeight.bold,color:primaryColor,fontSize: 23),))
                      ],),
                    )
    
    
    
    
                ]),
              ),
            ),
          ),
        ),
    
          ],
        ),
      ),
    );
  }
}
