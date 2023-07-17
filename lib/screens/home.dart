import 'package:animate_do/animate_do.dart';
import 'package:fashion_e_commerce_app/Utils/constants.dart';
import 'package:fashion_e_commerce_app/data/app_data.dart';
import 'package:fashion_e_commerce_app/models/base_model.dart';
import 'package:fashion_e_commerce_app/models/categories_model.dart';
import 'package:fashion_e_commerce_app/screens/details.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 2, viewportFraction: 0.7);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
      
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Top two texts
                  FadeInUp(
                    delay: Duration(milliseconds: 300),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Find your',
                                style: theme.displayLarge,
                                children: [
                                  TextSpan(
                                      text: ' Style',
                                      style: theme.displayLarge?.copyWith(
                                        color: primaryColor,
                                        fontSize: 45,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ]),
                          ),
                          RichText(
                            text: const TextSpan(
                                text: 'Be more beautiful with our ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'suggestions',
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Categories
                  FadeInUp(
                    delay: Duration(milliseconds: 45),
                    child: Container(
                      margin: EdgeInsets.only(top: 7),
                      width: size.width,
                      height: size.height * 0.16,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: categories.length,
                          itemBuilder: (ctx, index) {
                            CategoriesModel current = categories[index];
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                        AssetImage(current.imageUrl),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.008,
                                  ),
                                  Text(
                                    current.title,
                                    style: theme.titleMedium,
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  //Pictures
                  FadeInUp(
                    delay: Duration(milliseconds: 550),
                    child: Container(
                      height: size.height * 0.45,
                      width: size.width,
                      // color: Colors.red,
                      child: PageView.builder(
                          controller: _controller,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: mainList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Details(

                                  data: mainList[index], isCameFromMostPopularPart: false,
                                  
                                ),
                              )
                              );
                                }, child: view(index, theme, size));
                          }),
                    ),
                  ),
                  //Text most popular and see all
                  FadeInUp(
                    delay: Duration(milliseconds: 650),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Most Popular', style: theme.displaySmall),
                          Text('see all', style: theme.headlineMedium)
                        ],
                      ),
                    ),
                  ),
                  //Pictress in grid view
                  FadeInUp(
                    delay: Duration(milliseconds: 750),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.44,
                      // color: Colors.yellow,
                      child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.63, crossAxisCount: 2),
                          itemCount: mainList.length,
                          itemBuilder: (context, index) {
                            BaseModel current = mainList[index];
                            return GestureDetector(
                              onTap: () {
                                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Details(

                                  data: mainList[index], isCameFromMostPopularPart: false,
                                  
                                ),
                              )
                              );
                              },
                              child: Column(
                                children: [
                                  Hero(

                                    tag: current.imageUrl,
                                    child: Container(
                                      width: size.width * 0.5,
                                      height: size.height * 0.3,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          image: DecorationImage(
                                            image: AssetImage(current.imageUrl),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(0, 4),
                                              blurRadius: 4,
                                              color: Color.fromARGB(61, 0, 0, 0),
                                            )
                                          ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Text(
                                      current.name,
                                      style: theme.displayMedium,)
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: "\u{20AC} ",
                                        style: theme.titleSmall?.copyWith(
                                          color: primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: current.price.toString(),
                                              style: theme.titleSmall?.copyWith(
                                                
                                                fontWeight: FontWeight.bold,
                                              ))
                                        ]),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget view(int index, TextTheme theme, Size size) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double value = 0.0;
          if (_controller.position.haveDimensions) {
            value = index.toDouble() - (_controller.page ?? 0);
            value = (value * 0.04).clamp(-1, 1);
          }
          return Transform.rotate(
            angle: 3.14 * value,
            child: _buildCard(size, mainList[index], theme),
          );
        });
  }

  Padding _buildCard(Size size, BaseModel data, TextTheme theme) {
    return Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Hero(
              tag: data.id,
              child: Container(
                width: size.width * 0.6,
                height: size.height * 0.34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    image: DecorationImage(
                      image: AssetImage(data.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Color.fromARGB(61, 0, 0, 0),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                data.name,
                style: theme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            RichText(
              text: TextSpan(
                  text: "\u{20AC} ",
                  style: theme.titleSmall?.copyWith(
                    color: primaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: data.price.toString(),
                        style: theme.titleSmall?.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ))
                  ]),
            ),
          ],
        ));
  }
}
