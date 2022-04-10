import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:ota/data/model/ota_mode.dart';
import 'package:ota/data/model/ota_mode_impl.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_light_novle_vo.dart';

import '../resources/const_string.dart';

class ReadLighrNovelProvider extends ChangeNotifier {
  final OTAModel _otaModel = OTAModelImpl();
  List<ReadLightNovelVO>? _readLightNovel;
  bool _isNoInternet = false;
  bool? _isFavorite;
  get getIsFavorite => _isFavorite;
  set setFavorite(bool isFavorite) => _isFavorite = isFavorite;

  set setNoInternetStatus(bool isNoInternet) {
    _isNoInternet = isNoInternet;
    notifyListeners();
  }

  bool get getNoInternetStatus => _isNoInternet;
  void setisFavorite(String lightNovelID) {
    if (_otaModel.isFavorite(lightNovelID,keyLightNovel) ?? false) {
      setFavorite = true;
      notifyListeners();
    } else {
      setFavorite = false;
      notifyListeners();
    }
  }

  void changeFavorite(String lightNovelID, bool isFavorite) {
    if (isFavorite) {
      _otaModel.removeFavorite(lightNovelID,keyLightNovel);
    } else {
      _otaModel.saveIsFavorite(lightNovelID, !isFavorite,keyLightNovel);
    }
    setFavorite = !isFavorite;
    notifyListeners();
  }
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

  set setReadLightNovel(List<ReadLightNovelVO> readLightNovel) =>
      _readLightNovel = readLightNovel;

  get getReadLightNovel => _readLightNovel;

  ReadLighrNovelProvider(String lightNovelID) {
    getWifiOrMobielStatus();
    setisFavorite(lightNovelID);
    _otaModel.readLightNovel(lightNovelID).then((readLightNovel) {
      setReadLightNovel = readLightNovel ?? [];
      notifyListeners();
    }).catchError((error) => print(error));
  }
}
