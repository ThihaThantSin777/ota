import 'package:flutter/material.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/resources/dimension.dart';
import 'package:ota/widget/manga_and_lightnovel_body_widget.dart';
import 'package:ota/widget/manga_lightnovel_article_title_and_showmore_widget.dart';

class LightNovelSessionView extends StatelessWidget {
  const LightNovelSessionView(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.lightNovelVO,
      required this.onTap,
      this.isShowMoreIconVisible=true,
        required this.controller,
      })
      : super(key: key);
  final String title;
  final Function onPressed;
  final List<LightNovelVO> lightNovelVO;
  final Function(LightNovelVO) onTap;
  final bool isShowMoreIconVisible;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.33,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LightNovelTitleAndShowMoreView(
              title: title,
              onPressed: () => onPressed(),
              isShowMoreIconVisible: isShowMoreIconVisible,
            ),
            LightNovelImageAndTitleView(
              controller: controller,
              lightNovelVO: lightNovelVO,
              onTap: (lightNovel) => onTap(lightNovel),
            ),
          ],
        ));
  }
}

class LightNovelImageAndTitleView extends StatelessWidget {
  const LightNovelImageAndTitleView(
      {Key? key, required this.lightNovelVO, required this.onTap,required this.controller})
      : super(key: key);

  final List<LightNovelVO> lightNovelVO;
  final Function(LightNovelVO) onTap;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexRate,
      child: Container(
          margin: const EdgeInsets.only(left: spacing1x),
          child: ListView.builder(
            controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: lightNovelVO.length,
              itemBuilder: (_, index) => InkWell(
                    onTap: () => onTap(lightNovelVO[index]),
                    child: MangaAndLightNovelBodyWidget(
                      imageURL: lightNovelVO[index].lightnovelCover.toString(),
                      title: lightNovelVO[index].lightnovelTitle.toString(),
                    ),
                  ))),
    );
  }
}

class LightNovelTitleAndShowMoreView extends StatelessWidget {
  const LightNovelTitleAndShowMoreView({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isShowMoreIconVisible=true,
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
