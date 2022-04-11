import 'package:flutter/material.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/data/vos/read_content_vo/read_manga_content_vo.dart';
import 'package:ota/providers/read_manga_content_provider.dart';
import 'package:ota/resources/const_string.dart';
import 'package:provider/provider.dart';

import '../data/vos/read_chapter_vo/read_chapter_vo.dart';

class ReadMangaContentPage extends StatefulWidget {
  ReadMangaContentPage({
    Key? key,
    required this.readChapterVO,
  }) : super(key: key);
  final ReadChapterVO readChapterVO;
  PageController? pageController;

  @override
  State<ReadMangaContentPage> createState() => _ReadMangaContentPageState();
}

class _ReadMangaContentPageState extends State<ReadMangaContentPage> {
  @override
  void initState() {
      ReadMangaContentProvider readMangaContentProvider=Provider.of(context,listen: false);
      widget.pageController = PageController(initialPage: readMangaContentProvider.getPageIndex??0);
      widget.pageController?.addListener(() {
        if (widget.pageController!.position.atEdge) {
          readMangaContentProvider.savePageIndex(widget.readChapterVO.chptId.toString(), 0);
        }
      });



    super.initState();
  }

  @override
  void dispose() {
    widget.pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: Text(widget.readChapterVO.chptSum.toString()),
        ),
        body: Selector<ReadMangaContentProvider, bool>(
          selector: (_, homePageProvider) =>
              homePageProvider.getNoInternetStatus,
          builder: (_, status, child) => status
              ? const Center(
                  child: Text(noInternetStatus),
                )
              : Selector<ReadMangaContentProvider,
                      List<ReadMangaContentVO>?>(
                  selector: (_, readMangaContent) =>
                      readMangaContent.getMangaReadContent,
                  builder: (_, readMangaContentList, child) {
                    ReadMangaContentProvider readMangaContentProvider=Provider.of<ReadMangaContentProvider>(_,listen: false);
                    return readMangaContentList?.isEmpty ?? true
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : PageView.builder(
                            onPageChanged: (index) {
                              readMangaContentProvider.savePageIndex(widget.readChapterVO.chptId.toString(), index);
                            },
                            controller: widget.pageController,
                            scrollDirection: Axis.vertical,
                            itemCount: readMangaContentList?.length,
                            itemBuilder: (_, index) => SizedBox(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Image.network(
                                    readMangaContentList![index]
                                        .url
                                        .toString(),
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  ),
                                ));
                  }),
        ));
  }
}
