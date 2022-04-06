import 'package:hive/hive.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/persistent/hive_constant.dart';

class MangaDAO {
  MangaDAO.internal();
  static final MangaDAO _singleton = MangaDAO.internal();
  factory MangaDAO() => _singleton;
  Box<MangaVO> _getMangaBox() => Hive.box<MangaVO>(boxNameForMangaVO);
  Stream<void> getMangaBoxStream() {
    print('Magga Watch');
    return _getMangaBox().watch();
  }

  void saveManga(List<MangaVO>? mangaList) {
    Map<int, MangaVO> manga = {
      for (var manga in mangaList ?? []) int.parse(manga.mangaId ?? '0'): manga
    };
    _getMangaBox().putAll(manga);
    print('Manga Saved');
  }

  List<MangaVO>? getAllMangas() => _getMangaBox().values.toList();
}
