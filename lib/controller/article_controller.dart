import 'package:get/get.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/services/dio_service.dart';

class ArticleController extends GetxController {
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
        articleList.add(ArticleModel.fromjsom(element));
      });

      loading.value = false;
    }
  }
}
