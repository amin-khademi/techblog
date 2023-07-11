import 'package:get/get.dart';
import 'package:techblog/constant/api_constant.dart';
import 'package:techblog/models/article_info_model.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_service.dart';
import 'package:techblog/view/article/single.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel =
      ArticleInfoModel(null, null, null).obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> relatedList = RxList();

  // ignore: unnecessary_overrides
  @override
  onInit() {
    super.onInit();
    // getArticleInfo();
  }

  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel(null, null, null).obs;
    loading.value = true;
    var userId = "";
    //TODO userid is hard code
    //TODO get userid from getstorage + userid

    var response = await DioService().getMethod(
        "${ApiUrlconstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId");

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    }
    tagList.clear();
    response.data['tags'].forEach((element) {
      tagList.add(TagsModel.fromjson(element));
    });

    // relatedList.clear();
    response.data['related'].forEach((element) {
      relatedList.add(ArticleModel.fromjson(element));
    });
    Get.to(Single());
  }
}
