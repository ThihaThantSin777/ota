import 'package:flutter/material.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/screens/read_one_light_novel_page.dart';
import 'package:ota/resources/const_string.dart';
import 'package:ota/view_point/details_view/search_textfield_view.dart';
import 'package:ota/view_point/details_view/show_all_light_novel_view.dart';
import 'package:provider/provider.dart';

import '../providers/show_more_page_provider.dart';

class ShowMoreLightNovelPage extends StatelessWidget {
  const ShowMoreLightNovelPage({Key? key, required this.title})
      : super(key: key);
  final String title;
  void navigateToReadOneMangaPage(LightNovelVO lightNovelVO, context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ReadOneLightNovelPage(
              lightNovelVO: lightNovelVO,
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
                  : Selector<ShowMorePageProvider, List<LightNovelVO>?>(
                      selector: (_, showMorePageProvider) =>
                          showMorePageProvider.getLightNovelList,
                      builder: (_, lightNoveList, child) {
                        ShowMorePageProvider showMorePageProvider =
                            Provider.of(_, listen: false);
                        return Column(
                          children: [
                            SearchTextFieldView(
                              onChanged: (value) {
                                showMorePageProvider.searchLightNovel(value);
                              },
                            ),
                            ShowAllLightNovelView(
                              lightNoveList: lightNoveList ?? [],
                              onTap: (lightNovelVO) =>
                                  navigateToReadOneMangaPage(
                                      lightNovelVO, context),
                            )
                          ],
                        );
                      }),
            )));
  }
}
