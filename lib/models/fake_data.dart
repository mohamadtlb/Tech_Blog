import 'package:tec/gen/assets.gen.dart';

import 'data_models.dart';

Map homePagePosterMAp = {
  "imageAsset": Assets.images.posterTest.path,
  "writer": "ملیکا عزیز",
  "date": "یک روز پیش",
  "title": "دوازده قدم برنامه نویسی یک دوره",
  "view": "251"
};

// blog fake data
List<HashTagModel> tagList = [
  HashTagModel(title: "جاوا"),
  HashTagModel(title: "کاتلین"),
  HashTagModel(title: "وب"),
  HashTagModel(title: "هوش مصنوعی"),
  HashTagModel(title: "iot"),
  HashTagModel(title: "دارت"),
];
List<HashTagModel> selectedTags = [];
