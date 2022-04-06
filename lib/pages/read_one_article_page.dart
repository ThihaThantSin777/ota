import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_article_vo.dart';
import 'package:ota/providers/read_article_provider.dart';
import 'package:ota/resources/const_string.dart';

import 'package:ota/view_point/article_view/read_article_seesion_view.dart';
import 'package:provider/provider.dart';

class ReadArticlePage extends StatelessWidget {
  const ReadArticlePage({Key? key, required this.articleVO}) : super(key: key);
  final ArticleVO articleVO;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ReadArticleProvider(articleVO.artId.toString()),
        child: Scaffold(
          body: Selector<ReadArticleProvider, bool>(
            selector: (_, homePageProvider) =>
                homePageProvider.getNoInternetStatus,
            builder: (_, status, child) => status
                ? const Center(
                    child: Text(noInternetStatus),
                  )
                : CustomScrollView(
                    slivers: [
                      ArticleSilverAppBarAndImageView(articleVO: articleVO),
                      Selector<ReadArticleProvider, List<ReadArticleVO>?>(
                        selector: (_, readArticleProvider) =>
                            readArticleProvider.getReadArticleList,
                        builder: (_, readArticleList, child) => SliverList(
                            delegate: SliverChildListDelegate([
                          SizedBox(
                            child: readArticleList?.isEmpty ?? true
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Column(
                                    children: readArticleList!
                                        .map((article) =>
                                            Html(data: article.arconBody))
                                        .toList()),
                          )
                        ])),
                      )
                    ],
                  ),
          ),
        ));
  }
}
