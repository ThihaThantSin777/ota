import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/data/vos/banner_vo/banner_vo.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/screens/read_one_article_page.dart';
import 'package:ota/screens/read_one_light_novel_page.dart';
import 'package:ota/screens/read_one_manga_page.dart';
import 'package:ota/screens/show_more_article_page.dart';
import 'package:ota/screens/show_more_light_novel_page.dart';
import 'package:ota/screens/show_more_manga_page.dart';
import 'package:ota/providers/home_page_provider.dart';
import 'package:ota/resources/const_string.dart';
import 'package:ota/resources/dimension.dart';
import 'package:ota/view_point/article_view/article_session_view.dart';
import 'package:ota/view_point/banner_view/banner_session_view.dart';
import 'package:ota/view_point/lightnovel_view/light_novel_view.dart';
import 'package:ota/view_point/manga_view/manga_session_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final pageController = PageController();
  final mangaController=ScrollController();
  final lightNovelController=ScrollController();
  final articleController=PageController();
  final mainController=ScrollController();
  void onDotClicked(int index) {
    pageController.animateToPage(index,
        duration: const Duration(seconds: 2), curve: Curves.bounceOut);
  }

  @override
  void initState() {
    int _currentPage = 0;
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if( pageController.hasClients){
        pageController.animateToPage(
          _currentPage,
          duration: const Duration(seconds: 5),
          curve: Curves.easeIn,
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    mainController.dispose();
    mangaController.dispose();
    lightNovelController.dispose();
    articleController.dispose();
    super.dispose();
  }

  void navigateToShowMoreMangaPage(context, String title) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ShowMoreMangaPage(title: title)));
  }

  void navigateToShowMoreLightNovelPage(context, String title) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ShowMoreLightNovelPage(title: title)));
  }

  void navigateToShowMoreArticlePage(context, String title) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ShowMoreArticlePage(title: title)));
  }

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
  Widget build(BuildContext context) {

    return Selector<HomePageProvider, bool>(
      selector: (_, homePageProvider) =>
          homePageProvider.getNoInternetStatus,
      builder: (_, status, child) => status
          ? const Center(
              child: Text(noInternetStatus),
            )
          : ListView(
        controller: mainController,
              children: [
                Selector<HomePageProvider, List<BannerVO>?>(
                  selector: (_, homePageProvider) =>
                      homePageProvider.getBannerList,
                  builder: (_, bannerList, child) =>
                      bannerList?.isEmpty ?? true
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : BannerSessionView(
                              bannerList: bannerList ?? [],
                              pageController: pageController,
                              onDotClick: (index) => onDotClicked(index),
                            ),
                ),
                const SizedBox(
                  height: spacing1x,
                ),
                Selector<HomePageProvider, List<MangaVO>?>(
                    selector: (_, homePageProvider) =>
                        homePageProvider.getMangaList,
                    builder: (_, mangaList, child) {
                      return mangaList?.isEmpty ?? true
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : MangaSessionView(
                              managaList: mangaList?.take(5).toList() ?? [],
                              title: mangaSessionTitle,
                              onPressed: () {
                                navigateToShowMoreMangaPage(
                                    context, mangaSessionTitle);
                              },
                              onTap: (managVO) {
                                navigateToReadOneMangaPage(managVO);
                              },
                        controller: mangaController,
                            );
                    }),
                const SizedBox(
                  height: spacing1x,
                ),
                Selector<HomePageProvider, List<LightNovelVO>?>(
                    selector: (_, homePageProvider) =>
                        homePageProvider.getLightNovelList,
                    builder: (_, lightNovelList, child) => lightNovelList
                                ?.isEmpty ??
                            true
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : LightNovelSessionView(
                            lightNovelVO:
                                lightNovelList?.take(5).toList() ?? [],
                            title: lightNovelSessionTitle,
                            onPressed: () {
                              navigateToShowMoreLightNovelPage(
                                  context, lightNovelSessionTitle);
                            },
                            onTap: (lightNovelVO) {
                              navigateToReadOneLighrNovelPage(lightNovelVO);
                            },
                      controller: lightNovelController,
                          )
                ),
                const SizedBox(
                  height: spacing1x,
                ),
                Selector<HomePageProvider, List<ArticleVO>?>(
                    selector: (_, homePageProvider) =>
                        homePageProvider.getArticleList,
                    builder: (_, articleList, child) =>
                        articleList?.isEmpty ?? true
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ArticleSessionView(
                                articleList:
                                    articleList?.take(5).toList() ?? [],
                                title: articleSessionTitle,
                                onPressed: () {
                                  navigateToShowMoreArticlePage(
                                    context,
                                    articleSessionTitle,
                                  );
                                },
                                onTap: (articleVO) {
                                  navigateToReadOneArticlePage(articleVO);
                                },
                          controller:articleController,
                              )
                ),
              ],
            ),
    );
  }
}
