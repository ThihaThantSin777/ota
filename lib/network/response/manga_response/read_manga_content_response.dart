import 'package:ota/data/vos/read_chapter_vo/read_chapter_vo.dart';
import 'package:ota/data/vos/read_content_vo/read_manga_content_vo.dart';

class ReadMangaContentResponse {
  List<ReadMangaContentVO>? cont;

  ReadMangaContentResponse(this.cont);

  static ReadMangaContentResponse readMangaContentFromResponse(
          Map<String, dynamic> json) =>
      ReadMangaContentResponse(
        (json['cont'] as List<dynamic>?)
            ?.map((e) => ReadMangaContentVO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
