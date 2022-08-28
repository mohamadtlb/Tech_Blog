import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/my_component.dart';
import '../my_colors.dart';
import '../my_strings.dart';

class MyCats extends StatefulWidget {
  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 25),
                //pic
                SvgPicture.asset(Assets.images.techBotSvg.path, height: 100),
                //text
                const SizedBox(height: 16),
                Text(
                  MyStrings.succesfulRegister,
                  style: textTheme.headline5,
                ),
                //textfield
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    style: textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.headline6,
                    ),
                  ),
                ),
                //choose Cat Text
                const SizedBox(height: 18),
                Text(
                  MyStrings.chooseCat,
                  style: textTheme.headline5,
                ),
                //Main tagList
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.3),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (!selectedTags.contains(tagList[index])) {
                                  selectedTags.add(tagList[index]);
                                } else {
                                  print("${tagList[index]} exist");
                                }
                              });
                            },
                            child:
                                Maintags(textTheme: textTheme, index: index));
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //arrow Icon
                ImageIcon(
                  Assets.icons.dawnCatArrow,
                  size: 50,
                ),
                //Selected Taglist
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: selectedTags.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.2),
                      itemBuilder: (context, index) {
                        return Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                color: Solidcolors.selectedTags),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(width: 8),
                                  Text(selectedTags[index].title,
                                      style: textTheme.headline4),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedTags.removeAt(index);
                                      });
                                    },
                                    child: Icon(
                                      CupertinoIcons.delete,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                //Icon
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    height: 45,
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () =>
                          {_endReisterBottomSheet(context, size, textTheme)},
                      child: const Text("ادامه"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Future<dynamic> _endReisterBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //tecbot icon
                    Row(children: [
                      SvgPicture.asset(Assets.images.techBotSvg.path,
                          height: 30),
                      const SizedBox(width: 15),
                      Text(MyStrings.shareYourdata, style: textTheme.headline4),
                    ]),
                    //text
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: MyStrings.think,
                              style: textTheme.headlineLarge)),
                    ),
                    //manage icons
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          ImageIcon(Assets.icons.manageArticleIcon, size: 40),
                          const SizedBox(width: 15),
                          Text("مدیریت مقاله ها", style: textTheme.headline4),
                          const SizedBox(width: 40),
                          ImageIcon(Assets.icons.managePodcastIcon, size: 40),
                          const SizedBox(width: 15),
                          Text("مدیریت پادکست ها", style: textTheme.headline4)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
