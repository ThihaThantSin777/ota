import 'package:flutter/material.dart';
import 'package:ota/resources/dimension.dart';

class MangaAndLightNovelBodyWidget extends StatelessWidget {
  const MangaAndLightNovelBodyWidget({
    Key? key,
    required this.imageURL,
    required this.title,
  }) : super(key: key);
  final String imageURL;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.30,
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(spacing1x))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MangaImageView(mangaCover: imageURL),
            const SizedBox(
              height: spacing1x,
            ),
            MangaTitleView(mangaTitle: title)
          ],
        ),
      ),
    );
  }
}

class MangaTitleView extends StatelessWidget {
  const MangaTitleView({Key? key, required this.mangaTitle}) : super(key: key);
  final String mangaTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
            child: Text(
      mangaTitle.toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: fontSizeregularx, fontWeight: FontWeight.w500),
    )));
  }
}

class MangaImageView extends StatelessWidget {
  const MangaImageView({Key? key, required this.mangaCover}) : super(key: key);
  final String mangaCover;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: SizedBox(
          width: double.infinity,
          child: Image.network(
            mangaCover,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
