class Api {
  static const String BaseUrl = "http://www.wanandroid.com/";

  //首页banner
  static const String BANNER = "banner/json";

//  首页文章列表
  static String getIndexArtList(String page) => "article/list/${page}/json";
}
