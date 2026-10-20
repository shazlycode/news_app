import 'package:dio/dio.dart';

class NewsTopic {
  final String? newsTitle;
  final String? newsImage;
  final Dio dio = Dio();
  NewsTopic({this.newsTitle, this.newsImage});
  static const apiKey = "909487859a504f9893c89c02680301f5";

  Future<List<NewsTopic>> fetchNews(
    String searchCategory,
    String country,
  ) async {
    try {
      final response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=$country&category=$searchCategory&apiKey=$apiKey",
      );

      List articles = response.data['articles'];
      List<NewsTopic> newsTopics = [];
      for (var article in articles) {
        var item = NewsTopic(
          newsTitle: article['title'],
          newsImage: article['urlToImage'],
        );
        newsTopics.add(item);
      }
      return newsTopics;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
