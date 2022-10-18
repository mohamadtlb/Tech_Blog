import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tec/controller/home_screen_controler.dart';
import 'package:tec/controller/single_article_controller.dart';
import 'package:tec/view/article_list_screen.dart';
import '../../controller/list_article_controller.dart';
import '../../gen/assets.gen.dart';
import '../../models/fake_data.dart';
import '../../component/my_colors.dart';
import '../../component/my_component.dart';
import '../../component/my_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  HomeScreenControler homeScreenControler = Get.put(HomeScreenControler());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  ListArticleController listArticleController =
      Get.put(ListArticleController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: homeScreenControler.loading.value == false
              ? Column(
                  children: [
                    poster(),
                    const SizedBox(height: 16),
                    GestureDetector(
                        onTap: () => Get.to(ArticleListScreen()),
                        child: tags()),
                    const SizedBox(height: 25),
                    GestureDetector(
                        onTap: () => Get.to(ArticleListScreen()),
                        child: SeeMoreBlog(
                            bodyMargin: bodyMargin, textTheme: textTheme)),
                    topVisited(),
                    const SizedBox(height: 25),
                    SeeMorePodcast(
                        bodyMargin: bodyMargin, textTheme: textTheme),
                    topPodcasts(),
                    const SizedBox(height: 60)
                  ],
                )
              : const SpinKitPouringHourGlassRefined(
                  color: Solidcolors.primaryColor,
                  size: 50,
                ),
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
            itemCount: homeScreenControler.topVisitedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              //Blogitems
              return GestureDetector(
                onTap: () {
                  singleArticleController.getArticleInfo(
                      homeScreenControler.topVisitedList[index].id);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: size.height / 5.3,
                          width: size.width / 2.4,
                          child: Stack(
                            children: [
                              //Iamge
                              CachedNetworkImage(
                                imageUrl: homeScreenControler
                                    .topVisitedList[index].image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover)),
                                ),
                                placeholder: (context, url) => const loading(),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              //Text
                              Positioned(
                                bottom: 8,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      homeScreenControler
                                          .topVisitedList[index].author!,
                                      style: textTheme.subtitle1,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          homeScreenControler
                                              .topVisitedList[index].view!,
                                          style: textTheme.subtitle1,
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: Colors.white,
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //title
                      SizedBox(
                          width: size.width / 2.4,
                          child: Text(
                            homeScreenControler.topVisitedList[index].title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ))
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }

  Widget topPodcasts() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
            itemCount: homeScreenControler.topPodcasts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              //PodItem
              return Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: size.height / 5.3,
                          width: size.width / 2.4,
                          child:
                              //image
                              CachedNetworkImage(
                            imageUrl:
                                homeScreenControler.topPodcasts[index].poster!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            ),
                            placeholder: (context, url) => loading(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.image_not_supported_outlined,
                              color: Colors.grey,
                            ),
                          )),
                    ),
                    //title
                    SizedBox(
                        width: size.width / 2.4,
                        child: Text(
                          homeScreenControler.topPodcasts[index].title!,
                          style: textTheme.headline4,
                        ))
                  ],
                ),
              );
            })),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        //Image & Gradiant
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: Gradiantcolors.homePosterCover,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: CachedNetworkImage(
            imageUrl: homeScreenControler.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
            placeholder: (context, url) => const loading(),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_outlined,
              color: Colors.grey,
            ),
          ),
        ),
        // Text
        Positioned(
          bottom: 8,
          left: 0,
          right: 15,
          child: Column(
            children: [
              Text(
                homeScreenControler.poster.value.title!,
                style: textTheme.headline1,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget tags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          itemCount: homeScreenControler.tagsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () async {
                var tagId = homeScreenControler.tagsList[index].id!;
                await listArticleController.getArticleListWithTagId(tagId);
                Get.to(ArticleListScreen());
              },
              child: Padding(
                padding:
                    EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
                child: Maintags(textTheme: textTheme, index: index),
              ),
            );
          })),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluemic,
            color: Solidcolors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestPodcasts,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluepen,
            color: Solidcolors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestBlog,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}
