import 'package:flutter/material.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/providers/favorite_page_provider.dart';
import 'package:ota/screens/read_one_article_page.dart';
import 'package:ota/screens/read_one_light_novel_page.dart';
import 'package:ota/screens/read_one_manga_page.dart';
import 'package:provider/provider.dart';

import '../resources/const_string.dart';
import '../view_point/article_view/article_session_view.dart';
import '../view_point/lightnovel_view/light_novel_view.dart';
import '../view_point/manga_view/manga_session_view.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final mangaController = ScrollController();
  final lightNovelController = ScrollController();
  final articleController = PageController();

  void navigateToReadOneMangaPage(MangaVO mangaVO) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ReadOneMangaPage(
              mangaVO: mangaVO,
            )));
  }

  void navigateToReadOneLighrNovelPage(LightNovelVO lightNovelVO) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            ReadOneLightNovelPage(lightNovelVO: lightNovelVO)));
  }
  void navigateToReadOneArticlePage(ArticleVO articleVO) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ReadArticlePage(articleVO: articleVO)));
  }

  @override
  void dispose() {
    mangaController.dispose();
    lightNovelController.dispose();
    articleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Favorite page is build');
    return ChangeNotifierProvider(
      create: (_) => FavoritePageProvider(),
      child: Selector<FavoritePageProvider, bool?>(
        selector: (_,favoritePageProvider)=>favoritePageProvider.getIsAllEmpty,
        builder: (_,isAllEmpty,child)=>
         isAllEmpty??true?const Center(child: Text('There is no favorite book'),):

            ListView(
          children: [
            Selector<FavoritePageProvider, List<MangaVO>?>(
                selector: (_, favoritePageProvider) =>
                    favoritePageProvider.getMangaList,
                builder: (_, mangaList, child) {
                  return mangaList?.isNotEmpty ?? false
                      ? MangaSessionView(
                          isShowMoreIconVisible: false,
                          managaList: mangaList ?? [],
                          title: mangaSessionTitle,
                          onPressed: () {},
                          onTap: (managVO) {
                            navigateToReadOneMangaPage(managVO);
                          },
                          controller: mangaController,
                        )
                      :Container();
                }),
            Selector<FavoritePageProvider, List<LightNovelVO>?>(
                selector: (_, favoritePageProvider) =>
                    favoritePageProvider.getLightNovelList,
                builder: (_, lightNovelList, child) {
                  return lightNovelList?.isNotEmpty ?? false
                      ? LightNovelSessionView(
                          isShowMoreIconVisible: false,
                          lightNovelVO: lightNovelList ?? [],
                          title: lightNovelSessionTitle,
                          onPressed: () {},
                          onTap: (lightNovelVO) {
                            navigateToReadOneLighrNovelPage(lightNovelVO);
                          },
                          controller: lightNovelController,
                        )
                      : Container();
                }),

            Selector<FavoritePageProvider, List<ArticleVO>?>(
                selector: (_, favoritePageProvider) =>
                favoritePageProvider.getArticleList,
                builder: (_, articleList, child) {
                  return articleList?.isNotEmpty ?? false
                      ? ArticleSessionView(
                    articleList:
                    articleList ?? [],
                    title: articleSessionTitle,
                    isShowMoreIconVisible:false,
                    onPressed: () {

                    },
                    onTap: (articleVO) {
                      navigateToReadOneArticlePage(articleVO);
                    },
                    controller:articleController,
                  )
                      : Container();
                }),
          ],
        ),
      ),
    );
  }
}
