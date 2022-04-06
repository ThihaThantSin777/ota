import 'package:ota/data/vos/read_chapter_vo/read_chapter_light_novle_vo.dart';
import 'package:ota/data/vos/read_content_vo/read_light_novel_content_vo.dart';

class ReadLightNovelContentResponse {
  List<ReadLightNovelContentVO>? cont;

  ReadLightNovelContentResponse(this.cont);

  static ReadLightNovelContentResponse readLightNovelContentFromResponse(
          Map<String, dynamic> json) =>
      ReadLightNovelContentResponse(
        (json['cont'] as List<dynamic>?)
            ?.map((e) =>
                ReadLightNovelContentVO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
