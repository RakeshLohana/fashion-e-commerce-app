import 'package:fashion_e_commerce_app/Utils/constants.dart';
import 'package:fashion_e_commerce_app/screens/signInPage.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  late PageController _pageController;
  int _pageIndex=0;

  setImage(){
    String backGroungImage;
  if(_pageIndex==0){
    backGroungImage='assets/images/1.jpg';
    return backGroungImage;
  }
  if(_pageIndex==1){
     backGroungImage='assets/images/2.jpg';
    return backGroungImage;
  }
  else{
    backGroungImage='assets/images/3.jpg';
    return backGroungImage;
    

  }
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController(initialPage: 0);
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        
        body: Stack(
        children: [
          PageView.builder(
              onPageChanged: (index){
                      setState(() {
                        _pageIndex=index;
                      });
                          
                    },
                    itemCount: data.length,
                    controller: _pageController,
            
            
            
            itemBuilder: ((context, index) {
            return Stack(
              children: [
                Image.asset(
                  setImage(), fit: BoxFit.contain,),
        
          
         
         Align(
          alignment: Alignment.bottomCenter,
           child: Container(
            height: 260,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              ),
              
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Row(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                 ...List.generate(data.length,(index)=>Padding(
                   padding: const EdgeInsets.only(right: 10),
                   child: DotIndicator(isActive: index==_pageIndex,),
                 )),
                  ],
                 ),
                ReusableContent(
                  description: data[index].description,
                    text: data[index].text),
              
               SizedBox(height: 2,),
                
              ReusableButton(pageController: _pageController, text:_pageIndex==2?"Let's get Started ": 'Next', colorText:Colors.white, colorBackground:primaryColor, onTap:(){
                     _pageIndex==2?Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen())):_pageController.nextPage(duration: Duration(microseconds:100 ), curve: Curves.ease);
              } )
                
                
            ]),
           ),
         )
              ],
            );
          }))
          
        
          
        
        ],
          )
      ),
    );
  }
}

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    super.key,
    required PageController pageController, 
    required this.text,
    required this.colorText,
    required this.colorBackground,
    required this.onTap,


  });

  final String text;
 final Color colorText;
 final Color colorBackground;
 final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
      
        height: MediaQuery.of(context).size.height*0.06,
        width: MediaQuery.of(context).size.width*0.6,
      
        child:Center(child: Text(text,style: TextStyle(color:colorText,fontWeight: FontWeight.bold,fontSize: 18),)) ,
        
        decoration: BoxDecoration(
          color: colorBackground,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}



class DotIndicator extends StatelessWidget {
  final bool isActive;
 
    const DotIndicator({ super.key,  this.isActive=false, } );
  

  @override
  Widget build(BuildContext context) {
   
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 13:8 ,
      decoration: BoxDecoration(
        color: isActive?primaryColor:primaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}


class OnBoard{
  final String text;
  final String description;

  OnBoard({required this.description,required this.text});

}

final List<OnBoard> data=[
  OnBoard(description: 'Hating the clothes in your wardrobe?\nExplore hundreds of outfit ideas', text: 'Look Good, Feel Good '),
  OnBoard(description: "Confused about your outfit? Don't Worry!\n Find the best outfit here! ",text: 'Find Your Outfits'),
  OnBoard(description: 'Create your individual & unique style and \n look amazing everday',  text: 'Your Style, Your Way')
];



class ReusableContent extends StatelessWidget {

  final String text;
  final String description;
   const ReusableContent({super.key,required this.description,required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:15.0,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          Text(text,textAlign:TextAlign.center,style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text(description,textAlign:TextAlign.center,style: TextStyle(fontSize: 18)),
      
        ],
      ),
    );
  }
}