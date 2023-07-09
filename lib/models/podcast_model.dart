

import 'package:techblog/constant/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? view;
  String? createdAt;

  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.catName,
    required this.view,
    required this.createdAt,
  });

  PodcastModel.fromjson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    poster =ApiConstant.hostDlUrl+ element['poster'];
    catName = element['cat_name'];
    view = element['view'];
    createdAt = element['created_at'];
  }
}
