import 'package:array_bloc/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemArticleView extends StatelessWidget {
  const ItemArticleView({super.key, required this.article});

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(article.url ?? ""));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * .3,
              fit: BoxFit.cover,
              placeholderFit: BoxFit.cover,
              placeholder: const AssetImage("assets/loading.png"),
              image: NetworkImage(article.urlToImage ?? ""),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/loading.png",
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * .3,
                  fit: BoxFit.cover,
                );
              },
            ),
            Text(
              article.title ?? "No Title",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              article.description ?? "No Description",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              article.publishedAt ?? "No Date",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
