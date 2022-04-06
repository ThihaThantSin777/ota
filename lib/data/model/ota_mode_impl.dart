import 'package:ota/data/model/ota_mode.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/data/vos/banner_vo/banner_vo.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_article_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_light_novle_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_vo.dart';
import 'package:ota/data/vos/read_content_vo/read_light_novel_content_vo.dart';
import 'package:ota/data/vos/read_content_vo/read_manga_content_vo.dart';
import 'package:ota/network/data_agent/ota_api_data_agent.dart';
import 'package:ota/network/data_agent/ota_data_agent_impl.dart';
import 'package:ota/persistent/article_dao/article_dao.dart';
import 'package:ota/persistent/banner_dao/banner_dao.dart';
import 'package:ota/persistent/is_favorite_dao/is_favorite_dao.dart';
import 'package:ota/persistent/light_novel_dao/light_novel_dao.dart';
import 'package:ota/persistent/manga_dao/manga_dao.dart';

class OTAModelImpl extends OTAModel {
  OTAModelImpl.internal();
  static final OTAModelImpl _singleton = OTAModelImpl.internal();
  factory OTAModelImpl() => _singleton;

  final OTAApiDataAgent _otaApiDataAgent = OTADataAgentImpl();
  final BannerDAO _bannerDAO = BannerDAO();
  final MangaDAO _mangaDAO = MangaDAO();
  final LightNovelDAO _lightNovelDAO = LightNovelDAO();
  final ArticleDAO _articleDAO = ArticleDAO();
  final IsFavoriteDAO _isFavoriteDAO = IsFavoriteDAO();

  @override
  Future<List<BannerVO>?> getBannerFromNetwork() =>
      _otaApiDataAgent.getBanner().then((bannerList) {
        _bannerDAO.saveBanner(bannerList);
        return Future.value(bannerList);
      }).catchError((error) => print(error));

  @override
  Future<List<MangaVO>?> getMangaFromNetwork() =>
      _otaApiDataAgent.getManga().then((managList) {
        _mangaDAO.saveManga(managList);
        return Future.value(managList);
      }).catchError((error) => print(error));

  @override
  Future<List<LightNovelVO>?> getLightNovelFromNetwork() =>
      _otaApiDataAgent.getLightNovel().then((lightNovelList) {
        _lightNovelDAO.saveLightNovel(lightNovelList);
        return Future.value(lightNovelList);
      }).catchError((error) => print(error));

  @override
  Future<List<ArticleVO>?> getArticleFromNetwork() =>
      _otaApiDataAgent.getArticle().then((articleList) {
        _articleDAO.saveArticle(articleList);
        return Future.value(articleList);
      }).catchError((error) => print(error));

  @override
  Stream<List<BannerVO>?> getBannerFromPersistent() {
    getBannerFromNetwork();
    return _bannerDAO
        .getBannerBoxStream()
        .map((event) => _bannerDAO.getAllBanners());
  }

  @override
  Stream<List<MangaVO>?> getMangaFromPersistent() {
    getMangaFromNetwork();
    return _mangaDAO
        .getMangaBoxStream()
        .map((event) => _mangaDAO.getAllMangas());
  }

  @override
  Stream<List<LightNovelVO>?> getLightNovelFromPersistent() {
    getLightNovelFromNetwork();
    return _lightNovelDAO
        .getLightNovelBoxStream()
        .map((event) => _lightNovelDAO.getAllLightNovels());
  }

  @override
  Stream<List<ArticleVO>?> getArticleFromPersistent() {
    getArticleFromNetwork();
    return _articleDAO
        .getArticleBoxStream()
        .map((event) => _articleDAO.getAllArticles());
  }

  @override
  Future<List<MangaVO>?> searchMangaFromNetwork(String searchKeyWord) =>
      _otaApiDataAgent.searchManga(searchKeyWord);

  @override
  Future<List<LightNovelVO>?> searchLightNovelFromNetwork(
          String searchKeyWord) =>
      _otaApiDataAgent.searchLightNovel(searchKeyWord);

  @override
  Future<List<ArticleVO>?> searchArticleFromNetwork(String searchKeyWord) =>
      _otaApiDataAgent.searchArticle(searchKeyWord);

  @override
  Future<List<ReadChapterVO>?> readChapterManagFromNetwork(String mangaID) =>
      _otaApiDataAgent.readChapterManga(mangaID);

  @override
  Future<List<ReadLightNovelVO>?> readLightNovel(String lightNovelID) =>
      _otaApiDataAgent.readLightNovel(lightNovelID);

  @override
  Future<List<ReadArticleVO>?> readArticle(String articleID) =>
      _otaApiDataAgent.readArticle(articleID);

  @override
  Future<List<ReadLightNovelContentVO>?> readLightNovelContent(String chptID) =>
      _otaApiDataAgent.readLightNovelContent(chptID);

  @override
  Future<List<ReadMangaContentVO>?> readMangaContent(String chptID) =>
      _otaApiDataAgent.readManagaCotent(chptID);

  @override
  void removeFavorite(String managaID) {
    _isFavoriteDAO.removeIsFavorite(managaID);
  }

  @override
  void saveIsFavorite(String managaID, bool isFavorite) {
    _isFavoriteDAO.saveIsFavorite(managaID, isFavorite);
  }

  @override
  bool? isFavorite(String managaID) {
    return _isFavoriteDAO.isFavoriteByID(managaID);
  }
}
