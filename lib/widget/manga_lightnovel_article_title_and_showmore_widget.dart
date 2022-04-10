import 'package:flutter/material.dart';
import 'package:ota/resources/dimension.dart';

class MangLightNovelArticleTitleAndShowMoreWidget extends StatelessWidget {
  const MangLightNovelArticleTitleAndShowMoreWidget(
      {Key? key, required this.title, required this.onPressed,this.isShowMoreIconVisible=true})
      : super(key: key);

  final String title;
  final Function onPressed;
  final bool isShowMoreIconVisible;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MangaFixTitleView(
          title: title,
        ),
        const Spacer(),
        ShowMoreView(
          onPressed: () => onPressed(),
          isShowMoreIconVisible: isShowMoreIconVisible,
        )
      ],
    );
  }
}

class ShowMoreView extends StatelessWidget {
  const ShowMoreView({
    Key? key,
    required this.onPressed,
    this.isShowMoreIconVisible=true,
  }) : super(key: key);

  final Function onPressed;
  final bool isShowMoreIconVisible;

  @override
  Widget build(BuildContext context) {
    return isShowMoreIconVisible?IconButton(
        onPressed: () {
          onPressed();
        },
        icon: const Icon(Icons.apps)):Container();
  }
}

class MangaFixTitleView extends StatelessWidget {
  const MangaFixTitleView({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: fontSizeregular2x, fontWeight: FontWeight.w500),
    );
  }
}
