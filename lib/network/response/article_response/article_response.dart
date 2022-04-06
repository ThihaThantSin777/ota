import 'package:ota/data/vos/article_vo/article_vo.dart';

class ArticleResponse {
  List<ArticleVO>? articles;

  ArticleResponse(this.articles);

  static ArticleResponse articleFromResponse(Map<String, dynamic> json) =>
      ArticleResponse(
        (json['articles'] as List<dynamic>?)
            ?.map((e) => ArticleVO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
