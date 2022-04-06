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

  void saveIsFavorite(String managaID, bool isFavorite) {
    _getIsFavoriteBox().put(managaID, isFavorite);
    print('Save Is Favorite');
  }

  bool? isFavoriteByID(String mangaID) {
    return _getIsFavoriteBox().get(mangaID);
  }

  void removeIsFavorite(String mnagaID) {
    if (isFavoriteByID(mnagaID) ?? false) {
      _getIsFavoriteBox().delete(mnagaID);
    }
  }
}
