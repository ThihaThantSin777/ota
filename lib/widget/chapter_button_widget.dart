import 'package:flutter/material.dart';
import 'package:ota/resources/dimension.dart';

class ChapterButtonWidget extends StatelessWidget {
  const ChapterButtonWidget(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final Function onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: spacing1x, left: spacing2x, right: spacing2x),
      child: TextButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, spacing4x)),
              backgroundColor: MaterialStateProperty.all(Colors.indigo),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(spacing2x))))),
          onPressed: () => onPressed(),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
