import 'package:ota/data/vos/read_chapter_vo/read_chapter_light_novle_vo.dart';
import 'package:ota/network/response/article_response/article_response.dart';
import 'package:ota/network/response/article_response/read_article_response.dart';
import 'package:ota/network/response/banner_response/banner_response.dart';
import 'package:ota/network/response/light_novle_response/light_novel_response.dart';
import 'package:ota/network/response/light_novle_response/read_light_novel.dart';
import 'package:ota/network/response/light_novle_response/read_light_novel_content.dart';
import 'package:ota/network/response/manga_response/manga_response.dart';
import 'package:ota/network/response/manga_response/read_chapter_manga_response.dart';
import 'package:ota/network/response/manga_response/read_manga_content_response.dart';

abstract class OTAApi {
  Future<BannerResponse> getBanner();

  Future<MangaResponse> getManga();

  Future<MangaResponse> searchManga(String searchKeyWork);

  Future<ReadChapterMangaResponse> readChapterManga(String mangaID);

  Future<ReadMangaContentResponse> readMangaContent(String chptID);

  Future<LightNovelResponse> getLightNovel();

  Future<ReadLightNovelResponse> readLightNovel(String lightNovelID);

  Future<ReadLightNovelContentResponse> readLightNovelContent(String chptID);

  Future<LightNovelResponse> searchLightNovel(String searchKeyWork);

  Future<ArticleResponse> getArticle();

  Future<ArticleResponse> searchArticle(String searchKeyWork);

  Future<ReadArticleResponse> readArticle(String aricleID);
}
