import 'package:get/get.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/podcast_model.dart';
import 'package:techblog/models/poster_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> topVisited = RxList();
  RxList<PodcastModel> topPodcast = RxList();
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await DioService().getMethod(ApiConstant.getHomeItem);

    if (response.statusCode == 200) {
      response.data["top_visited"].forEach((element) {
        topVisited.add(ArticleModel.fromjsom(element));
      });
      response.data["top_podcasts"].forEach((element) {
        topPodcast.add(PodcastModel.fromjson(element));
      });
    }
  }
}
