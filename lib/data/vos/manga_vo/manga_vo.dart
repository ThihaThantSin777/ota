import 'package:hive/hive.dart';
import 'package:ota/persistent/hive_constant.dart';

part 'manga_vo.g.dart';

@HiveType(typeId: hiveTypeMangaVO)
class MangaVO {
  @HiveField(0)
  String? mangaId;

  @HiveField(1)
  String? chptCount;

  @HiveField(2)
  String? mangaTitle;

  @HiveField(3)
  String? mangaCover;

  @HiveField(4)
  String? mangaDisp;

  @HiveField(5)
  String? mangaLikeCount;

  @HiveField(6)
  String? created;

  @HiveField(7)
  String? categoryId;

  @HiveField(8)
  String? categoryName;

  @HiveField(9)
  String? draft;

  @HiveField(10)
  bool? isFavorite;

  MangaVO(
      this.mangaId,
      this.chptCount,
      this.mangaTitle,
      this.mangaCover,
      this.mangaDisp,
      this.mangaLikeCount,
      this.created,
      this.categoryId,
      this.categoryName,
      this.draft,
      {this.isFavorite = false});
  MangaVO.internal();
  set setManagaID(String managID) => mangaId = managID;
  MangaVO.fromJson(Map<String, dynamic> json) {
    mangaId = json['manga_id'];
    chptCount = json['chpt_count'];
    mangaTitle = json['manga_title'];
    mangaCover = json['manga_cover'];
    mangaDisp = json['manga_disp'];
    mangaLikeCount = json['manga_like_count'];
    created = json['created'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    draft = json['draft'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['manga_id'] = mangaId;
    data['chpt_count'] = chptCount;
    data['manga_title'] = mangaTitle;
    data['manga_cover'] = mangaCover;
    data['manga_disp'] = mangaDisp;
    data['manga_like_count'] = mangaLikeCount;
    data['created'] = created;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['draft'] = draft;
    return data;
  }
}
