import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ota/data/vos/read_content_vo/read_light_novel_content_vo.dart';
import 'package:ota/providers/read_light_novel_content_provider.dart';
import 'package:ota/resources/const_string.dart';
import 'package:provider/provider.dart';

class ReadLightNovelContentPage extends StatelessWidget {
  const ReadLightNovelContentPage(
      {Key? key, required this.lightNovelID, required this.title})
      : super(key: key);
  final String lightNovelID;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ReadLightNovelContentProvider(lightNovelID),
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
            backgroundColor: Colors.indigo,
            centerTitle: true,
            title: Text(title),
          ),
          body: Selector<ReadLightNovelContentProvider, bool>(
              selector: (_, homePageProvider) =>
                  homePageProvider.getNoInternetStatus,
              builder: (_, status, child) => status
                  ? const Center(
                      child: Text(noInternetStatus),
                    )
                  : Selector<ReadLightNovelContentProvider,
                          List<ReadLightNovelContentVO>?>(
                      selector: (_, readLightNovelContent) =>
                          readLightNovelContent.getReadLightNovelContent,
                      builder: (_, readLightNovelContentList, child) =>
                          readLightNovelContentList?.isEmpty ?? true
                              ? const Center(child: CircularProgressIndicator())
                              : ListView(
                                  children: readLightNovelContentList!
                                      .map((content) =>
                                          Html(data: content.nvconBody))
                                      .toList()))),
        ));
  }
}
