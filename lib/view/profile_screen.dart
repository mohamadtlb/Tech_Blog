import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
import '../my_colors.dart';
import '../my_strings.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({
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
        child: Column(
          children: [
            //Avatar
            Image(
              image: Assets.images.peofileAvatar,
              height: 100,
            ),
            const SizedBox(height: 32),
            //Edit Avatar
            Row(
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
            )
          ],
        ));
  }
}
