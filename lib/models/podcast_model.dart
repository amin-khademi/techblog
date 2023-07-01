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

  PodcastModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    poster = json['poster'];
    catName = json['cat_name'];
    view = json['view'];
    createdAt = json['created_at'];
  }
}
