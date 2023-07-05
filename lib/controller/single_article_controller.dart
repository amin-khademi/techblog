import 'package:get/get.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/services/dio_service.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);

  @override
  onInit() {
    super.onInit();
  }

  getArticleInfo() async {
    loading.value = true;
    //TODO get userid from getstorage + userid

    var response = await DioService().getMethod(ApiConstant.getArticleList);

    if (response.statusCode == 200) {
      loading.value = true;
      response.data.forEach((element) {
       
      });

      loading.value = false;
    }
  }
}
