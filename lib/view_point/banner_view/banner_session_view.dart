import 'package:flutter/material.dart';
import 'package:ota/data/vos/banner_vo/banner_vo.dart';
import 'package:ota/resources/const_string.dart';
import 'package:ota/resources/dimension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSessionView extends StatelessWidget {
  const BannerSessionView({
    Key? key,
    required this.bannerList,
    required this.pageController,
    required this.onDotClick,
  }) : super(key: key);
  final List<BannerVO> bannerList;
  final PageController pageController;
  final Function(int) onDotClick;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BannerImageAndTitleView(
          bannerList: bannerList,
          pageController: pageController,
        ),
        PageIndicatorView(
            pageController: pageController,
            bannerList: bannerList,
            onDotClick: onDotClick)
      ],
    );
  }
}

class PageIndicatorView extends StatelessWidget {
  const PageIndicatorView({
    Key? key,
    required this.pageController,
    required this.bannerList,
    required this.onDotClick,
  }) : super(key: key);

  final PageController pageController;
  final List<BannerVO> bannerList;
  final Function(int) onDotClick;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: pageController, // PageController
        count: bannerList.length,
        effect: const WormEffect(), // your preferred effect
        onDotClicked: (index) {
          onDotClick(index);
        });
  }
}

class BannerImageAndTitleView extends StatelessWidget {
  const BannerImageAndTitleView({
    Key? key,
    required this.bannerList,
    required this.pageController,
  }) : super(key: key);

  final List<BannerVO> bannerList;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BannerPageView(
          bannerList: bannerList,
          pageController: pageController,
        ),
      ],
    );
  }
}

class BannerPageView extends StatelessWidget {
  const BannerPageView(
      {Key? key, required this.bannerList, required this.pageController})
      : super(key: key);
  final List<BannerVO> bannerList;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.32,
      child: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemCount: bannerList.length,
        itemBuilder: (_, index) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerImageView(bannerVO: bannerList[index]),
            BannerTextView(bannerText: bannerList[index].bannerText.toString())
          ],
        ),
      ),
    );
  }
}

class BannerTextView extends StatelessWidget {
  const BannerTextView({
    Key? key,
    required this.bannerText,
  }) : super(key: key);
  final String bannerText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: spacing1x, left: spacing1x),
      child: Text(
        bannerText.isEmpty ? defaultTitle : bannerText,
        style: const TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: fontSizeregular3x,
        ),
      ),
    );
  }
}

class BannerImageView extends StatelessWidget {
  const BannerImageView({
    Key? key,
    required this.bannerVO,
  }) : super(key: key);

  final BannerVO bannerVO;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexRate,
      child: SizedBox(
        width: double.infinity,
        child: Image.network(
          bannerVO.url ?? '',
          fit: BoxFit.fill,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
