import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:ota/data/model/ota_mode.dart';
import 'package:ota/data/model/ota_mode_impl.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_light_novle_vo.dart';

class ReadLighrNovelProvider extends ChangeNotifier {
  final OTAModel _otaModel = OTAModelImpl();
  List<ReadLightNovelVO>? _readLightNovel;
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

  set setReadLightNovel(List<ReadLightNovelVO> readLightNovel) =>
      _readLightNovel = readLightNovel;

  get getReadLightNovel => _readLightNovel;

  ReadLighrNovelProvider(String lightNovelID) {
    getWifiOrMobielStatus();
    _otaModel.readLightNovel(lightNovelID).then((readLightNovel) {
      setReadLightNovel = readLightNovel ?? [];
      notifyListeners();
    }).catchError((error) => print(error));
  }
}
