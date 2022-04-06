import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:ota/data/model/ota_mode.dart';
import 'package:ota/data/model/ota_mode_impl.dart';
import 'package:ota/data/vos/read_content_vo/read_light_novel_content_vo.dart';

class ReadLightNovelContentProvider extends ChangeNotifier {
  final OTAModel _otaModel = OTAModelImpl();
  List<ReadLightNovelContentVO>? _readLightNovelContent;
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

  set setReadLightNovelContent(
          List<ReadLightNovelContentVO> readLightNovelContent) =>
      _readLightNovelContent = readLightNovelContent;

  get getReadLightNovelContent => _readLightNovelContent;

  ReadLightNovelContentProvider(String chptID) {
    getWifiOrMobielStatus();
    _otaModel.readLightNovelContent(chptID).then((readLightNovelContent) {
      setReadLightNovelContent = readLightNovelContent ?? [];
      notifyListeners();
    }).catchError((error) => print(error));
  }
}
