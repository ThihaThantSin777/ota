import 'package:ota/data/vos/read_chapter_vo/read_chapter_vo.dart';

class ReadChapterMangaResponse {
  List<ReadChapterVO>? chpts;

  ReadChapterMangaResponse(this.chpts);

  static ReadChapterMangaResponse readChapterMangaFromResponse(
          Map<String, dynamic> json) =>
      ReadChapterMangaResponse(
        (json['chpts'] as List<dynamic>?)
            ?.map((e) => ReadChapterVO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
