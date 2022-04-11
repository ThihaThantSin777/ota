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
import 'package:ota/persistent/page_index_dao/page_index_dao.dart';
import 'package:ota/resources/const_string.dart';

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
  final PageIndexDAO _pageIndexDAO=PageIndexDAO();

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
  void removeFavorite(String id,String keyword) {
    _isFavoriteDAO.removeIsFavorite(id,keyword);
  }

  @override
  void saveIsFavorite(String id, bool isFavorite,String keyword) {
    _isFavoriteDAO.saveIsFavorite(id, isFavorite,keyword);
  }

  @override
  bool? isFavorite(String id,String keyword) {
    return _isFavoriteDAO.isFavoriteByID(id,keyword);
  }


  @override
  MangaVO? getMangaByID(String id) {
   return _mangaDAO.getMangaByID('$id-$keyManga');
  }

  @override
  Stream<void> getFavoriteStream() {
    return _isFavoriteDAO.getIsFavooriteBoxStream();
  }

  @override
  List<MangaVO>? getMangaFavorite() {
    List<MangaVO>list=[];
    List<dynamic>getIDs=_isFavoriteDAO.getFavoriteIDs(keyManga);
    for (var managaID in getIDs) {
      MangaVO? mangaVO= _mangaDAO.getMangaByID(managaID);

      list.add(mangaVO);
    }
    return list;
  }

  @override
  LightNovelVO? getLightNovelByID(String id) {
    return _lightNovelDAO.getLightNovelByID('$id-$keyLightNovel');
  }

  @override
  List<LightNovelVO>? getLightNovelFavorite() {
    List<LightNovelVO>list=[];
    List<dynamic>getIDs=_isFavoriteDAO.getFavoriteIDs(keyLightNovel);
    for (var lightNovelID in getIDs) {
      LightNovelVO? lightNovelVO= _lightNovelDAO.getLightNovelByID(lightNovelID);

      list.add(lightNovelVO);
    }
    return list;
  }

  @override
  ArticleVO? getArticleByID(String id) {
    return _articleDAO.getArticleByID('$id-$keyArticle');
  }

  @override
  List<ArticleVO>? getArticleFavorite() {
    List<ArticleVO>list=[];
    List<dynamic>getIDs=_isFavoriteDAO.getFavoriteIDs(keyArticle);
    for (var artID in getIDs) {
      ArticleVO? articleVO= _articleDAO.getArticleByID(artID);

      list.add(articleVO);
    }
    return list;
  }

  @override
  bool isFavoriteAllEmpty() =>_isFavoriteDAO.isBoxEmpty();

  @override
  int getPageIndexByID(String id) {
    return _pageIndexDAO.getPageIndexByID(id)??0;
  }

  @override
  void savePageIndex(int index, String id) {
    _pageIndexDAO.savePageIndex(id, index);
  }



}
