import 'package:ota/data/vos/manga_vo/manga_vo.dart';

class MangaResponse {
  List<MangaVO>? records;

  MangaResponse(this.records);

  static MangaResponse mangaFromResponse(Map<String, dynamic> json) =>
      MangaResponse(
        (json['records'] as List<dynamic>?)
            ?.map((e) => MangaVO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
