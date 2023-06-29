import 'package:fashion_e_commerce_app/ZoomDrawer/MenuScreen.dart';
import 'package:fashion_e_commerce_app/ZoomDrawer/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final ZoomDrawerController zoomController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return  ZoomDrawer(
        controller: zoomController,
        menuScreen: MenuScreen(),
        mainScreen: MainWrapper(),
        borderRadius: 24.0,
        showShadow: true,
        angle: -12,
        slideWidth: MediaQuery.of(context).size.width * .65,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceOut,
        duration: const Duration(milliseconds: 300),

      );
  }
}