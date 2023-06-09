import 'package:get/get.dart';
import 'package:techblog/constant/api_constant.dart';

import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/podcast_model.dart';
import 'package:techblog/models/poster_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> topVisited = RxList();
  RxList<PodcastModel> topPodcast = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiUrlconstant.getHomeItem);

    if (response.statusCode == 200) {
      response.data["top_visited"].forEach((element) {
        topVisited.add(ArticleModel.fromjson(element));
      });
      response.data["top_podcasts"].forEach((element) {
        topPodcast.add(PodcastModel.fromjson(element));
      });

      poster.value = PosterModel.fromjsom(response.data["poster"]);

      response.data["tags"].forEach((element) {
        tagList.add(TagsModel.fromjson(element));
      });

      loading.value = false;
    }
  }
}
