import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:techblog/rout_manager/binding.dart';
import 'package:techblog/rout_manager/names.dart';
import 'package:techblog/view/article/mangeArticle.dart';
import 'package:techblog/view/article/single.dart';
import 'package:techblog/view/article/single_manage_article.dart';
import 'package:techblog/view/main-screen/main_screen.dart';
import 'package:techblog/view/podcast/single_poscast.dart';
import 'package:techblog/view/splash_screen.dart';

class Pages {
  Pages._();
  static List<GetPage<dynamic>> pages = [
    GetPage(
        name: NamedRout.initialRoute,
        page: () => const SplashScreen(),
        ),
    GetPage(
        name: NamedRout.routeMainScreen,
        page: () => MainScreen(),
        binding: RegisterBiniding()),
    GetPage(
        name: NamedRout.routeSingleArticle,
        page: () => Single(),
        binding: ArticleBiniding()),
    GetPage(
        name: NamedRout.routeManageArticle,
        page: () => ManageArticle(),
        binding: ArticleManagerBiniding()),
    GetPage(
        name: NamedRout.routeSingleManageArticle,
        page: () => SingleManageArticle(),
        binding: ArticleManagerBiniding()),
    GetPage(
      name: NamedRout.routeSinglePodcast,
      page: () => SinglePodcast(),
    ),
  ];
}
