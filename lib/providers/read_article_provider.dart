import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:ota/data/model/ota_mode.dart';
import 'package:ota/data/model/ota_mode_impl.dart';
import 'package:ota/data/vos/read_chapter_vo/read_article_vo.dart';

class ReadArticleProvider extends ChangeNotifier {
  final OTAModel _otaModel = OTAModelImpl();
  List<ReadArticleVO>? _readArticleList;
  bool _isNoInternet = false;
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

  set setReadArticleList(List<ReadArticleVO> readArticleList) =>
      _readArticleList = readArticleList;

  get getReadArticleList => _readArticleList;

  ReadArticleProvider(String articleID) {
    getWifiOrMobielStatus();
    _otaModel.readArticle(articleID).then((articleList) {
      setReadArticleList = articleList ?? [];
      notifyListeners();
    }).catchError((error) => print(error));
  }
}
