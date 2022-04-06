import 'package:hive/hive.dart';
import 'package:ota/data/vos/banner_vo/banner_vo.dart';
import 'package:ota/persistent/hive_constant.dart';

class BannerDAO {
  BannerDAO.internal();
  static final BannerDAO _singleton = BannerDAO.internal();
  factory BannerDAO() => _singleton;
  Box<BannerVO> _getBannerBox() => Hive.box<BannerVO>(boxNameForBannerVO);
  Stream<void> getBannerBoxStream() {
    print('Banner Watch');
    return _getBannerBox().watch();
  }

  void saveBanner(List<BannerVO>? bannerList) {
    Map<int, BannerVO> banner = {
      for (var banner in bannerList ?? [])
        int.parse(banner.bannerId ?? '0'): banner
    };

    _getBannerBox().putAll(banner);
    print('Save Banner');
  }

  List<BannerVO>? getAllBanners() => _getBannerBox().values.toList();
}
