import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:ota/data/model/ota_mode.dart';
import 'package:ota/data/model/ota_mode_impl.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_vo.dart';

import '../resources/const_string.dart';

class ReadChapterMangaProvider extends ChangeNotifier {
  final OTAModel _otaModel = OTAModelImpl();
  List<ReadChapterVO>? _readChapterList;
  bool _isNoInternet = false;
  set setNoInternetStatus(bool isNoInternet) {
    _isNoInternet = isNoInternet;
    notifyListeners();
  }

  bool get getNoInternetStatus => _isNoInternet;
  bool? _isFavorite;

  get getIsFavorite => _isFavorite;
  set setFavorite(bool isFavorite) => _isFavorite = isFavorite;
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

  set setReadChapterList(List<ReadChapterVO> readChapterList) =>
      _readChapterList = readChapterList;

  get getReadChapterList => _readChapterList;

  ReadChapterMangaProvider(String mangaID) {
    getWifiOrMobielStatus();
    setisFavorite(mangaID);
    _otaModel.readChapterManagFromNetwork(mangaID).then((readChapterList) {
      setReadChapterList = readChapterList ?? [];
      notifyListeners();
    }).catchError((error) => print(error));
  }

  void setisFavorite(String mangaID) {
    if (_otaModel.isFavorite(mangaID,keyManga) ?? false) {
      setFavorite = true;
      notifyListeners();
    } else {
      setFavorite = false;
      notifyListeners();
    }
  }

  void changeFavorite(String managaID, bool isFavorite) {
    if (isFavorite) {
      _otaModel.removeFavorite(managaID,keyManga);
    } else {
      _otaModel.saveIsFavorite(managaID, !isFavorite,keyManga);
    }
    setFavorite = !isFavorite;
    notifyListeners();
  }
}
