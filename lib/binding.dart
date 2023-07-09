import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:techblog/controller/article/list_article_controller.dart';
import 'package:techblog/controller/article/mange_article_controller.dart';
import 'package:techblog/controller/register_controller.dart';
import 'package:techblog/controller/article/single_article_controller.dart';

class ArticleBiniding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ListArticleController());
    Get.lazyPut(() => SingleArticleController);
  }
}
class ArticleManagerBiniding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MangeArticleController());
    
  }
}

class RegisterBiniding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterController());
  }
}
