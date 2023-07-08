class ApiConstant {
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const hostDlUrl = "https://techblog.sasansafari.com";
  static const getHomeItem = baseUrl + "home/?command=index";
  static const getArticleList = baseUrl + "article/get.php?command=new&user_id=1";
  static const getArtocleByTags = baseUrl + "article/get.php?command=get_articles_with_tag_id&tag_id=1&user_id=1";
}
