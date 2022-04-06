import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/data/vos/banner_vo/banner_vo.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/pages/home_page.dart';
import 'package:ota/persistent/hive_constant.dart';

main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(BannerVOAdapter());
  Hive.registerAdapter(MangaVOAdapter());
  Hive.registerAdapter(LightNovelVOAdapter());
  Hive.registerAdapter(ArticleVOAdapter());

  await Hive.openBox<BannerVO>(boxNameForBannerVO);
  await Hive.openBox<MangaVO>(boxNameForMangaVO);
  await Hive.openBox<LightNovelVO>(boxNameForLightNovelVO);
  await Hive.openBox<ArticleVO>(boxNameForArticleVO);
  await Hive.openBox<bool>(boxNameForIsFavorite);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
