import 'package:get/get.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/services/dio_service.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();

  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    //TODO get userid from getstorage + userid

    var response = await DioService().getMethod(ApiConstant.getArticleList);

    if (response.statusCode == 200) {
      loading.value = true;
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromjson(element));
      });

      loading.value = false;
    }
  }

  getArticleListWithTagsId(String id) async {
    articleList.call();
    loading.value = true;
    //TODO get userid from getstorage + userid

    var response = await DioService().getMethod(ApiConstant.baseUrl +
        "article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromjson(element));
      });

      loading.value = false;
    }
  }
}
