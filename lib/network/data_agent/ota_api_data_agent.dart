import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/data/vos/banner_vo/banner_vo.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_article_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_light_novle_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_vo.dart';
import 'package:ota/data/vos/read_content_vo/read_light_novel_content_vo.dart';
import 'package:ota/data/vos/read_content_vo/read_manga_content_vo.dart';

abstract class OTAApiDataAgent {
  Future<List<BannerVO>?> getBanner();

  Future<List<MangaVO>?> getManga();

  Future<List<ReadChapterVO>?> readChapterManga(String mangaID);
  Future<List<LightNovelVO>?> getLightNovel();

  Future<List<ArticleVO>?> getArticle();

  Future<List<MangaVO>?> searchManga(String searchKeyWord);

  Future<List<LightNovelVO>?> searchLightNovel(String searchKeyWord);

  Future<List<ReadLightNovelVO>?> readLightNovel(String lightNovelID);

  Future<List<ReadLightNovelContentVO>?> readLightNovelContent(
      String lightNovelID);

  Future<List<ArticleVO>?> searchArticle(String searchKeyWord);

  Future<List<ReadArticleVO>?> readArticle(String articleID);

  Future<List<ReadMangaContentVO>?> readManagaCotent(String chptID);
}
