import 'package:flutter/material.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/screens/read_one_article_page.dart';
import 'package:ota/resources/const_string.dart';
import 'package:ota/view_point/details_view/search_textfield_view.dart';
import 'package:ota/view_point/details_view/show_all_article_view.dart';
import 'package:provider/provider.dart';

import '../providers/show_more_page_provider.dart';

class ShowMoreArticlePage extends StatelessWidget {
  const ShowMoreArticlePage({Key? key, required this.title}) : super(key: key);
  final String title;
  void navigateToReadOneMangaPage(ArticleVO articleVO, context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ReadArticlePage(
              articleVO: articleVO,
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
                  : Selector<ShowMorePageProvider, List<ArticleVO>?>(
                      selector: (_, showMorePageProvider) =>
                          showMorePageProvider.getArticleList,
                      builder: (_, articleList, child) {
                        ShowMorePageProvider showMorePageProvider =
                            Provider.of(_, listen: false);
                        return Column(
                          children: [
                            SearchTextFieldView(
                              onChanged: (value) {
                                showMorePageProvider.searchArticle(value);
                              },
                            ),
                            ShowAllArticleView(
                              articleList: articleList ?? [],
                              onTap: (articleVO) => navigateToReadOneMangaPage(
                                  articleVO, context),
                            )
                          ],
                        );
                      }),
            )));
  }
}
