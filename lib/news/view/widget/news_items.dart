import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_route/Shared/Themes/app_theme.dart';
import 'package:news_app_route/news/data/models/article.dart';
import 'package:news_app_route/news_content/view/screens/news_content.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItems extends StatelessWidget {
  const NewsItems({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = DateTime.now();
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NewsContent.routeName, arguments: article);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * .04,
          vertical: MediaQuery.sizeOf(context).height * .01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              child: Image.network(
                article.urlToImage ??
                    "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                errorBuilder: (context, exception, stackTrace) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                      height: MediaQuery.sizeOf(context).height * .234,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  );
                },
                height: MediaQuery.sizeOf(context).height * .234,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
              article.source?.name ?? "",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 10,
                    color: AppTheme.gray,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
              article.title ?? "",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 14,
                    color: AppTheme.navy,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                timeago.format(article.publishedAt ?? fifteenAgo,
                    allowFromNow: true,
                    locale: AppLocalizations.of(context)!.locale),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 13,
                    ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
          ],
        ),
      ),
    );
  }
}
