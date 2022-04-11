

import 'package:flutter/material.dart';
import 'package:ota/resources/dimension.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(spacing1x),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            'Otamm is created by the otakus who love to enjoy manga/webtoons and weeb contents, we want to share things we love by fan-translating and creating original contents.',textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: fontSizeregular2x
            ),
          ),
          Text(
            'We strated as a small fan-translate page but we are aiming to become one of the top manga/web novel reader site in myanmar and trying to create more original contents.',textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: fontSizeregular2x
            ),
          ),
          Text(
            'Our goal is to became a web platform for our local artist and creators where they can share their cretions and get profit they deserve.',textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: fontSizeregular2x
            ),
          ),
          Text(
            'We hope more people to join us in our journey to create more awsome contents for our readers.',textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: fontSizeregular2x
            ),
          ),


        ],
      ),
    );
  }
}
