import 'package:tec/component/api_constant.dart';

class ArticleInfoModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorated;

  ArticleInfoModel();

  ArticleInfoModel.fromJson(Map<String, dynamic> element) {
    id = element['info']['id'];
    title = element['info']['title'];
    content = element['info']['content'];
    image = ApiConstant.hostDlUrl + element['info']['image'];
    catId = element['info']['cat_id'];
    catName = element['info']['cat_name'];
    author = element['info']['author'];
    view = element['info']['view'];
    status = element['info']['status'];
    createdAt = element['info']['created_at'];
    isFavorated = element['isFavorated'];
  }
}
