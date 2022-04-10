import 'package:flutter/material.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/resources/dimension.dart';
import 'package:ota/widget/manga_and_lightnovel_body_widget.dart';
import 'package:ota/widget/manga_lightnovel_article_title_and_showmore_widget.dart';

class MangaSessionView extends StatelessWidget {
  const MangaSessionView({
    Key? key,
    required this.managaList,
    required this.title,
    required this.onPressed,
    required this.onTap,
    this.isShowMoreIconVisible=true,
    required this.controller,
  }) : super(key: key);
  final List<MangaVO> managaList;
  final String title;
  final Function onPressed;
  final Function(MangaVO) onTap;
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
            MangaTitleAndShowMoreView(
              title: title,
              onPressed: () => onPressed(),
              isShowMoreIconVisible: isShowMoreIconVisible,
            ),
            MangaImageAndTitleView(
              controller: controller,
              managaList: managaList,
              onTap: (managVO) => onTap(managVO),
            ),
          ],
        ));
  }
}

class MangaImageAndTitleView extends StatelessWidget {
  const MangaImageAndTitleView(
      {Key? key, required this.managaList, required this.onTap,required this.controller})
      : super(key: key);

  final List<MangaVO> managaList;
  final Function(MangaVO) onTap;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
          margin: const EdgeInsets.only(left: spacing1x),
          child: ListView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: managaList.length,
              itemBuilder: (_, index) => InkWell(
                    onTap: () => onTap(managaList[index]),
                    child: MangaAndLightNovelBodyWidget(
                      imageURL: managaList[index].mangaCover.toString(),
                      title: managaList[index].mangaTitle.toString(),
                    ),
                  ))),
    );
  }
}

class MangaTitleAndShowMoreView extends StatelessWidget {
  const MangaTitleAndShowMoreView({
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
