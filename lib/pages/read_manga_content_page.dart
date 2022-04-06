import 'package:flutter/material.dart';
import 'package:ota/data/vos/read_content_vo/read_manga_content_vo.dart';
import 'package:ota/providers/read_manga_content_provider.dart';
import 'package:ota/resources/const_string.dart';
import 'package:provider/provider.dart';

class ReadMangaContentPage extends StatelessWidget {
  const ReadMangaContentPage(
      {Key? key, required this.chptID, required this.title})
      : super(key: key);
  final String chptID;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ReadMangaContentProvider(chptID),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.indigo,
            onPressed: () {},
            child: const Icon(
              Icons.download,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.indigo,
            title: Text(title),
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
                      builder: (_, readMangaContentList, child) =>
                          readMangaContentList?.isEmpty ?? true
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : PageView.builder(
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
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        ),
                                      )))),
        ));
  }
}
