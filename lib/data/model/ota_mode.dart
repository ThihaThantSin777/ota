import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/data/vos/banner_vo/banner_vo.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_article_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_light_novle_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_vo.dart';
import 'package:ota/data/vos/read_content_vo/read_light_novel_content_vo.dart';
import 'package:ota/data/vos/read_content_vo/read_manga_content_vo.dart';

abstract class OTAModel {
  Future<List<BannerVO>?> getBannerFromNetwork();
  Future<List<MangaVO>?> getMangaFromNetwork();
  Future<List<LightNovelVO>?> getLightNovelFromNetwork();
  Future<List<ArticleVO>?> getArticleFromNetwork();
  Future<List<MangaVO>?> searchMangaFromNetwork(String searchKeyWord);
  Future<List<LightNovelVO>?> searchLightNovelFromNetwork(String searchKeyWord);
  Future<List<ArticleVO>?> searchArticleFromNetwork(String searchKeyWord);
  Future<List<ReadChapterVO>?> readChapterManagFromNetwork(String mangaID);
  Future<List<ReadLightNovelVO>?> readLightNovel(String lightNovelID);
  Future<List<ReadArticleVO>?> readArticle(String articleID);
  Future<List<ReadLightNovelContentVO>?> readLightNovelContent(String chptID);

  Future<List<ReadMangaContentVO>?> readMangaContent(String chptID);

  Stream<List<BannerVO>?> getBannerFromPersistent();
  Stream<List<MangaVO>?> getMangaFromPersistent();
  Stream<List<LightNovelVO>?> getLightNovelFromPersistent();
  Stream<List<ArticleVO>?> getArticleFromPersistent();

  void saveIsFavorite(String managaID, bool isFavorite);

  void removeFavorite(String managaID);

  bool? isFavorite(String managaID);
}
