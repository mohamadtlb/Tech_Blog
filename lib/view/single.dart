import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/controller/home_screen_controler.dart';
import 'package:tec/controller/list_article_controller.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/view/article_list_screen.dart';
import '../component/my_component.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../controller/single_article_controller.dart';

class Single extends StatefulWidget {
  Single({Key? key}) : super(key: key);

  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  HomeScreenControler homeScreenControler = Get.put(HomeScreenControler());
  ListArticleController listArticleController =
      Get.put(ListArticleController());
  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => singleArticleController.articleInfoModel.value.title == null
                ? SizedBox(height: Get.height, child: const loading())
                : Column(
                    children: [
                      //Image and Appbar
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: singleArticleController
                                .articleInfoModel.value.image!,
                            imageBuilder: (context, imageProvider) =>
                                Image(image: imageProvider),
                            placeholder: (context, url) => const loading(),
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                  Assets.images.singlePlaceHolder.path);
                            },
                          ),
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors:
                                            Gradiantcolors.singlePageGradiant)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    SizedBox(width: 15),
                                    Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                    Expanded(child: SizedBox()),
                                    Icon(
                                      Icons.bookmark_outline,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 15)
                                  ],
                                ),
                              ))
                        ],
                      ),
                      //titile
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          singleArticleController.articleInfoModel.value.title!,
                          style: texttheme.bodyText1,
                          maxLines: 2,
                        ),
                      ),
                      //avatar
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.images.peofileAvatar.path,
                              scale: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              singleArticleController
                                  .articleInfoModel.value.author!,
                              style: texttheme.bodyText1,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              singleArticleController
                                  .articleInfoModel.value.createdAt!,
                              style: texttheme.caption,
                            )
                          ],
                        ),
                      ),
                      //text
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HtmlWidget(
                          singleArticleController
                              .articleInfoModel.value.content!,
                          textStyle: texttheme.bodyText1,
                          enableCaching: true,
                          onLoadingBuilder:
                              (context, element, loadingProgress) =>
                                  const loading(),
                        ),
                      ),
                      const SizedBox(height: 25),
                      tags(texttheme),
                      const SizedBox(height: 25),
                      simmilar(texttheme),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget tags(texttheme) {
    var texttheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: singleArticleController.tagList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              var tagId = singleArticleController.tagList[index].id!;
              await listArticleController.getArticleListWithTagId(tagId);

              Get.to(ArticleListScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.grey),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Text(
                    singleArticleController.tagList[index].title!,
                    style: texttheme.bodyText1,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget simmilar(textheme) {
    var texttheme = Theme.of(context).textTheme;
    return SizedBox(
      height: Get.height / 3.5,
      child: ListView.builder(
          itemCount: singleArticleController.releatedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //blog item
            return GestureDetector(
              onTap: () {
                singleArticleController.getArticleInfo(
                    singleArticleController.releatedList[index].id);
              },
              child: Padding(
                padding:
                    EdgeInsets.only(right: index == 0 ? Get.width / 15 : 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: Get.height / 5.3,
                        width: Get.width / 2.4,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: singleArticleController
                                  .releatedList[index].image!,
                              imageBuilder: ((context, imageProvider) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                    foregroundDecoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: Gradiantcolors.blogPost)),
                                  )),
                              placeholder: ((context, url) => const loading()),
                              errorWidget: ((context, url, error) => const Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 50,
                                    color: Colors.grey,
                                  )),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    singleArticleController
                                        .releatedList[index].author!,
                                    style: texttheme.subtitle1,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        singleArticleController
                                            .releatedList[index].view!,
                                        style: texttheme.subtitle1,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        width: Get.width / 2.4,
                        child: Text(
                          singleArticleController.releatedList[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ))
                  ],
                ),
              ),
            );
          })),
    );
  }
}
