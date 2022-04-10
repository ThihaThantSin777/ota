import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/data/vos/banner_vo/banner_vo.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/persistent/is_favorite_dao/is_favorite_dao.dart';
import 'package:ota/providers/home_page_provider.dart';
import 'package:ota/screens/favorite_page.dart';
import 'package:ota/screens/home_page.dart';
import 'package:ota/persistent/hive_constant.dart';
import 'package:ota/resources/const_string.dart';
import 'package:provider/provider.dart';

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
  print(IsFavoriteDAO().isBoxEmpty());

}

class MyApp extends StatelessWidget {
  List<BottomNavigationBarItem> navigationItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: bottomNavigationBarItemHomeLabel),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: bottomNavigationBarItemFavoriteLabel),
    BottomNavigationBarItem(
        icon: Icon(Icons.download), label: bottomNavigationBarDownloadLabel),
  ];
  final widgets= [
   const HomePage(),
    FavoritePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageProvider>(
         create: (_)=>HomePageProvider(),
         child: MaterialApp(
          title: 'OTA MYANMAR',
          debugShowCheckedModeBanner: false,
          home: Selector<HomePageProvider,int>(
            selector: (_,homePageProvider)=>homePageProvider.getChangePage,
            builder: (_,index,child){
              HomePageProvider homePageProvider=Provider.of(_,listen: false);
              return  Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: index,
                    selectedItemColor: Colors.indigo,
                    unselectedItemColor: Colors.grey,
                    onTap: (index)=>homePageProvider.setChangePage=index,
                    items: navigationItems,
                  ),
                  appBar: AppBar(
                    backgroundColor: Colors.indigo,
                    centerTitle: true,
                    title: const Text(appTitle),
                  ),
                  body:
                  IndexedStack(
                    index: index,
                    children: widgets,
                  )
              );
            }

          ),
      ),
       );

  }
}
