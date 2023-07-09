import 'package:get/get.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/services/dio_service.dart';

import '../../component/api_constant.dart';

class MangeArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getMangeArticle();
  }

  getMangeArticle() async {
    loading.value = true;
    //TODO get userid from getstorage + userid

    // var response = await DioService().getMethod(
    //     ApiConstant.publishedByMe + GetStorage().read(StorageKey.userId));
    var response =
        await DioService().getMethod(ApiConstant.publishedByMe + "2");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromjson(element));
      });
      // articleList.clear();
      loading.value = false;
    }
  }
}
