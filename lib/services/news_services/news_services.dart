import 'package:dio/dio.dart';
import 'package:news_cloud/models/article_model.dart';

class NewsService {
  Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>>getNews({required String category}) async {
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=59282832c71f463a845ba6b359b6d174&category=$category");

    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData["articles"];
    List<ArticleModel> allArticles = [];
    for (var article in articles) {
      ArticleModel articleModel = ArticleModel.fromJson(article);
      allArticles.add(articleModel);
    }

    return allArticles;
  }
}
