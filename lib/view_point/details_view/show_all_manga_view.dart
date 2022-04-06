import 'package:flutter/material.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/resources/dimension.dart';
import 'package:ota/widget/manga_and_lightnovel_body_widget.dart';

class ShowAllMangaView extends StatelessWidget {
  const ShowAllMangaView(
      {Key? key, required this.mangaList, required this.onTap})
      : super(key: key);
  final List<MangaVO> mangaList;
  final Function(MangaVO) onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flexRate,
        child: SizedBox(
          child: ListView(children: [
            mangaList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Wrap(
                    alignment: WrapAlignment.center,
                    children: mangaList.map((mangaVO) {
                      if (mangaVO.mangaId == '-1') {
                        return const Center(child: Text('Not Found'));
                      }
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: InkWell(
                          onTap: () {
                            onTap(mangaVO);
                          },
                          child: MangaAndLightNovelBodyWidget(
                              imageURL: mangaVO.mangaCover.toString(),
                              title: mangaVO.mangaTitle.toString()),
                        ),
                      );
                    }).toList())
          ]),
        ));
  }
}
