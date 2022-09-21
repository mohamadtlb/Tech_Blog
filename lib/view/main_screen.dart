import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/component/my_component.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/view/profile_screen.dart';
import 'package:tec/view/register_intro.dart';
import 'home_screen.dart';
import 'package:share_plus/share_plus.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
            backgroundColor: Solidcolors.scaffoldBg,
            child: Padding(
              padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
              child: ListView(
                children: [
                  DrawerHeader(
                      child: Center(
                    child: Image.asset(Assets.images.logo.path, scale: 3),
                  )),
                  ListTile(
                    title: Text(
                      "پروفایل کاربری",
                      style: textTheme.headline4,
                    ),
                    onTap: () {},
                  ),
                  const Divider(
                    color: Solidcolors.dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      "درباره تک بلاگ",
                      style: textTheme.headline4,
                    ),
                    onTap: () {},
                  ),
                  const Divider(
                    color: Solidcolors.dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      "اشتراک گذاری تک بلاگ",
                      style: textTheme.headline4,
                    ),
                    onTap: () async {
                      await Share.share(MyStrings.shareText);
                    },
                  ),
                  const Divider(
                    color: Solidcolors.dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      "تک بلاگ در گیت هاب",
                      style: textTheme.headline4,
                    ),
                    onTap: () {
                      mylaunchUrl(MyStrings.techBlogGithubUrl);
                    },
                  ),
                  const Divider(
                    color: Solidcolors.dividerColor,
                  ),
                ],
              ),
            )),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Solidcolors.scaffoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: const Icon(Icons.menu, color: Colors.black)),
              Image(image: Assets.images.logo, height: size.height / 13.6),
              const Icon(Icons.search, color: Colors.black)
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Obx(
              () => IndexedStack(
                index: selectedPageIndex.value,
                children: [
                  HomeScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  const RegisterIntro(),
                  ProfileScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                ],
              ),
            )),
            BottomNavigation(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                selectedPageIndex.value = value;
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
      bottom: 8,
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
                    onPressed: (() => changeScreen(0)),
                    icon: ImageIcon(
                      Assets.icons.home,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: (() => changeScreen(1)),
                    icon: ImageIcon(
                      Assets.icons.write,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: (() => changeScreen(2)),
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
