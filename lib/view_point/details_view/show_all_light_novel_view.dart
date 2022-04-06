import 'package:flutter/material.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/resources/dimension.dart';
import 'package:ota/widget/manga_and_lightnovel_body_widget.dart';

class ShowAllLightNovelView extends StatelessWidget {
  const ShowAllLightNovelView(
      {Key? key, required this.lightNoveList, required this.onTap})
      : super(key: key);
  final List<LightNovelVO> lightNoveList;
  final Function(LightNovelVO) onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flexRate,
        child: SizedBox(
          child: ListView(children: [
            lightNoveList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Wrap(
                    alignment: WrapAlignment.center,
                    children: lightNoveList.map((ligthNovelVO) {
                      if (ligthNovelVO.lightnovelId == '-1') {
                        return const Center(child: Text('Not Found'));
                      }
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: InkWell(
                          onTap: () => onTap(ligthNovelVO),
                          child: MangaAndLightNovelBodyWidget(
                              imageURL: ligthNovelVO.lightnovelCover.toString(),
                              title: ligthNovelVO.lightnovelTitle.toString()),
                        ),
                      );
                    }).toList())
          ]),
        ));
  }
}
