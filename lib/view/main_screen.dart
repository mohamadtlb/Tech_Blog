import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Solidcolors.scaffoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.menu, color: Colors.black),
              Image(image: Assets.images.logo, height: size.height / 13.6),
              const Icon(Icons.search, color: Colors.black)
            ],
          ),
        ),
        body: Stack(
          children: [
            homeScreen(
                size: size, textTheme: textTheme, bodyMargin: bodyMargin),
            BottomNavigation(size: size, bodyMargin: bodyMargin),
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
  }) : super(key: key);

  final Size size;
  final double bodyMargin;

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
          colors: Gradiantcolors.bottomNavBg,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(
                  colors: Gradiantcolors.bottomNav,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: (() {}),
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
                    onPressed: (() {}),
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
