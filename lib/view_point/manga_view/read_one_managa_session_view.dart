import 'package:flutter/material.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_vo.dart';
import 'package:ota/resources/const_string.dart';
import 'package:ota/resources/dimension.dart';
import 'package:ota/widget/chapter_button_widget.dart';

class ChapterView extends StatelessWidget {
  const ChapterView(
      {Key? key, required this.readChapterList, required this.onPressed})
      : super(key: key);
  final List<ReadChapterVO> readChapterList;
  final Function(ReadChapterVO) onPressed;
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

class MangaDescriptionView extends StatelessWidget {
  const MangaDescriptionView({Key? key, required this.mangaVO})
      : super(key: key);
  final MangaVO mangaVO;
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
          Text(mangaVO.mangaDisp.toString().isEmpty
              ? defaultDescription
              : mangaVO.mangaDisp.toString()),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class SilverAppBarAndImageView extends StatelessWidget {
  const SilverAppBarAndImageView(
      {Key? key,
      required this.mangaVO,
      required this.onPressed,
      required this.isFavorite})
      : super(key: key);
  final MangaVO mangaVO;
  final Function onPressed;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 300,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          mangaVO.mangaTitle.toString(),
          style: const TextStyle(fontSize: fontSizeregular1x),
        ),
        centerTitle: true,
        background: Hero(
          tag: mangaVO.mangaCover.toString(),
          child: Image.network(
            mangaVO.mangaCover.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              onPressed();
            },
            icon: isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(
                    Icons.favorite_border_outlined,
                  )),
        const SizedBox(width: spacing1x)
      ],
    );
  }
}
