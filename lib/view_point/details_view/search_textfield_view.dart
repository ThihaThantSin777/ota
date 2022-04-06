import 'package:flutter/material.dart';
import 'package:ota/resources/const_string.dart';
import 'package:ota/resources/dimension.dart';

class SearchTextFieldView extends StatelessWidget {
  const SearchTextFieldView({Key? key, required this.onChanged})
      : super(key: key);
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: spacing2x),
      alignment: Alignment.center,
      child: TextField(
          onChanged: (value) {
            onChanged(value);
          },
          decoration: const InputDecoration(
            hintText: searchText,
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(spacing2x),
              ),
            ),
          )),
    ));
  }
}
