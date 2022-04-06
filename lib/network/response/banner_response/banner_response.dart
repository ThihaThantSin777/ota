import 'package:ota/data/vos/banner_vo/banner_vo.dart';

class BannerResponse {
  List<BannerVO>? records;

  BannerResponse(this.records);

  static BannerResponse bannerFromResponse(Map<String, dynamic> json) =>
      BannerResponse(
        (json['records'] as List<dynamic>?)
            ?.map((e) => BannerVO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
