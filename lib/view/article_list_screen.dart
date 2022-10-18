import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/list_article_controller.dart';
import 'package:tec/controller/single_article_controller.dart';
import 'package:tec/view/single.dart';
import '../component/my_component.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({Key? key}) : super(key: key);
  ListArticleController listarticleController =
      Get.put(ListArticleController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
          appBar: appBar("لیست مقاله ها"),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Obx(
                () => ListView.builder(
                  itemCount: listarticleController.articleList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (() {
                        singleArticleController.getArticleInfo(
                            listarticleController.articleList[index].id);
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //image
                            SizedBox(
                              height: Get.height / 6,
                              width: Get.width / 3,
                              child: CachedNetworkImage(
                                imageUrl: listarticleController
                                    .articleList[index].image!,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover)),
                                  );
                                },
                                placeholder: (context, url) => const loading(),
                                errorWidget: (context, url, error) {
                                  return const Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 50,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            //texts
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width / 2,
                                  child: Text(
                                    listarticleController
                                        .articleList[index].title!,
                                    style: texttheme.bodyText1,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        listarticleController
                                            .articleList[index].author!,
                                        style: texttheme.caption),
                                    const SizedBox(width: 10),
                                    Text(
                                      "${listarticleController.articleList[index].view!}بازدید",
                                      style: texttheme.caption,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      listarticleController
                                          .articleList[index].catName!,
                                      style: texttheme.headline3,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )),
    );
  }
}
