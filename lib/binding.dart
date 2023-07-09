import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:techblog/controller/register_controller.dart';
import 'package:techblog/controller/single_article_controller.dart';

class ArticleBiniding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SingleArticleController);
  }
}



class RegisterBiniding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RegisterController);
  }
}

