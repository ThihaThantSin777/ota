import 'package:hive/hive.dart';
import 'package:ota/persistent/hive_constant.dart';

part 'light_novel_vo.g.dart';

@HiveType(typeId: hiveTypeLightNovelVO)
class LightNovelVO {
  @HiveField(0)
  String? lightnovelId;

  @HiveField(1)
  String? chptCount;

  @HiveField(2)
  String? lightnovelTitle;

  @HiveField(3)
  String? lightnovelCover;

  @HiveField(4)
  String? lightnovelDisp;

  @HiveField(5)
  String? lightnovelLikeCount;

  @HiveField(6)
  String? created;

  @HiveField(7)
  String? categoryId;

  @HiveField(8)
  String? categoryName;

  LightNovelVO(
      this.lightnovelId,
      this.chptCount,
      this.lightnovelTitle,
      this.lightnovelCover,
      this.lightnovelDisp,
      this.lightnovelLikeCount,
      this.created,
      this.categoryId,
      this.categoryName);

  LightNovelVO.internal();

  set setLightNovelID(String lightNovelID) => lightnovelId = lightNovelID;

  LightNovelVO.fromJson(Map<String, dynamic> json) {
    lightnovelId = json['lightnovel_id'];
    chptCount = json['chpt_count'];
    lightnovelTitle = json['lightnovel_title'];
    lightnovelCover = json['lightnovel_cover'];
    lightnovelDisp = json['lightnovel_disp'];
    lightnovelLikeCount = json['lightnovel_like_count'];
    created = json['created'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lightnovel_id'] = lightnovelId;
    data['chpt_count'] = chptCount;
    data['lightnovel_title'] = lightnovelTitle;
    data['lightnovel_cover'] = lightnovelCover;
    data['lightnovel_disp'] = lightnovelDisp;
    data['lightnovel_like_count'] = lightnovelLikeCount;
    data['created'] = created;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    return data;
  }
}
