import 'package:hive/hive.dart';
import 'package:ota/persistent/hive_constant.dart';

part 'article_vo.g.dart';

@HiveType(typeId: hiveTypeArticleVO)
class ArticleVO {
  @HiveField(0)
  String? artId;

  @HiveField(1)
  String? artTitle;

  @HiveField(2)
  String? artThumb;

  @HiveField(3)
  String? artSum;

  @HiveField(4)
  String? created;

  @HiveField(5)
  String? categoryId;

  @HiveField(6)
  Object? categoryName;
  ArticleVO.intenal();
  set setArticleID(String artID) => artId = artID;
  ArticleVO(
      {this.artId,
      this.artTitle,
      this.artThumb,
      this.artSum,
      this.created,
      this.categoryId,
      this.categoryName});

  ArticleVO.fromJson(Map<String, dynamic> json) {
    artId = json['art_id'];
    artTitle = json['art_title'];
    artThumb = json['art_thumb'];
    artSum = json['art_sum'];
    created = json['created'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['art_id'] = artId;
    data['art_title'] = artTitle;
    data['art_thumb'] = artThumb;
    data['art_sum'] = artSum;
    data['created'] = created;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    return data;
  }
}
