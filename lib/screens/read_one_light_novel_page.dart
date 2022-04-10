import 'package:flutter/material.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/data/vos/read_chapter_vo/read_chapter_light_novle_vo.dart';
import 'package:ota/screens/read_light_novel_content_page.dart';
import 'package:ota/providers/read_light_novel_provider.dart';
import 'package:ota/resources/const_string.dart';
import 'package:ota/resources/dimension.dart';
import 'package:ota/view_point/lightnovel_view/read_light_novel_session_view.dart';
import 'package:provider/provider.dart';

class ReadOneLightNovelPage extends StatelessWidget {
  const ReadOneLightNovelPage({Key? key, required this.lightNovelVO})
      : super(key: key);
  final LightNovelVO lightNovelVO;

  void navigateToContentView(ReadLightNovelVO readLightNovelVO, context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ReadLightNovelContentPage(
            lightNovelID: readLightNovelVO.lightnovelId.toString(),
            title: readLightNovelVO.chptSum.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) =>
            ReadLighrNovelProvider(lightNovelVO.lightnovelId.toString()),
        child: Scaffold(
          body: Selector<ReadLighrNovelProvider, bool>(
            selector: (_, homePageProvider) =>
                homePageProvider.getNoInternetStatus,
            builder: (_, status, child) => status
                ? const Center(
                    child: Text(noInternetStatus),
                  )
                : CustomScrollView(
                    slivers: [
                      Selector<ReadLighrNovelProvider,bool>(
                        selector: (_, readLighrNovelProvider) =>
                        readLighrNovelProvider.getIsFavorite,
                        builder: (_,isFavorite,child){
                          ReadLighrNovelProvider readLightNovelProvider=Provider.of(_,listen: false);
                          return LightNovelSilverAppBarAndImageView(
                              lightNovelVO: lightNovelVO,
                              onPressed: () {
                                readLightNovelProvider.changeFavorite(
                                    lightNovelVO.lightnovelId.toString(), isFavorite);
                              },
                              isFavorite: isFavorite,

                          );
                        }

                      ),
                      Selector<ReadLighrNovelProvider, List<ReadLightNovelVO>?>(
                        selector: (_, readLightNovelProvider) =>
                            readLightNovelProvider.getReadLightNovel,
                        builder: (_, readLightNovelList, child) => SliverList(
                            delegate: SliverChildListDelegate([
                          LightNovelDescriptionView(lightNovelVO: lightNovelVO),
                          const Text(chapterConstant,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: fontSizeregular2x,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: spacing1x,
                          ),
                          LightNovelChapterView(
                            readChapterList: readLightNovelList ?? [],
                            onPressed: (readLightNovelVO) =>
                                navigateToContentView(
                                    readLightNovelVO, context),
                          )
                        ])),
                      )
                    ],
                  ),
          ),
        ));
  }
}
