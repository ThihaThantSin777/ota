import 'package:flutter/material.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/resources/dimension.dart';
import 'package:ota/widget/article_title_and_description_widget.dart';
import 'package:ota/widget/manga_and_lightnovel_body_widget.dart';

class ShowAllArticleView extends StatelessWidget {
  const ShowAllArticleView(
      {Key? key, required this.articleList, required this.onTap})
      : super(key: key);
  final List<ArticleVO> articleList;
  final Function(ArticleVO) onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flexRate,
        child: SizedBox(
          child: ListView(children: [
            articleList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Wrap(
                    alignment: WrapAlignment.center,
                    children: articleList.map((articleVO) {
                      if (articleVO.artId == '-1') {
                        return const Center(child: Text('Not Found'));
                      }
                      return Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: spacing1x),
                          height: MediaQuery.of(context).size.height * 0.40,
                          child: InkWell(
                            onTap: () => onTap(articleVO),
                            child: ArticleImageAndDescriptionWidget(
                                article: articleVO),
                          ));
                    }).toList())
          ]),
        ));
  }
}
