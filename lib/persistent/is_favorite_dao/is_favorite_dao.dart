import 'package:hive/hive.dart';
import 'package:ota/persistent/hive_constant.dart';

class IsFavoriteDAO {
  IsFavoriteDAO.internal();
  static final IsFavoriteDAO _singleton = IsFavoriteDAO.internal();
  factory IsFavoriteDAO() => _singleton;
  Box<bool> _getIsFavoriteBox() => Hive.box<bool>(boxNameForIsFavorite);
  Stream<void> getIsFavooriteBoxStream() {
    print('Favorite Watch');
    return _getIsFavoriteBox().watch();
  }

  void saveIsFavorite(String id, bool isFavorite,String keyword) {
    String keyID='$id-$keyword';
    _getIsFavoriteBox().put(keyID, isFavorite);
    print('Save Is Favorite');

  }

  bool? isFavoriteByID(String id,String keyword) {
    String keyID='$id-$keyword';
    return _getIsFavoriteBox().get(keyID);
  }

  void removeIsFavorite(String id,String keyword) {
    if (isFavoriteByID(id,keyword) ?? false) {
      String keyID='$id-$keyword';
      _getIsFavoriteBox().delete(keyID);
    }
  }

  bool isBoxEmpty()=>_getIsFavoriteBox().isEmpty;
  List<dynamic>getFavoriteIDs(String keyword)=>_getIsFavoriteBox().keys.toList().where((element) => element.contains(keyword)).map((e) => e.split('-')[0]).toList();
}
