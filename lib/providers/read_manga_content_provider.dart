import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:ota/data/model/ota_mode.dart';
import 'package:ota/data/model/ota_mode_impl.dart';
import 'package:ota/data/vos/read_content_vo/read_manga_content_vo.dart';

class ReadMangaContentProvider extends ChangeNotifier {
  final OTAModel _otaModel = OTAModelImpl();
  List<ReadMangaContentVO>? _readMangaContent;
  bool _isNoInternet = false;

  set setMangaReadContent(List<ReadMangaContentVO> readMangaContent) =>
      _readMangaContent = readMangaContent;

  get getMangaReadContent => _readMangaContent;

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

  ReadMangaContentProvider(String chptID) {
    getWifiOrMobielStatus();
    _otaModel.readMangaContent(chptID).then((readMangaContent) {
      setMangaReadContent = readMangaContent ?? [];
      notifyListeners();
    }).catchError((error) => print(error));
  }
}
