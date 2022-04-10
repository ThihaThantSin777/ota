import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:ota/data/model/ota_mode.dart';
import 'package:ota/data/model/ota_mode_impl.dart';
import 'package:ota/data/vos/read_chapter_vo/read_article_vo.dart';
import 'package:ota/resources/const_string.dart';

class ReadArticleProvider extends ChangeNotifier {
  final OTAModel _otaModel = OTAModelImpl();
  List<ReadArticleVO>? _readArticleList;
  bool _isNoInternet = false;
  bool? _isFavorite;
  get getIsFavorite => _isFavorite;
  set setFavorite(bool isFavorite) => _isFavorite = isFavorite;
  set setNoInternetStatus(bool isNoInternet) {
    _isNoInternet = isNoInternet;
    notifyListeners();
  }

  bool get getNoInternetStatus => _isNoInternet;

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
  void setisFavorite(String artID) {
    if (_otaModel.isFavorite(artID,keyArticle) ?? false) {
      setFavorite = true;
      notifyListeners();
    } else {
      setFavorite = false;
      notifyListeners();
    }
  }

  void changeFavorite(String artID, bool isFavorite) {
    if (isFavorite) {
      _otaModel.removeFavorite(artID,keyArticle);
    } else {
      _otaModel.saveIsFavorite(artID, !isFavorite,keyArticle);
    }
    setFavorite = !isFavorite;
    notifyListeners();
  }
  set setReadArticleList(List<ReadArticleVO> readArticleList) =>
      _readArticleList = readArticleList;

  get getReadArticleList => _readArticleList;

  ReadArticleProvider(String articleID) {
    getWifiOrMobielStatus();
    setisFavorite(articleID);
    _otaModel.readArticle(articleID).then((articleList) {
      setReadArticleList = articleList ?? [];
      notifyListeners();
    }).catchError((error) => print(error));
  }
}
