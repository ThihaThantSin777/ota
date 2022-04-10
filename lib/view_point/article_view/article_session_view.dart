import 'package:flutter/material.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/resources/dimension.dart';
import 'package:ota/widget/article_title_and_description_widget.dart';
import 'package:ota/widget/manga_lightnovel_article_title_and_showmore_widget.dart';

class ArticleSessionView extends StatelessWidget {
  const ArticleSessionView(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.articleList,
      required this.onTap,
       this.isShowMoreIconVisible=true,
        required this.controller
      })
      : super(key: key);
  final String title;
  final Function onPressed;
  final List<ArticleVO> articleList;
  final Function(ArticleVO) onTap;
  final bool isShowMoreIconVisible;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArticleTitleAndShowMoreView(
              isShowMoreIconVisible: isShowMoreIconVisible,
              title: title,
              onPressed: () => onPressed(),
            ),
            Expanded(
                flex: flexRate,
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: spacing1x),
                    child: PageView.builder(
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: articleList.length,
                      itemBuilder: (_, index) => InkWell(
                        onTap: () {
                          onTap(articleList[index]);
                        },
                        child: ArticleImageAndDescriptionWidget(
                            article: articleList[index]),
                      ),
                    )))
          ],
        ));
  }
}

class ArticleTitleAndShowMoreView extends StatelessWidget {
  const ArticleTitleAndShowMoreView({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isShowMoreIconVisible=true
  }) : super(key: key);
  final String title;
  final Function onPressed;
  final bool isShowMoreIconVisible;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: spacing1x),
        child: MangLightNovelArticleTitleAndShowMoreWidget(
          isShowMoreIconVisible: isShowMoreIconVisible,
          title: title,
          onPressed: () {
            onPressed();
          },
        ),
      ),
    );
  }
}
