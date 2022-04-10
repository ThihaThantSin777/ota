import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:ota/persistent/is_favorite_dao/is_favorite_dao.dart';
import 'package:ota/persistent/manga_dao/manga_dao.dart';

import '../data/model/ota_mode.dart';
import '../data/model/ota_mode_impl.dart';
import '../data/vos/article_vo/article_vo.dart';
import '../data/vos/light_novel_vo/light_novel_vo.dart';
import '../data/vos/manga_vo/manga_vo.dart';
import '../resources/const_string.dart';

class FavoritePageProvider extends ChangeNotifier {
  List<MangaVO>? _mangaVOList;
  List<LightNovelVO>? _lightNovelList;
  List<ArticleVO>? _articleList;
  bool _isNoInternet = false;
  bool _isAllEmpty=false;
  final OTAModel _otaModel = OTAModelImpl();

  set setIsAllEmpty(bool isAllEmpty) => _isAllEmpty = isAllEmpty;

  bool? get getIsAllEmpty => _isAllEmpty;

  set setMangaList(List<MangaVO>? mangaVOList) => _mangaVOList = mangaVOList;

  List<MangaVO>? get getMangaList => _mangaVOList;

  set setNoInternetStatus(bool isNoInternet) {
    _isNoInternet = isNoInternet;
    notifyListeners();
  }

  bool get getNoInternetStatus => _isNoInternet;

  set setLightNovelList(List<LightNovelVO>? lightNovelList) =>
      _lightNovelList = lightNovelList;

  List<LightNovelVO>? get getLightNovelList => _lightNovelList;

  set setArticleList(List<ArticleVO>? articleList) =>
      _articleList = articleList;

  List<ArticleVO>? get getArticleList => _articleList;

  Future getWifiOrMobielStatus() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setNoInternetStatus = true;
      } else if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        setNoInternetStatus = false;
      }
    });
  }

  FavoritePageProvider() {
    getWifiOrMobielStatus();

    _otaModel.getFavoriteStream().listen((_) {

        setIsAllEmpty = _otaModel.isFavoriteAllEmpty();

        setMangaList = _otaModel.getMangaFavorite();
        setLightNovelList = _otaModel.getLightNovelFavorite();
        setArticleList = _otaModel.getArticleFavorite();
        notifyListeners();

    });
    setIsAllEmpty=_otaModel.isFavoriteAllEmpty();
      setMangaList = _otaModel.getMangaFavorite();
      setLightNovelList = _otaModel.getLightNovelFavorite();
      setArticleList = _otaModel.getArticleFavorite();
      notifyListeners();

  }
}
