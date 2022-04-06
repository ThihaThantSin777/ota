import 'package:ota/data/vos/read_chapter_vo/read_article_vo.dart';

class ReadArticleResponse {
  List<ReadArticleVO>? cont;

  ReadArticleResponse(this.cont);

  static ReadArticleResponse readArticleFromResponse(
          Map<String, dynamic> json) =>
      ReadArticleResponse(
        (json['cont'] as List<dynamic>?)
            ?.map((e) => ReadArticleVO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
