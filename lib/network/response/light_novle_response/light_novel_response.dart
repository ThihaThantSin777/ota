import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';

class LightNovelResponse {
  List<LightNovelVO>? records;

  LightNovelResponse(this.records);

  static LightNovelResponse lightNovelFromResponse(Map<String, dynamic> json) =>
      LightNovelResponse(
        (json['records'] as List<dynamic>?)
            ?.map((e) => LightNovelVO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
