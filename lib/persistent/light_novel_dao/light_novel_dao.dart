import 'package:hive/hive.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/persistent/hive_constant.dart';

class LightNovelDAO {
  LightNovelDAO.internal();
  static final LightNovelDAO _singleton = LightNovelDAO.internal();
  factory LightNovelDAO() => _singleton;
  Box<LightNovelVO> _getLightNovelBox() =>
      Hive.box<LightNovelVO>(boxNameForLightNovelVO);
  Stream<void> getLightNovelBoxStream() {
    print('LightNovel Watch');
    return _getLightNovelBox().watch();
  }

  void saveLightNovel(List<LightNovelVO>? lightNovelList) {
    Map<int, LightNovelVO> lightNovel = {
      for (var lightNovel in lightNovelList ?? [])
        int.parse(lightNovel.lightnovelId ?? '0'): lightNovel
    };

    _getLightNovelBox().putAll(lightNovel);
    print('LightNovel Saved');
  }

  List<LightNovelVO>? getAllLightNovels() =>
      _getLightNovelBox().values.toList();

  LightNovelVO getLightNovelByID(String id)=>_getLightNovelBox().values.toList().where((element) => element.lightnovelId.toString()==id).first;
}
