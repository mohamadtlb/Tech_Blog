import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
import '../my_colors.dart';
import '../my_strings.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
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
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            homePagePoster(size: size, textTheme: textTheme),
            const SizedBox(height: 16),
            homePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(height: 25),
            seeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
            homePageBlogList(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(height: 25),
            seeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
            homePagePodcastList(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
}

class homePagePodcastList extends StatelessWidget {
  const homePagePodcastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          itemCount: podcastList.length,
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
                      child: Stack(
                        children: [
                          //Iamge
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      podcastList[index].podImageUrl),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        podcastList[index].podTitle,
                        style: textTheme.headline4,
                      ))
                ],
              ),
            );
          })),
    );
  }
}

class seeMorePodcast extends StatelessWidget {
  const seeMorePodcast({
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

class homePageBlogList extends StatelessWidget {
  const homePageBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          itemCount: blogList.getRange(0, 5).length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //Blogitems
            return Padding(
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
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                  image: NetworkImage(blogList[index].imageUrl),
                                  fit: BoxFit.cover,
                                )),
                            foregroundDecoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: Gradiantcolors.blogPost)),
                          ),
                          //Text
                          Positioned(
                            bottom: 8,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  blogList[index].writer,
                                  style: textTheme.subtitle1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      blogList[index].views,
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
                  SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        blogList[index].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ))
                ],
              ),
            );
          })),
    );
  }
}

class seeMoreBlog extends StatelessWidget {
  const seeMoreBlog({
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

class homePageTagList extends StatelessWidget {
  const homePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          itemCount: tagList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
              child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    gradient: LinearGradient(
                      colors: Gradiantcolors.tags,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                    child: Row(
                      children: [
                        ImageIcon(
                          Assets.icons.hashtagicon,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(tagList[index].title, style: textTheme.headline2)
                      ],
                    ),
                  )),
            );
          })),
    );
  }
}

class homePagePoster extends StatelessWidget {
  const homePagePoster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Image & Gradiant
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image: AssetImage(homePagePosterMAp["imageAsset"]),
                  fit: BoxFit.cover)),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: Gradiantcolors.homePosterCover,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        // Text
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMAp["writer"] +
                        " - " +
                        homePagePosterMAp["date"],
                    style: textTheme.subtitle1,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMAp["view"],
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
              Text(
                homePagePosterMAp["title"],
                style: textTheme.headline1,
              )
            ],
          ),
        ),
      ],
    );
  }
}
