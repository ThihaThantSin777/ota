import 'package:flutter/material.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_light_novle_vo.dart';
import 'package:ota/resources/const_string.dart';
import 'package:ota/resources/dimension.dart';
import 'package:ota/widget/chapter_button_widget.dart';

class LightNovelChapterView extends StatelessWidget {
  const LightNovelChapterView(
      {Key? key, required this.readChapterList, required this.onPressed})
      : super(key: key);
  final List<ReadLightNovelVO> readChapterList;
  final Function(ReadLightNovelVO) onPressed;
  @override
  Widget build(BuildContext context) {
    return readChapterList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: readChapterList
                .map((chapters) => ChapterButtonWidget(
                    title: chapters.chptSum.toString(),
                    onPressed: () {
                      onPressed(chapters);
                    }))
                .toList(),
          );
  }
}

class LightNovelDescriptionView extends StatelessWidget {
  const LightNovelDescriptionView({Key? key, required this.lightNovelVO})
      : super(key: key);
  final LightNovelVO lightNovelVO;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing1x),
      child: Column(
        children: [
          const Text(
            summrize,
            style: TextStyle(
                fontSize: fontSizeregular2x, fontWeight: FontWeight.bold),
          ),
          const Divider(
            color: Colors.black,
          ),
          Text(lightNovelVO.lightnovelDisp.toString().isEmpty
              ? defaultDescription
              : lightNovelVO.lightnovelDisp.toString()),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class LightNovelSilverAppBarAndImageView extends StatelessWidget {
  const LightNovelSilverAppBarAndImageView(
      {Key? key, required this.lightNovelVO})
      : super(key: key);
  final LightNovelVO lightNovelVO;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 300,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          lightNovelVO.lightnovelTitle.toString(),
          style: const TextStyle(fontSize: fontSizeregular1x),
        ),
        centerTitle: true,
        background: Hero(
          tag: lightNovelVO.lightnovelCover.toString(),
          child: Image.network(
            lightNovelVO.lightnovelCover.toString(),
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
