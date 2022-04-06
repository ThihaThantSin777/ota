import 'package:ota/data/vos/read_chapter_vo/read_chapter_light_novle_vo.dart';

class ReadLightNovelResponse {
  List<ReadLightNovelVO>? chpts;

  ReadLightNovelResponse(this.chpts);

  static ReadLightNovelResponse readLightNovelFromResponse(
          Map<String, dynamic> json) =>
      ReadLightNovelResponse(
        (json['chpts'] as List<dynamic>?)
            ?.map((e) => ReadLightNovelVO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
