import 'package:hive/hive.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/persistent/hive_constant.dart';

class ArticleDAO {
  ArticleDAO.internal();
  static final ArticleDAO _singleton = ArticleDAO.internal();
  factory ArticleDAO() => _singleton;
  Box<ArticleVO> _getArticleBox() => Hive.box<ArticleVO>(boxNameForArticleVO);
  Stream<void> getArticleBoxStream() {
    print('Article Watch');
    return _getArticleBox().watch();
  }

  void saveArticle(List<ArticleVO>? articleList) {
    Map<int, ArticleVO> article = {
      for (var article in articleList ?? [])
        int.parse(article.artId ?? '0'): article
    };

    _getArticleBox().putAll(article);
    print('Save Article');
  }

  List<ArticleVO>? getAllArticles() => _getArticleBox().values.toList();

  ArticleVO getArticleByID(String id)=>_getArticleBox().values.toList().where((element) => element.artId.toString()==id).first;

}
