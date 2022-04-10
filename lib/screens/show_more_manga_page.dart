import 'package:flutter/material.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/screens/read_one_manga_page.dart';
import 'package:ota/resources/const_string.dart';
import 'package:ota/view_point/details_view/search_textfield_view.dart';
import 'package:ota/view_point/details_view/show_all_manga_view.dart';
import 'package:provider/provider.dart';

import '../providers/show_more_page_provider.dart';

class ShowMoreMangaPage extends StatelessWidget {
  const ShowMoreMangaPage({Key? key, required this.title}) : super(key: key);
  final String title;
  void navigateToReadOneMangaPage(MangaVO mangaVO, context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ReadOneMangaPage(
              mangaVO: mangaVO,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ShowMorePageProvider(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.indigo,
              centerTitle: true,
              title: Text(title),
            ),
            body: Selector<ShowMorePageProvider, bool>(
              selector: (_, homePageProvider) =>
                  homePageProvider.getNoInternetStatus,
              builder: (_, status, child) => status
                  ? const Center(
                      child: Text(noInternetStatus),
                    )
                  : Selector<ShowMorePageProvider, List<MangaVO>?>(
                      selector: (_, showMorePageProvider) =>
                          showMorePageProvider.getMangaList,
                      builder: (_, mangaList, child) {
                        ShowMorePageProvider showMorePageProvider =
                            Provider.of(_, listen: false);
                        return Column(
                          children: [
                            SearchTextFieldView(
                              onChanged: (value) {
                                showMorePageProvider.searchManga(value);
                              },
                            ),
                            ShowAllMangaView(
                              mangaList: mangaList ?? [],
                              onTap: (mangaVO) =>
                                  navigateToReadOneMangaPage(mangaVO, context),
                            )
                          ],
                        );
                      }),
            )));
  }
}
