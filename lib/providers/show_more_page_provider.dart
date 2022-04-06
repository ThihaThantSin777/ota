import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:ota/data/model/ota_mode.dart';
import 'package:ota/data/model/ota_mode_impl.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/data/vos/banner_vo/banner_vo.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';

class ShowMorePageProvider extends ChangeNotifier {
  final OTAModel _otaModel = OTAModelImpl();
  List<BannerVO>? _bannerVOList;
  List<MangaVO>? _mangaVOList;
  List<LightNovelVO>? _lightNovelList;
  List<ArticleVO>? _articleList;
  bool _isNoInternet = false;

  set setBannerList(List<BannerVO>? bannerVOList) =>
      _bannerVOList = bannerVOList;

  List<BannerVO>? get getBannerList => _bannerVOList;

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

  ShowMorePageProvider() {
    getWifiOrMobielStatus();
    _otaModel.getBannerFromPersistent().listen((banners) {
      setBannerList = banners;
      notifyListeners();
    }, onError: (error) => print(error));

    _otaModel.getMangaFromPersistent().listen((mangas) {
      setMangaList = mangas;
      notifyListeners();
    }, onError: (error) => print(error));

    _otaModel.getLightNovelFromPersistent().listen((lightNovel) {
      setLightNovelList = lightNovel;
      notifyListeners();
    }, onError: (error) => print(error));

    _otaModel.getArticleFromPersistent().listen((article) {
      setArticleList = article;
      notifyListeners();
    }, onError: (error) => print(error));

    _otaModel.getArticleFromNetwork().then((article) {
      setArticleList = article;
      notifyListeners();
    }).catchError((error) => print(error));
  }

  void searchManga(String searchKeyWord) {
    if (searchKeyWord.isEmpty) {
      _otaModel.getMangaFromNetwork().then((mangas) {
        setMangaList = mangas;
        notifyListeners();
      }).catchError((error) => print(error));
    } else {
      _otaModel.searchMangaFromNetwork(searchKeyWord).then((managa) {
        if (managa?.isEmpty ?? true) {
          MangaVO mangaVO = MangaVO.internal();
          mangaVO.setManagaID = '-1';
          List<MangaVO> errorMangaList = [mangaVO];
          setMangaList = errorMangaList;
          notifyListeners();
        } else {
          setMangaList = managa;
          notifyListeners();
        }
      }).catchError((error) => print(error));
    }
  }

  void searchLightNovel(String searchKeyWord) {
    if (searchKeyWord.isEmpty) {
      _otaModel.getLightNovelFromNetwork().then((lightNovel) {
        setLightNovelList = lightNovel;
        notifyListeners();
      }).catchError((error) => print(error));
    } else {
      _otaModel.searchLightNovelFromNetwork(searchKeyWord).then((lightNovel) {
        if (lightNovel?.isEmpty ?? true) {
          LightNovelVO lightNovelVO = LightNovelVO.internal();

          lightNovelVO.setLightNovelID = '-1';
          List<LightNovelVO> errorLightNovelList = [lightNovelVO];
          setLightNovelList = errorLightNovelList;
          notifyListeners();
        } else {
          setLightNovelList = lightNovel;
          notifyListeners();
        }
      }).catchError((error) => print(error));
    }
  }

  void searchArticle(String searchKeyWord) {
    if (searchKeyWord.isEmpty) {
      _otaModel.getArticleFromNetwork().then((article) {
        setArticleList = article;
        notifyListeners();
      }).catchError((error) => print(error));
    } else {
      _otaModel.searchArticleFromNetwork(searchKeyWord).then((article) {
        if (article?.isEmpty ?? true) {
          ArticleVO articleVO = ArticleVO.intenal();

          articleVO.setArticleID = '-1';
          List<ArticleVO> errorArticlelList = [articleVO];
          setArticleList = errorArticlelList;
          notifyListeners();
        } else {
          setArticleList = article;
          notifyListeners();
        }
      }).catchError((error) => print(error));
    }
  }
}
