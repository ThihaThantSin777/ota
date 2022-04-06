import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:ota/data/model/ota_mode.dart';
import 'package:ota/data/model/ota_mode_impl.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_vo.dart';

class ReadChapterMangaProvider extends ChangeNotifier {
  final OTAModel _otaModel = OTAModelImpl();
  List<ReadChapterVO>? _readChapterList;
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

  set setReadChapterList(List<ReadChapterVO> readChapterList) =>
      _readChapterList = readChapterList;

  get getReadChapterList => _readChapterList;

  ReadChapterMangaProvider(String mangaID) {
    getWifiOrMobielStatus();
    _otaModel.readChapterManagFromNetwork(mangaID).then((readChapterList) {
      setReadChapterList = readChapterList ?? [];
      notifyListeners();
    }).catchError((error) => print(error));
  }
}
