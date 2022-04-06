import 'package:flutter/material.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_vo.dart';
import 'package:ota/pages/read_manga_content_page.dart';
import 'package:ota/providers/home_page_provider.dart';
import 'package:ota/providers/read_chapter_manga_provider.dart';
import 'package:ota/resources/const_string.dart';
import 'package:ota/resources/dimension.dart';
import 'package:ota/view_point/manga_view/read_one_managa_session_view.dart';
import 'package:provider/provider.dart';

class ReadOneMangaPage extends StatelessWidget {
  const ReadOneMangaPage({Key? key, required this.mangaVO}) : super(key: key);
  final MangaVO mangaVO;

  void navigateToMangaContent(ReadChapterVO readChapterVO, context) {
    print('read one ${readChapterVO.chptId}');
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ReadMangaContentPage(
            chptID: readChapterVO.chptId.toString(),
            title: readChapterVO.chptSum.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ChangeNotifierProvider<ReadChapterMangaProvider>(create: (_) => ReadChapterMangaProvider(mangaVO.mangaId.toString()),
          // ChangeNotifierProvider<HomePageProvider>(create: (_) => HomePageProvider()),
          ChangeNotifierProvider<HomePageProvider>(
            create: (_) =>
                HomePageProvider(mangaID: mangaVO.mangaId.toString()),
          ),
          ChangeNotifierProvider<ReadChapterMangaProvider>(
            create: (_) => ReadChapterMangaProvider(
              mangaVO.mangaId.toString(),
            ),
          )
        ],
        child: Scaffold(
          body: Selector<ReadChapterMangaProvider, bool>(
            selector: (_, homePageProvider) =>
                homePageProvider.getNoInternetStatus,
            builder: (_, status, child) => status
                ? const Center(
                    child: Text(noInternetStatus),
                  )
                : CustomScrollView(
                    slivers: [
                      Selector<HomePageProvider, bool>(
                          selector: (_, homePageProvider) =>
                              homePageProvider.getIsFavorite,
                          builder: (_, isFavorite, child) {
                            HomePageProvider homePageProvider =
                                Provider.of(_, listen: false);
                            return SilverAppBarAndImageView(
                                mangaVO: mangaVO,
                                onPressed: () {
                                  homePageProvider.changeFavorite(
                                      mangaVO.mangaId.toString(), isFavorite);
                                },
                                isFavorite: isFavorite);
                          }),
                      Selector<ReadChapterMangaProvider, List<ReadChapterVO>?>(
                        selector: (_, readChapterProvider) =>
                            readChapterProvider.getReadChapterList,
                        builder: (_, readChapterList, child) => SliverList(
                            delegate: SliverChildListDelegate([
                          MangaDescriptionView(
                            mangaVO: mangaVO,
                          ),
                          const Text('Chapter',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: fontSizeregular2x,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: spacing1x,
                          ),
                          ChapterView(
                            readChapterList: readChapterList ?? [],
                            onPressed: (readChapterVO) =>
                                navigateToMangaContent(readChapterVO, context),
                          )
                        ])),
                      )
                    ],
                  ),
          ),
        ));
  }
}
