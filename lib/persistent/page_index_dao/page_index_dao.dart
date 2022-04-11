import 'package:hive/hive.dart';
import 'package:ota/persistent/hive_constant.dart';

class PageIndexDAO {
  PageIndexDAO.internal();
  static final PageIndexDAO _singleton = PageIndexDAO.internal();
  factory PageIndexDAO() => _singleton;
  Box<int> _getPageIndexBox() => Hive.box<int>(boxNameForPageIndex);


  void savePageIndex(String id,int index) {

    _getPageIndexBox().put(id, index);
    print('Save Page Index');

  }

  int? getPageIndexByID(String id)=>_getPageIndexBox().get(id);
}
