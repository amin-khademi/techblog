class ApiUrlconstant {
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const hostDlUrl = "https://techblog.sasansafari.com";
  static const getHomeItem = "${baseUrl}home/?command=index";
  static const getArticleList =
      "${baseUrl}article/get.php?command=new&user_id=1";
  static const getArtocleByTags =
      "${baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=1&user_id=1";
  static const postRegister = "${baseUrl}register/action.php";
  static const publishedByMe =
      "${baseUrl}article/get.php?command=published_by_me&user_id=2";
  static const articlePost = "${baseUrl}article/post.php";
  static const podcastFile = "${baseUrl}podcast/get.php?command=get_files&podcats_id=";
}

class ApiArticleKeyConstant {
  static const title = "title";
  static const content = "content";
  static const catId = "cat_id";
  static const userId = "user_id";
  static const image = "image";
  static const command = "command";
  static const tagList = "tag_list";
  

}
