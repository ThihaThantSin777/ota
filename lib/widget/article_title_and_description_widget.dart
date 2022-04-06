import 'package:flutter/material.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/resources/dimension.dart';

class ArticleImageAndDescriptionWidget extends StatelessWidget {
  const ArticleImageAndDescriptionWidget({
    Key? key,
    required this.article,
  }) : super(key: key);
  final ArticleVO article;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArticleImageView(imageURL: article.artThumb.toString()),
        ArticleDescriptionView(description: article.artSum.toString())
      ],
    );
  }
}

class ArticleDescriptionView extends StatelessWidget {
  const ArticleDescriptionView({Key? key, required this.description})
      : super(key: key);
  final String description;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Text(
          description,
        ),
      ),
    );
  }
}

class ArticleImageView extends StatelessWidget {
  const ArticleImageView({Key? key, required this.imageURL}) : super(key: key);
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexRate,
      child: SizedBox(
        width: double.infinity,
        child: Hero(
          tag: imageURL,
          child: Image.network(
            imageURL,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
