import 'package:hive/hive.dart';
import 'package:ota/persistent/hive_constant.dart';

part 'banner_vo.g.dart';

@HiveType(typeId: hiveTypeBannerVO)
class BannerVO {
  @HiveField(0)
  String? bannerId;

  @HiveField(1)
  String? url;

  @HiveField(2)
  String? action;

  @HiveField(3)
  String? bannerText;

  BannerVO(this.bannerId, this.url, this.action, this.bannerText);

  BannerVO.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    url = json['url'];
    action = json['action'];
    bannerText = json['bannerText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_id'] = bannerId;
    data['url'] = url;
    data['action'] = action;
    data['bannerText'] = bannerText;
    return data;
  }
}
