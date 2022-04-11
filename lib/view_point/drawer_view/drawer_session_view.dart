import 'package:flutter/material.dart';

import '../../resources/dimension.dart';

class DrawerBosyView extends StatelessWidget {
  const DrawerBosyView(
      {Key? key,
      required this.icon,
      required this.text,
      required this.selectTileColor,
      required this.isSelect,
      required this.onTap})
      : super(key: key);
  final Icon icon;
  final String text;
  final Color selectTileColor;
  final bool isSelect;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              onTap(text);
            },
            selected: isSelect,
            selectedTileColor: selectTileColor,
            leading: icon,
            title: Text(text,style: TextStyle(
              color: isSelect?Colors.white:Colors.black,
              fontSize: fontSizeregular1x,
            ),),
          ),
        ],
      ),
    );
  }
}

class DrawerImageView extends StatelessWidget {
  const DrawerImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexRate,
      child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Image.asset(
            'images/logo.png',
            fit: BoxFit.contain,
          )),
    );
  }
}
