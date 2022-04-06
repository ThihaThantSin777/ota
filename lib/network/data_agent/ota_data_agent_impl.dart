import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/data/vos/banner_vo/banner_vo.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_article_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_light_novle_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_vo.dart';
import 'package:ota/data/vos/read_content_vo/read_light_novel_content_vo.dart';
import 'package:ota/data/vos/read_content_vo/read_manga_content_vo.dart';
import 'package:ota/network/api/ota_api.dart';
import 'package:ota/network/api/ota_api_impl.dart';
import 'package:ota/network/data_agent/ota_api_data_agent.dart';

class OTADataAgentImpl extends OTAApiDataAgent {
  OTADataAgentImpl.internal();
  static final OTADataAgentImpl _singleton = OTADataAgentImpl.internal();
  factory OTADataAgentImpl() => _singleton;
  final OTAApi _otaApi = OTAApiImpl();
  @override
  Future<List<BannerVO>?> getBanner() =>
      _otaApi.getBanner().asStream().map((banner) => banner.records).first;

  @override
  Future<List<MangaVO>?> getManga() =>
      _otaApi.getManga().asStream().map((manga) => manga.records).first;

  @override
  Future<List<LightNovelVO>?> getLightNovel() => _otaApi
      .getLightNovel()
      .asStream()
      .map((lightNovel) => lightNovel.records)
      .first;

  @override
  Future<List<ArticleVO>?> getArticle() =>
      _otaApi.getArticle().asStream().map((article) => article.articles).first;

  @override
  Future<List<MangaVO>?> searchManga(String searchKeyWord) => _otaApi
      .searchManga(searchKeyWord)
      .asStream()
      .map((manga) => manga.records)
      .first;

  @override
  Future<List<LightNovelVO>?> searchLightNovel(String searchKeyWord) => _otaApi
      .searchLightNovel(searchKeyWord)
      .asStream()
      .map((lightNovle) => lightNovle.records)
      .first;

  @override
  Future<List<ArticleVO>?> searchArticle(String searchKeyWord) => _otaApi
      .searchArticle(searchKeyWord)
      .asStream()
      .map((article) => article.articles)
      .first;

  @override
  Future<List<ReadChapterVO>?> readChapterManga(String mangaID) => _otaApi
      .readChapterManga(mangaID)
      .asStream()
      .map((readChaptermanga) => readChaptermanga.chpts)
      .first;

  @override
  Future<List<ReadLightNovelVO>?> readLightNovel(String lightNovelID) => _otaApi
      .readLightNovel(lightNovelID)
      .asStream()
      .map((lightNovelList) => lightNovelList.chpts)
      .first;

  @override
  Future<List<ReadArticleVO>?> readArticle(String articleID) => _otaApi
      .readArticle(articleID)
      .asStream()
      .map((article) => article.cont)
      .first;

  @override
  Future<List<ReadLightNovelContentVO>?> readLightNovelContent(
          String lightNovelID) =>
      _otaApi
          .readLightNovelContent(lightNovelID)
          .asStream()
          .map((lightNovel) => lightNovel.cont)
          .first;

  @override
  Future<List<ReadMangaContentVO>?> readManagaCotent(String chptID) => _otaApi
      .readMangaContent(chptID)
      .asStream()
      .map((manga) => manga.cont)
      .first;
}
