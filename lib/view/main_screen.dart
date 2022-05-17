import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';
import 'package:tec/view/home_screen.dart';
import 'package:tec/view/profile_screen.dart';

import '../models/fake_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0; 



  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;





    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: solidColors.scafoldBg,
          title: //appbar
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Image(
                image: Assets.images.logo,
                height: size.height / 13.6,
              ),
              const Icon(Icons.search, color: Colors.black),
            ],
          ),
        ),
        body: Stack(

          children: [
           Center(
             child: Positioned.fill(
               child: IndexedStack(
                 index: selectedPageIndex,
                 children: [
                      homeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin), //0
                      profileScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin) //1
                 ],

               )
            
            ),
           ),
           BottomNavigation(
             size: size,
             bodyMargin: bodyMargin,
             changeScreen: (int value){

                  setState(() {
                    selectedPageIndex = value;
                  });

             },
             ),
          ],


        ),
       ),
    );
  }
}


class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
              height: size.height / 10,
              decoration: const BoxDecoration(
         gradient: LinearGradient(
             colors: gradiantColors.bottomNavBackgroand,
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter)),
              child: Padding(
       padding:  EdgeInsets.only(right: bodyMargin,left: bodyMargin),
       child: Container(
         height: size.height / 8,
         decoration: const BoxDecoration(
           borderRadius: BorderRadius.all(Radius.circular(18)),
           gradient: LinearGradient(
             colors: gradiantColors.bottomNav,
           ),
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             IconButton(
                 onPressed: (()=>changeScreen(0)),
                 icon: ImageIcon(
                   Assets.icons.home,
                   color: Colors.white,
                 )),
             IconButton(
                 onPressed: (() {}),
                 icon: ImageIcon(
                   Assets.icons.write,
                   color: Colors.white,
                 )),
             IconButton(
                 onPressed: (()=>changeScreen(1)),
                 icon: ImageIcon(
                   Assets.icons.user,
                   color: Colors.white,
                 )),
           ],
         ),
       ),
              ),
            ),
    );
  }
}