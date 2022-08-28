import 'package:flutter/material.dart';
import 'package:tec/my_component.dart';
import '../gen/assets.gen.dart';
import '../my_colors.dart';
import '../my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              //Avatar
              Image(
                image: Assets.images.peofileAvatar,
                height: 100,
              ),
              const SizedBox(height: 12),
              //Edit Avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    Assets.icons.bluepen,
                    color: Solidcolors.seeMore,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    MyStrings.profileAvatarEdit,
                    style: textTheme.headline3,
                  )
                ],
              ),
              const SizedBox(height: 60),
              Text(
                "فاطمه امیری",
                style: textTheme.headline5,
              ),
              const SizedBox(height: 8),
              Text(
                "fatemehamiri@gmail.com",
                style: textTheme.headline4,
              ),
              const SizedBox(height: 40),
              TechDivider(size: size),
              InkWell(
                  onTap: () {},
                  splashColor: Solidcolors.primaryColor,
                  child: SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(MyStrings.myFavoriteArticle,
                          style: textTheme.headline4),
                    ),
                  )),
              TechDivider(size: size),
              InkWell(
                  onTap: () {},
                  splashColor: Solidcolors.primaryColor,
                  child: SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(MyStrings.myFavoritePodcast,
                          style: textTheme.headline4),
                    ),
                  )),
              TechDivider(size: size),
              InkWell(
                  onTap: () {},
                  splashColor: Solidcolors.primaryColor,
                  child: SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(MyStrings.logOut, style: textTheme.headline4),
                    ),
                  )),
              const SizedBox(height: 60)
            ],
          ),
        ));
  }
}
