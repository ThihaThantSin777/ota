import 'package:flutter/material.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_light_novle_vo.dart';
import 'package:ota/resources/dimension.dart';
import 'package:ota/widget/chapter_button_widget.dart';

class LightNovelChapterView extends StatelessWidget {
  const LightNovelChapterView({Key? key, required this.readChapterList})
      : super(key: key);
  final List<ReadLightNovelVO> readChapterList;
  @override
  Widget build(BuildContext context) {
    return readChapterList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: readChapterList
                .map((chapters) => ChapterButtonWidget(
                    title: chapters.chptSum.toString(), onPressed: () {}))
                .toList(),
          );
  }
}

class ArticleSilverAppBarAndImageView extends StatelessWidget {
  const ArticleSilverAppBarAndImageView({Key? key, required this.articleVO})
      : super(key: key);
  final ArticleVO articleVO;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 300,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          articleVO.artTitle.toString(),
          style: const TextStyle(fontSize: fontSizeregular1x),
        ),
        centerTitle: true,
        background: Hero(
          tag: articleVO.artThumb.toString(),
          child: Image.network(
            articleVO.artThumb.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
      actions: const [
        Icon(Icons.favorite_border_outlined),
        SizedBox(width: spacing1x)
      ],
    );
  }
}
