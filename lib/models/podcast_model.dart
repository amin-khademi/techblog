import 'package:techblog/constant/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? view;
  String? createdAt;
  String? author;

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
    poster = ApiUrlconstant.hostDlUrl + element['poster'];
    author = element["author"];
    view = element['view'];
    createdAt = element['created_at'];
  }
}
