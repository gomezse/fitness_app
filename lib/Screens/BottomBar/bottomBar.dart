import 'package:fitness_app/Screens/Home/home.dart';
import 'package:fitness_app/Screens/Intro/intro.dart';
import 'package:fitness_app/Screens/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../Route/block.navigation_bloc/navigation_bloc.dart';

class BottombarPage extends StatefulWidget implements NavigationStates{

  @override
  State<BottombarPage> createState() => _BottombarPageState();

}

List<Widget> _buildScreens (){
  return [
      HomePage(),
      IntroPage(),
      LoginPage()
  ];
}

List<PersistentBottomNavBarItem> _navBarItems(){
  return [
    PersistentBottomNavBarItem(icon: Icon(Icons.home),title: 'Home',textStyle: GoogleFonts.poppins(
      fontSize: 8
    ),
    inactiveColorPrimary: Colors.grey,
    activeColorPrimary: Colors.black),
    PersistentBottomNavBarItem(icon: Icon(Icons.menu),title: 'Menu',textStyle: GoogleFonts.poppins(
        fontSize: 8
    ),
        inactiveColorPrimary: Colors.grey,
        activeColorPrimary: Colors.black),
    PersistentBottomNavBarItem(icon: Icon(Icons.favorite),title: 'Favoritos',textStyle: GoogleFonts.poppins(
        fontSize: 8
    ),
        inactiveColorPrimary: Colors.grey,
        activeColorPrimary: Colors.black),
  ];
}



class _BottombarPageState extends State<BottombarPage> {
  PersistentTabController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=PersistentTabController(initialIndex: 0);

  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarItems(),
        onItemSelected: (index){
         setState(() {
           _controller!.index=index;
         });
      } ,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarStyle:NavBarStyle.style12,
        navBarHeight: 60,
    );

  }
}
